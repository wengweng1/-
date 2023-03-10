package biz;

import entity.FoundGoods;
import entity.Page;

import java.sql.SQLException;
import java.util.List;

public interface FoundDaoBiz {
    public int AddFound(FoundGoods foundGoods) throws SQLException;
    public List<FoundGoods> getFound(String f_founder, String f_name, Page page, int f_id, int f_feature) throws SQLException;
    int getCount(String f_name ) throws Exception;
    int update(FoundGoods foundGoods) throws SQLException;
    int deleted(int id) throws SQLException;
    public List<FoundGoods> SortByid(int f_id) throws SQLException;
}
