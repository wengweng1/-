package web;

import biz.BizImpl.AdminDaoBizImpl;
import biz.BizImpl.UserDaoBizImpl;
import com.alibaba.fastjson.JSON;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class AdminServlet extends HttpServlet {
    AdminDaoBizImpl adminDaoBiz =new AdminDaoBizImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op=req.getParameter("op");
        if (op==null){
            op = "list";
        }
        if (op.equals("list")) {
            try {
                int page = 1;
                int limit = 10;
                if (req.getParameter("page") != null) {
                    page = Integer.parseInt(req.getParameter("page"));
                }
                if (req.getParameter("limit") != null) {
                    limit = Integer.parseInt(req.getParameter("limit"));
                }
                String user_name = req.getParameter("user_name");
                if (user_name!=null){
                    user_name=req.getParameter("user_name");
                }
                int total = adminDaoBiz.getCount(user_name);
                Page page1 = new Page(page, limit, total);
//                req.getSession().setAttribute("page",page);
                List<Admin> adminList = adminDaoBiz.getAdmin(user_name, null,page1,-1);
                JsonObject object = new JsonObject();
                object.setCode(0);
                object.setMsg("");
                object.setCount(page1.getTotal());
                object.setData(adminList);
                resp.setContentType("application/json;charset =utf-8");
                String jsons = JSON.toJSONString(object);
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("AddAdmin")) {
            String username = req.getParameter("username");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String password = req.getParameter("pass");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            String a_role = "普通管理员";
            Admin admin = new Admin(username, phone, email, pass);
            admin.setA_role(a_role);
            try {
                if (adminDaoBiz.getAdmin(username, null, null, -1).size() > 0) {
//                    回调error
                    resp.setContentType("application/json;charset=utf-8");

                } else {
                    adminDaoBiz.AddAdmin(admin);
                    resp.setContentType("application/text;charset=utf-8");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if (op.equals("DeletedAdmin")) {
            String ids = req.getParameter("ids");
            List<String> idList = Arrays.asList(ids.split(","));
            for (String id : idList) {
                int a_id = Integer.parseInt(id);
                try {
                    adminDaoBiz.deleted(a_id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            resp.setContentType("application/json;charset=utf-8");
            resp.getWriter().print(JSON.toJSONString(R.ok()));
        }
        else if (op.equals("getAdminByid")) {
            int id = Integer.parseInt(req.getParameter("admin_id"));
            Admin admin =new Admin();
            try {
                List list = adminDaoBiz.getAdmin(null,null,null,id);
                for (int i=0;i<list.size();i++){
                    admin = (Admin) list.get(i);
                }
                resp.setContentType("application/json;charset=utf-8");
                resp.getWriter().print(JSON.toJSONString(admin));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(op.equals("updateSubmit")){
            int a_id = Integer.parseInt(req.getParameter("userid"));
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("pass");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            Admin admin = new Admin(username, phone, email, pass);
            admin.setA_id(a_id);
            try {
                adminDaoBiz.update(admin);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            resp.setContentType("application/text;charset=utf-8");

        }
    }
}


