package dao.DaoImpl;

import dao.AdminDao;
import dao.BaseDao;
import entity.Admin;
import entity.Page;
import entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl extends BaseDao implements AdminDao {
    @Override
    public List<Admin> getAdmin(String a_name, String a_password, Page page, int a_id) throws SQLException {
        List<Admin>adminList =new ArrayList<>();
        String sql1 = "select * from admin";
        String sql2 = "where a_name='"+a_name+"'and a_password='"+a_password+"'";
        String sql3 = "where a_name='"+a_name+"'";
        String sql5 = "select * from admin where a_name like"+"'%"+a_name+"%'";
        String sql6 = "where a_id="+a_id;
        String sql7="where a_password'"+a_password+"'";
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        //获得所有信息
        if (a_name==null&&a_password==null&&page==null&&a_id>0){
            resultSet=statement.executeQuery(sql1+" "+sql6);
        }
        else if (a_password!=null&&a_name==null&&page==null&&a_id<0){
            resultSet = statement.executeQuery(sql1+" "+sql7);
        }
        //验证用户名是否重复
        else if (a_name!=null&&a_password==null&&page==null&&a_id<0){
            resultSet=statement.executeQuery(sql1+" "+sql3);
        }
        //用户登录
        else if (a_name!=null&&a_password!=null&&page==null&&a_id<0){
            resultSet = statement.executeQuery(sql1+" "+sql2);
        }
        //分页
        else if (a_name==null&&a_password==null&&page!=null&&a_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql1+" "+sql4);
        }
        //分页查询
        else if (a_name!=null&&page!=null&&a_password==null&&a_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql5+" "+sql4);
        }
        while (resultSet.next()){
            Admin admin=new Admin();
            admin.setA_id(resultSet.getInt("a_id"));
            admin.setA_name(resultSet.getString("a_name"));
            admin.setA_password(resultSet.getString("a_password"));
            admin.setA_telephone(resultSet.getString("a_telephone"));
            admin.setA_email(resultSet.getString("a_email"));
            admin.setA_role(resultSet.getString("a_role"));
            adminList.add(admin);
        }
        Release(connection,statement,preparedStatement,rs);
        return adminList;
    }

    @Override
    public int AddAdmin(Admin admin) throws SQLException {
        String sql = "insert into admin(a_name,a_password,a_telephone,a_email,a_role) values(?,?,?,?,?)";
        return exceuteUpdate(sql,admin.getA_name(),admin.getA_password(),admin.getA_telephone(),admin.getA_email(),admin.getA_role());
    }

    @Override
    public int getCount(String a_name) throws Exception {
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        String sql1="select count(*) from admin";
        String sql2="where a_name like"+"'%"+a_name+"%'";
        ResultSet resultSet=null;
        if (a_name!=null){
            resultSet=statement.executeQuery(sql1+" "+sql2);
        }
        else {
            resultSet=statement.executeQuery(sql1);
        }
        int count=0;
        if(resultSet.next()){
            count = resultSet.getInt(1);
        }
        Release(connection,statement,preparedStatement,rs);
        return count;
    }

    @Override
    public int update(Admin admin) throws SQLException {
        String sql = "update admin set a_password='"+admin.getA_password()+"',a_telephone='"+admin.getA_telephone()+"',a_email='"+admin.getA_email()+"' where a_id ='"+admin.getA_id()+"'" ;
        return exceuteUpdate(sql);
    }

    @Override
    public int deleted(int id) throws SQLException {
        String sql = "delete from admin where a_id = ?" ;
        return exceuteUpdate(sql,id);
    }
}
