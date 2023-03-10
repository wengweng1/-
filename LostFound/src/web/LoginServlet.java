package web;

import biz.BizImpl.AdminDaoBizImpl;
import biz.BizImpl.UserDaoBizImpl;
import entity.Admin;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;


public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String opr = req.getParameter("opr");
        if (opr.equals("login")){
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            String flag = req.getParameter("role");
            if (flag.equals("管理员")){
                AdminDaoBizImpl adminDaoBiz =new AdminDaoBizImpl();
                try {
                    List<Admin> adminList = adminDaoBiz.getAdmin(username,pass,null,-1);
                    if (adminList.size()>0){
                        req.getSession().setAttribute("admin",adminList);
                        req.getRequestDispatcher("/admin/manager.jsp").forward(req,resp);
                    }
                    else {
                        resp.sendRedirect("login.jsp");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else if(flag.equals("用户")){
                //进入用户主界面
                UserDaoBizImpl userDaoBiz =new UserDaoBizImpl();
                try {
                    List<User>userList= userDaoBiz.getUser(username,pass,null,-1);
                    if (userList.size()>0){
                        req.getSession().setAttribute("user",userList);
                        resp.sendRedirect(req.getContextPath()+"/LostAndFound-1/index.jsp");
                    }
                    else {
                        resp.sendRedirect("login.jsp");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else{

            }
        }
        else if (opr.equals("register")){
            String username =req.getParameter("username");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String password =req.getParameter("pass");
            String pass = com.cdvtc.news.util.Md5Util.md5(password);
            User user = new User(username,phone,email,pass);
            UserDaoBizImpl userDaoBiz =new UserDaoBizImpl();
            try {
                if (userDaoBiz.getUser(username,null,null,-1).size()>0){
                    out.print("<script type='text/javascript'>"
                            + "alert('当前用户名已存在，请输入不同的用户名！');"
                            + "location.href='" + req.getContextPath() + "/register.jsp';"
                            + "</script>");
                }
                else {
                    userDaoBiz.AddUser(user);
                    out.print("<script type='text/javascript'>"
                            + "alert('注册成功，返回登录界面！');"
                            + "location.href='" + req.getContextPath() + "/login.jsp';"
                            + "</script>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if (opr.equals("tuichu")){
            req.getSession().invalidate();
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }

    }
}
