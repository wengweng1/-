package dao.DaoImpl;

import dao.BaseDao;
import dao.TypeDao;
import entity.Admin;
import entity.Page;
import entity.Type;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TypeDaoImpl extends BaseDao implements TypeDao {
    @Override
    public int AddType(Type type) throws SQLException {
        String sql = "insert into good(g_name) values(?)";
        return exceuteUpdate(sql,type.getG_name());
    }

    @Override
    public List<Type> getType(String g_name, Page page, int g_id) throws SQLException {
        List<Type>typeList =new ArrayList<>();
        String sql1 = "select * from good";
        String sql3 = "where g_name='"+g_name+"'";
        String sql5 = "select * from good where g_name like"+"'%"+g_name+"%'";
        String sql6 = "where g_id="+g_id;
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        //获得所有信息
        if (g_name==null&&page==null&&g_id>0){
            resultSet=statement.executeQuery(sql1+" "+sql6);
        }
        //验证类名是否重复
        else if (g_name!=null&&page==null&&g_id<0){
            resultSet=statement.executeQuery(sql1+" "+sql3);
        }
        //分页
        else if (g_name==null&&page!=null&&g_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql1+" "+sql4);
        }
        //分页查询
        else if (g_name!=null&&page!=null&&g_id<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql5+" "+sql4);
        }
        else {
            resultSet=statement.executeQuery(sql1);
        }
        while (resultSet.next()){
            Type type=new Type();
            type.setG_id(resultSet.getInt("g_id"));
            type.setG_name(resultSet.getString("g_name"));
            typeList.add(type);
        }
        Release(connection,statement,preparedStatement,rs);
        return typeList;
    }

    @Override
    public int getCount(String g_name) throws Exception {
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        String sql1="select count(*) from good";
        String sql2="where g_name like"+"'%"+g_name+"%'";
        ResultSet resultSet=null;
        if (g_name!=null){
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
    public int update(Type type) throws SQLException {
        String sql = "update good set g_name='"+type.getG_name()+"'where g_id ='"+type.getG_id()+"'" ;
        return exceuteUpdate(sql);
    }

    @Override
    public int deleted(int id) throws SQLException {
        String sql = "delete from good where g_id = ?" ;
        return exceuteUpdate(sql,id);
    }
}
