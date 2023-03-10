package web;

import biz.BizImpl.FoundDaoBizImpl;
import biz.BizImpl.LostDaoBizImpl;
import biz.BizImpl.TypeDaoBizImpl;
import com.alibaba.fastjson.JSON;
import entity.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public class FoundServlet extends HttpServlet {
    TypeDaoBizImpl typeDaoBiz =new TypeDaoBizImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        FoundDaoBizImpl foundDaoBiz = new FoundDaoBizImpl();
        req.setCharacterEncoding("utf-8");
        String op = req.getParameter("op");
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
                String i_name = req.getParameter("i_name") == null ? null : req.getParameter("i_name");
                System.out.println(i_name);
                int total = foundDaoBiz.getCount(i_name);
                Page page1 = new Page(page, limit, total);
//                req.getSession().setAttribute("page",page);
                List<FoundGoods> foundGoodsList = foundDaoBiz.getFound(null,i_name, page1, -1, -1);
                JsonObject object = new JsonObject();
                object.setCode(0);
                object.setMsg("");
                object.setCount(page1.getTotal());
                object.setData(foundGoodsList);
                resp.setContentType("application/json;charset =utf-8");
                String jsons = JSON.toJSONString(object);
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("upload")) {
            try {
                uploadFile(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("AddLost")) {
            String img = req.getParameter("img");
            String goodsname = req.getParameter("goodsname");
            int typeId = Integer.parseInt(req.getParameter("typeId"));
            Type type = new Type();
            try {
                List typeList = typeDaoBiz.getType(null, null, typeId);
                type = (Type) typeList.get(0);
                String typename = type.getG_name();
                String desc = req.getParameter("desc");
                String lostaddress = req.getParameter("lostaddress");
                String losttime = req.getParameter("losttime");
                String nikename = req.getParameter("nikename");
                String phone = req.getParameter("phone");
                FoundGoods foundGoods = new FoundGoods(img, goodsname, typeId, typename, desc, lostaddress, losttime, nikename, phone);
                foundDaoBiz.AddFound(foundGoods);
                resp.setContentType("application/json;charset=utf-8");
                String jsons = JSON.toJSONString(R.ok());
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("Deleted")) {
            String ids = req.getParameter("ids");
            List<String> idList = Arrays.asList(ids.split(","));
            for (String id : idList) {
                int i_id = Integer.parseInt(id);
                try {
                    foundDaoBiz.deleted(i_id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            resp.setContentType("application/json;charset=utf-8");
            resp.getWriter().print(JSON.toJSONString(R.ok()));
        }
        else if (op.equals("Deleted1")){
            String ids = req.getParameter("ids");
            String name= req.getParameter("name");
            try {
                out.print("<script type='text/javascript'>" + "alert('确定删除吗？');" +"</script>");
                foundDaoBiz.deleted(Integer.parseInt(ids));
                req.getRequestDispatcher("/LostServlet?op=getlistbyname&name="+name).forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("getByid")) {
            int id = Integer.parseInt(req.getParameter("id"));
            try {
                List<FoundGoods> foundGoodsList = foundDaoBiz.getFound(null,null, null, id, -1);
                FoundGoods foundGoods = foundGoodsList.get(0);
                req.setAttribute("foundGoods", foundGoods);
                resp.setContentType("text/html;charset=utf-8");
                req.getRequestDispatcher("admin/Goods/Find_Goods_edit.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
        else if (op.equals("update")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String img = req.getParameter("img");
            String goodsname = req.getParameter("goodsname");
            int typeId = Integer.parseInt(req.getParameter("typeId"));
            Type type = new Type();
            try {
                List typeList = typeDaoBiz.getType(null, null, typeId);
                type = (Type) typeList.get(0);
                String typename = type.getG_name();
                String desc = req.getParameter("desc");
                String lostaddress = req.getParameter("lostaddress");
                String losttime = req.getParameter("losttime");
                String nikename = req.getParameter("nikename");
                String phone = req.getParameter("phone");
                FoundGoods foundGoods = new FoundGoods(img, goodsname, typeId, typename, desc, lostaddress, losttime, nikename, phone);
                foundGoods.setF_id(id);
                foundDaoBiz.update(foundGoods);
                resp.setContentType("application/json;charset=utf-8");
                String jsons = JSON.toJSONString(R.ok());
                resp.getWriter().print(jsons);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //******************//展示前台数据
        else if (op.equals("getlist")){
            try {
                List<FoundGoods> foundGoodsList = foundDaoBiz.getFound(null,null, null, -1, -1);
                req.getSession().setAttribute("foundGoodsList",foundGoodsList);
                resp.sendRedirect(req.getContextPath()+"/LostAndFound-1/foundpage.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(op.equals("getmessage")){
            int id = Integer.parseInt(req.getParameter("postId"));
            List<FoundGoods> foundGoodsList = null;
            try {
                foundGoodsList = foundDaoBiz.getFound(null,null, null, id, -1);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.getSession().setAttribute("foundGoodsList",foundGoodsList);
            resp.sendRedirect(req.getContextPath()+"/LostAndFound-1/detail.jsp");
        }
        else if (op.equals("searchtxt")){
            String name = req.getParameter("name");
            try {
                List<FoundGoods>foundGoodsList=foundDaoBiz.getFound(null,name,null,-1,-1);
                req.getSession().setAttribute("foundGoodsList",foundGoodsList);
                resp.sendRedirect(req.getContextPath()+"/LostAndFound-1/foundpage.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (op.equals("getbyid")){
            int id= Integer.parseInt(req.getParameter("id"));
            try {
                List<FoundGoods>foundGoodsList=foundDaoBiz.getFound(null,null,null,-1,id);
                req.getSession().setAttribute("foundGoodsList",foundGoodsList);
                resp.sendRedirect(req.getContextPath()+"/LostAndFound-1/foundpage.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void uploadFile(HttpServletRequest req,
                           HttpServletResponse resp) throws Exception {
        //文件上传处理器
        FileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(factory);
        //解析请求信息
        List items=upload.parseRequest(req);
        Iterator it=items.iterator();
        String fileName="";
        if(it.hasNext()){
            FileItem item= (FileItem) it.next();
            fileName=item.getName();
            //获取文件的后缀名
            String suffName= fileName.substring(fileName.lastIndexOf("."));
            //随机生成文件名称
            fileName= UUID.randomUUID()+suffName;
            req.setAttribute("fileName",fileName);
            //真实上传到的文件地址  注意文件夹存在
            String basePath="F:\\images";
            File f=new File(basePath);
            if(!f.exists()){
                f.mkdirs();
            }
            File file=new File(basePath,fileName);
            item.write(file);
        }
        resp.setContentType("application/json;chartset=utf-8");
        String json= JSON.toJSONString(R.ok(fileName,null));
        resp.getWriter().print(json);
    }
}
