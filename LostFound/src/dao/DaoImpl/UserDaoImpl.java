package dao.DaoImpl;

import dao.BaseDao;
import dao.UserDao;
import entity.Page;
import entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public int AddUser(User user) throws SQLException {
        String sql = "insert into user(u_name,u_password,u_telephone,u_email) values(?,?,?,?)";
        return exceuteUpdate(sql,user.getU_name(),user.getU_password(),user.getU_telephone(),user.getU_email());
    }

    @Override
    public List<User> getUser(String u_name, String u_password,Page page,int u_id) throws SQLException {
        List<User>userList = new ArrayList<>();
        String sql1 = "select * from user";
        String sql2 = "where u_name='"+u_name+"'and u_password='"+u_password+"'";
        String sql3 = "where u_name='"+u_name+"'";
        String sql5 = "select * from user where u_name like"+"'%"+u_name+"%'";
        String sql6 = "where u_id="+u_id;
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        //获得所有信息
        if (u_name==null&&u_password==null&&page==null&&u_id>0){
            resultSet=statement.executeQuery(sql1+" "+sql6);
        }
        //验证用户名是否重复
        else if (u_name!=null&&u_password==null&&page==null&&u_id<0){
            resultSet=statement.executeQuery(sql1+" "+sql3);
        }
        //用户登录
        else if (u_name!=null&&u_password!=null&&page==null&&u_id<0){
            resultSet = statement.executeQuery(sql1+" "+sql2);
        }
        //分页
        else if (u_name==null&&u_password==null&&page!=null&&u_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql1+" "+sql4);
        }
        //分页查询
        else if (u_name!=null&&page!=null&&u_password==null&&u_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql5+" "+sql4);
        }
        while (resultSet.next()){
            User user=new User();
            user.setU_id(resultSet.getInt("u_id"));
            user.setU_name(resultSet.getString("u_name"));
            user.setU_password(resultSet.getString("u_password"));
            user.setU_telephone(resultSet.getString("u_telephone"));
            user.setU_email(resultSet.getString("u_email"));
            userList.add(user);
        }
        Release(connection,statement,preparedStatement,rs);
        return userList;
    }

    @Override
    public int getCount(String user_name) throws Exception {
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        String sql1="select count(*) from user";
        String sql2="where u_name like"+"'%"+user_name+"%'";
        ResultSet resultSet=null;
        if (user_name!=null){
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
    public int update(User user) throws SQLException {
        String sql = "update user set u_password='"+user.getU_password()+"',u_telephone='"+user.getU_telephone()+"',u_email='"+user.getU_email()+"' where u_id ='"+user.getU_id()+"'" ;
        return exceuteUpdate(sql);
    }

    @Override
    public int deleted(int id) throws SQLException {
        String sql = "delete from user where u_id = ?" ;
        return exceuteUpdate(sql,id);
    }
}
