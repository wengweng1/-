package web;

import biz.BizImpl.TypeDaoBizImpl;
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

public class TypeServlet extends HttpServlet {
    TypeDaoBizImpl typeDaoBiz =new TypeDaoBizImpl();
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
                String g_name = req.getParameter("g_name") == null ? null : req.getParameter("g_name");
                int total = typeDaoBiz.getCount(g_name);
                Page page1 = new Page(page, limit, total);
//                req.getSession().setAttribute("page",page);
                List<Type> typeList = typeDaoBiz.getType( g_name,page1,-1);
                JsonObject object = new JsonObject();
                object.setCode(0);
                object.setMsg("");
                object.setCount(page1.getTotal());
                object.setData(typeList);
                resp.setContentType("application/json;charset =utf-8");
                String jsons = JSON.toJSONString(object);
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(op.equals("getAll")){
            List<Type> typeList = null;
            try {
                typeList = typeDaoBiz.getType( null,null,-1);
                resp.setContentType("application/json;charset =utf-8");
                String jsons = JSON.toJSONString(typeList);
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("AddType")) {
            String g_name = req.getParameter("g_name");
            Type type =new Type();
            type.setG_name(g_name);
            try {
                if (typeDaoBiz.getType(g_name, null, -1).size() > 0) {
//                    回调error
                    resp.setContentType("application/json;charset=utf-8");

                } else {
                    typeDaoBiz.AddType(type);
                    resp.setContentType("application/text;charset=utf-8");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if (op.equals("DeletedType")) {
            String ids = req.getParameter("ids");
            List<String> idList = Arrays.asList(ids.split(","));
            for (String id : idList) {
                int g_id = Integer.parseInt(id);
                try {
                    int reslut = typeDaoBiz.deleted(g_id);
                    if (reslut==1){
                        resp.setContentType("application/text;charset=utf-8");

                    }
                    else if (reslut==0){
                        resp.setContentType("application/json;charset=utf-8");

                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else if (op.equals("getTypeByid")) {
            int id = Integer.parseInt(req.getParameter("g_id"));
            Type type =new Type();
            try {
                List list = typeDaoBiz.getType(null,null,id);
                for (int i=0;i<list.size();i++){
                    type = (Type) list.get(i);
                }
                resp.setContentType("application/json;charset=utf-8");
                resp.getWriter().print(JSON.toJSONString(type));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(op.equals("updateSubmit")){
            int a_id = Integer.parseInt(req.getParameter("g_id"));
            String g_name = req.getParameter("g_name");
            Type type =new Type();
            type.setG_id(a_id);
            type.setG_name(g_name);
            try {
                if (typeDaoBiz.getType(g_name, null, -1).size() > 0) {
//                    回调error
                    resp.setContentType("application/json;charset=utf-8");

                } else {
                    typeDaoBiz.update(type);
                    resp.setContentType("application/text;charset=utf-8");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
