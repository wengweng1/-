package dao.DaoImpl;

import dao.BaseDao;
import dao.FoundDao;
import entity.FoundGoods;
import entity.LostGoods;
import entity.Page;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FoundDaoImpl extends BaseDao implements FoundDao {

    @Override
    public int AddFound(FoundGoods foundGoods) throws SQLException {
        String sql = "insert into found(f_img,f_name,f_sort,f_feature,f_typename,f_place,f_time,f_founder,f_telephone) values(?,?,?,?,?,?,?,?,?)" ;
        return exceuteUpdate(sql,foundGoods.getF_img(),foundGoods.getF_name(),foundGoods.getF_sort(),foundGoods.getF_feature(),foundGoods.getF_typename(),foundGoods.getF_place(),foundGoods.getF_time(),foundGoods.getF_founder(),foundGoods.getF_telephone());
    }

    @Override
    public List<FoundGoods> getFound(String I_loster,String f_name, Page page, int f_id, int f_feature) throws SQLException {
        List<FoundGoods>foundGoodsList =new ArrayList<>();
        String sql1 = "select * from found";
        String sql3 = "where f_name='"+f_name+"'";
        String sql5 = "select * from found where f_name like"+"'%"+f_name+"%'";
        String sql6 = "where f_id="+f_id;
        String sql7 = "where f_feature="+f_feature;
        String sql8 = "select *from found where f_founder='"+I_loster+"'";
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        //获得所有信息通过I_id
        if (f_name==null&&page==null&&f_id>0&&f_feature<0){
            resultSet=statement.executeQuery(sql1+" "+sql6);
        }
        else if (I_loster!=null){
            resultSet =statement.executeQuery(sql8);
        }
        else if (f_name==null&&page==null&&f_id<0&&f_feature>0){
            resultSet=statement.executeQuery(sql1+" "+sql7);
        }
        //验证类名是否重复
        else if (f_name!=null&&page==null&&f_id<0&&f_feature<0){
            resultSet=statement.executeQuery(sql1+" "+sql3);
        }
        //分页
        else if (f_name==null&&page!=null&&f_id<0&&f_feature<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql1+" "+sql4);
        }
        //分页查询
        else if (f_name!=null&&page!=null&&f_id<0&&f_feature<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql5+" "+sql4);
        }
        //获取所有
        else if(f_name==null&&page==null&&f_id<0&&f_feature<0){
            resultSet = statement.executeQuery(sql1);
        }
        while (resultSet.next()){
            FoundGoods foundGoods=new FoundGoods();
            foundGoods.setF_id(resultSet.getInt("f_id"));
            foundGoods.setF_img(resultSet.getString("f_img"));
            foundGoods.setF_name(resultSet.getString("f_name"));
            foundGoods.setF_sort(resultSet.getString("f_sort"));
            foundGoods.setF_feature(resultSet.getInt("f_feature"));
            foundGoods.setF_typename(resultSet.getString("f_typename"));
            foundGoods.setF_place(resultSet.getString("f_place"));
            foundGoods.setF_time(resultSet.getString("f_time"));
            foundGoods.setF_founder(resultSet.getString("f_founder"));
            foundGoods.setF_telephone(resultSet.getString("f_telephone"));
            foundGoodsList.add(foundGoods);
        }
        Release(connection,statement,preparedStatement,rs);
        return foundGoodsList;
    }

    @Override
    public int getCount(String f_name) throws Exception {
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        String sql1="select count(*) from found";
        String sql2="where f_name like"+"'%"+f_name+"%'";
        ResultSet resultSet=null;
        if (f_name!=null){
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
    public int update(FoundGoods foundGoods) throws SQLException {
        String sql = "update found set f_img=?,f_name=?,f_sort=?,f_feature=?,f_typename=?,f_place=?,f_time=?,f_telephone=? where f_id=?";
        return exceuteUpdate(sql,foundGoods.getF_img(),foundGoods.getF_name(),foundGoods.getF_sort(),foundGoods.getF_feature(),foundGoods.getF_typename(),foundGoods.getF_place(),foundGoods.getF_time(),foundGoods.getF_telephone(),foundGoods.getF_id());
    }

    @Override
    public int deleted(int id) throws SQLException {
        String sql = "delete from found where f_id = ?" ;
        return exceuteUpdate(sql,id);
    }

    @Override
    public List<FoundGoods> SortByid(int f_id) throws SQLException {
        List<FoundGoods>foundGoodsList =new ArrayList<>();
        Connection connection=getConnection();
        String sql = "select *FROM found order by f_id = '"+f_id+"' desc,f_id asc";
        Statement statement=connection.createStatement();
        ResultSet resultSet=statement.executeQuery(sql);
        while (resultSet.next()){
            FoundGoods foundGoods=new FoundGoods();
            foundGoods.setF_id(resultSet.getInt("f_id"));
            foundGoods.setF_img(resultSet.getString("f_img"));
            foundGoods.setF_name(resultSet.getString("f_name"));
            foundGoods.setF_sort(resultSet.getString("f_sort"));
            foundGoods.setF_feature(resultSet.getInt("f_feature"));
            foundGoods.setF_typename(resultSet.getString("f_typename"));
            foundGoods.setF_place(resultSet.getString("f_place"));
            foundGoods.setF_time(resultSet.getString("f_time"));
            foundGoods.setF_founder(resultSet.getString("f_founder"));
            foundGoods.setF_telephone(resultSet.getString("f_telephone"));
            foundGoodsList.add(foundGoods);
        }
        Release(connection,statement,preparedStatement,rs);
        return foundGoodsList;
    }
}
