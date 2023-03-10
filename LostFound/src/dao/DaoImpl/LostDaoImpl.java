package dao.DaoImpl;

import dao.BaseDao;
import dao.LostDao;
import entity.LostGoods;
import entity.Page;
import entity.Type;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LostDaoImpl extends BaseDao implements LostDao {
    @Override
    public int AddLost(LostGoods lostGoods) throws SQLException {
        String sql = "insert into lost(I_img,I_name,I_sort,I_feature,I_typename,I_place,I_time,I_loster,I_telephone) values(?,?,?,?,?,?,?,?,?)" ;
        return exceuteUpdate(sql,lostGoods.getI_img(),lostGoods.getI_name(),lostGoods.getI_sort(),lostGoods.getI_feature(),lostGoods.getI_typename(),lostGoods.getI_place(),lostGoods.getI_time(),lostGoods.getI_loster(),lostGoods.getI_telephone());
    }

    @Override
    public List<LostGoods> getLost(String I_loster, String I_name, Page page, int I_id,int i_feature) throws SQLException {
        List<LostGoods>lostGoodsList =new ArrayList<>();
        String sql1 = "select * from lost";
        String sql3 = "where I_name='"+I_name+"'";
        String sql5 = "select * from lost where I_name like"+"'%"+I_name+"%'";
        String sql6 = "where I_id="+I_id;
        String sql7 = "where I_feature="+i_feature;
        String sql8 = "select *from lost where I_loster='"+I_loster+"'";

        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        //获得所有信息通过I_id
        if (I_name==null&&page==null&&I_id>0&&i_feature<0){
            resultSet=statement.executeQuery(sql1+" "+sql6);
        }
        else if (I_loster!=null){
            resultSet=statement.executeQuery(sql8);
        }
        else if (I_name==null&&page==null&&I_id<0&&i_feature>0){
            resultSet=statement.executeQuery(sql1+" "+sql7);
        }
        //查询所有
        else if (I_name==null&&page==null&&I_id<0&&i_feature<0){
            resultSet=statement.executeQuery(sql1);
        }
        //通过物品名称查询
        else if (I_name!=null&&page==null&&I_id<0&&i_feature<0){
            resultSet=statement.executeQuery(sql1+" "+sql3);
        }
        //分页
        else if (I_name==null&&page!=null&&I_id<0&&i_feature<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql1+" "+sql4);
        }
        //分页查询
        else if (I_name!=null&&page!=null&&I_id<0&&i_feature<0){
            String sql4=" limit "+page.getBeginPageIndex()+","+page.getPageSize();
            resultSet=statement.executeQuery(sql5+" "+sql4);
        }
        while (resultSet.next()){
            LostGoods lostGoods=new LostGoods();
            lostGoods.setI_id(resultSet.getInt("I_id"));
            lostGoods.setI_img(resultSet.getString("I_img"));
            lostGoods.setI_name(resultSet.getString("I_name"));
            lostGoods.setI_sort(resultSet.getString("I_sort"));
            lostGoods.setI_feature(resultSet.getInt("I_feature"));
            lostGoods.setI_typename(resultSet.getString("I_typename"));
            lostGoods.setI_place(resultSet.getString("I_place"));
            lostGoods.setI_time(resultSet.getString("I_time"));
            lostGoods.setI_loster(resultSet.getString("I_loster"));
            lostGoods.setI_telephone(resultSet.getString("I_telephone"));
            lostGoodsList.add(lostGoods);
        }
        Release(connection,statement,preparedStatement,rs);
        return lostGoodsList;
    }

    @Override
    public int getCount(String I_name) throws Exception {
        Connection connection=getConnection();
        Statement statement=connection.createStatement();
        String sql1="select count(*) from lost";
        String sql2="where I_name like"+"'%"+I_name+"%'";
        ResultSet resultSet=null;
        if (I_name!=null){
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
    public int update(LostGoods lostGoods) throws SQLException {
        String sql = "update lost set I_img=?,I_name=?,I_sort=?,I_feature=?,I_typename=?,I_place=?,I_time=?,I_telephone=? where I_id=?";
        return exceuteUpdate(sql,lostGoods.getI_img(),lostGoods.getI_name(),lostGoods.getI_sort(),lostGoods.getI_feature(),lostGoods.getI_typename(),lostGoods.getI_place(),lostGoods.getI_time(),lostGoods.getI_telephone(),lostGoods.getI_id());
    }

    @Override
    public int deleted(int id) throws SQLException {
        String sql = "delete from lost where I_id = ?" ;
        return exceuteUpdate(sql,id);
    }

    @Override
    public List<LostGoods> SortByid(int I_id) throws SQLException {
        List<LostGoods>lostGoodsList =new ArrayList<>();
        Connection connection=getConnection();
        String sql = "select *FROM lost order by I_id = '"+I_id+"' desc,I_id asc";
        String sql1="select  *from lost";
        Statement statement=connection.createStatement();
        ResultSet resultSet=null;
        if (I_id<0){
            resultSet=statement.executeQuery(sql1);
        }
        else {
            resultSet=statement.executeQuery(sql);
        }

        while (resultSet.next()){
            LostGoods lostGoods=new LostGoods();
            lostGoods.setI_id(resultSet.getInt("I_id"));
            lostGoods.setI_img(resultSet.getString("I_img"));
            lostGoods.setI_name(resultSet.getString("I_name"));
            lostGoods.setI_sort(resultSet.getString("I_sort"));
            lostGoods.setI_feature(resultSet.getInt("I_feature"));
            lostGoods.setI_typename(resultSet.getString("I_typename"));
            lostGoods.setI_place(resultSet.getString("I_place"));
            lostGoods.setI_time(resultSet.getString("I_time"));
            lostGoods.setI_loster(resultSet.getString("I_loster"));
            lostGoods.setI_telephone(resultSet.getString("I_telephone"));
            lostGoodsList.add(lostGoods);
        }
        Release(connection,statement,preparedStatement,rs);
        return lostGoodsList;
    }
}
