package biz.BizImpl;

import biz.FoundDaoBiz;
import dao.DaoImpl.FoundDaoImpl;
import entity.FoundGoods;
import entity.Page;

import java.sql.SQLException;
import java.util.List;

public class FoundDaoBizImpl implements FoundDaoBiz {
    FoundDaoImpl foundDao =new FoundDaoImpl();
    @Override
    public int AddFound(FoundGoods foundGoods) throws SQLException {
        return foundDao.AddFound(foundGoods);
    }

    @Override
    public List<FoundGoods> getFound(String f_founder, String f_name, Page page, int f_id, int f_feature) throws SQLException {
        return foundDao.getFound(f_founder,f_name,page,f_id,f_feature);
    }

    @Override
    public int getCount(String f_name) throws Exception {
        return foundDao.getCount(f_name);
    }

    @Override
    public int update(FoundGoods foundGoods) throws SQLException {
        return foundDao.update(foundGoods);
    }

    @Override
    public int deleted(int id) throws SQLException {
        return foundDao.deleted(id);
    }

    @Override
    public List<FoundGoods> SortByid(int f_id) throws SQLException {
        return foundDao.SortByid(f_id);
    }
}
