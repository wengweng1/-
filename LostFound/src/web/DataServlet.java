package web;

import biz.BizImpl.FoundDaoBizImpl;
import biz.BizImpl.LostDaoBizImpl;
import biz.BizImpl.UserDaoBizImpl;
import com.alibaba.fastjson.JSON;
import dao.DaoImpl.AdminDaoImpl;
import dao.DaoImpl.UserDaoImpl;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;


public class DataServlet extends HttpServlet {
    LostDaoBizImpl lostDaoBiz =new LostDaoBizImpl();
    FoundDaoBizImpl foundDaoBiz =new FoundDaoBizImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        UserDaoImpl userDao = new UserDaoImpl();
        AdminDaoImpl adminDao = new AdminDaoImpl();
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        if (op == null) {
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
                String user_name = req.getParameter("user_name") == null ? null : req.getParameter("user_name");
                int total = userDao.getCount(user_name);
                Page page1 = new Page(page, limit, total);
//                req.getSession().setAttribute("page",page);
                List<User> userList = userDao.getUser(user_name, null, page1, -1);
                JsonObject object = new JsonObject();
                object.setCode(0);
                object.setMsg("");
                object.setCount(page1.getTotal());
                object.setData(userList);
                resp.setContentType("application/json;charset =utf-8");
                String jsons = JSON.toJSONString(object);
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("AddUser")) {
            String username = req.getParameter("username");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String password = req.getParameter("pass");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            User user = new User(username, phone, email, pass);
            UserDaoBizImpl userDaoBiz = new UserDaoBizImpl();
            try {
                if (userDaoBiz.getUser(username, null, null, -1).size() > 0) {
//                    回调error
                    resp.setContentType("application/json;charset=utf-8");

                } else {
                    userDaoBiz.AddUser(user);
                    resp.setContentType("application/text;charset=utf-8");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if (op.equals("DeletedUser")) {
            String ids = req.getParameter("ids");
            List<String> idList = Arrays.asList(ids.split(","));
            for (String id : idList) {
                int u_id = Integer.parseInt(id);
                try {
                    userDao.deleted(u_id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            resp.setContentType("application/json;charset=utf-8");
            resp.getWriter().print(JSON.toJSONString(R.ok()));
        }
        else if (op.equals("getUserByid")) {
            int id = Integer.parseInt(req.getParameter("id"));
            User user =new User();
            try {
                List list = userDao.getUser(null,null,null,id);
                for (int i=0;i<list.size();i++){
                    user = (User) list.get(i);
                }
                resp.setContentType("application/json;charset=utf-8");
                resp.getWriter().print(JSON.toJSONString(user));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(op.equals("updateSubmit")){
            int u_id = Integer.parseInt(req.getParameter("userid"));
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("pass");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            User user = new User(username, phone, email, pass);
            user.setU_id(u_id);
            try {
                userDao.update(user);
                resp.setContentType("application/text;charset=utf-8");

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
