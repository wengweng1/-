package biz.BizImpl;

import biz.LostDaoBiz;
import dao.DaoImpl.LostDaoImpl;
import entity.LostGoods;
import entity.Page;

import java.sql.SQLException;
import java.util.List;

public class LostDaoBizImpl implements LostDaoBiz {
    LostDaoImpl lostDao =new LostDaoImpl();
    @Override
    public int AddLost(LostGoods lostGoods) throws SQLException {
        return lostDao.AddLost(lostGoods);
    }

    @Override
    public List<LostGoods> getLost(String I_loster,String I_name, Page page, int I_id, int i_feature) throws SQLException {
        return lostDao.getLost(I_loster,I_name,page,I_id,i_feature);
    }

    @Override
    public int getCount(String I_name) throws Exception {
        return lostDao.getCount(I_name);
    }

    @Override
    public int update(LostGoods lostGoods) throws SQLException {
        return lostDao.update(lostGoods);
    }

    @Override
    public int deleted(int id) throws SQLException {
        return lostDao.deleted(id);
    }

    @Override
    public List<LostGoods> SortByid(int I_id) throws SQLException {
        return lostDao.SortByid(I_id);
    }
}
