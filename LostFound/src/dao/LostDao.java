package dao;

import entity.LostGoods;
import entity.Page;
import entity.Type;

import java.sql.SQLException;
import java.util.List;

public interface LostDao {
    public int AddLost(LostGoods lostGoods) throws SQLException;
    public List<LostGoods> getLost(String I_loster,String I_name, Page page, int I_id,int i_feature) throws SQLException;
    int getCount(String I_name ) throws Exception;
    int update(LostGoods lostGoods) throws SQLException;
    int deleted(int id) throws SQLException;
    public List<LostGoods> SortByid(int I_id) throws SQLException;
}
