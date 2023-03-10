package biz.BizImpl;

import biz.TypeDaoBiz;
import dao.DaoImpl.TypeDaoImpl;
import entity.Page;
import entity.Type;

import java.sql.SQLException;
import java.util.List;

public class TypeDaoBizImpl implements TypeDaoBiz {
    TypeDaoImpl typeDao =new TypeDaoImpl();
    @Override
    public int AddType(Type type) throws SQLException {
        return typeDao.AddType(type);
    }

    @Override
    public List<Type> getType(String g_name, Page page, int g_id) throws SQLException {
        return typeDao.getType(g_name,page,g_id);
    }

    @Override
    public int getCount(String g_name) throws Exception {
        return typeDao.getCount(g_name);
    }

    @Override
    public int update(Type type) throws SQLException {
        return typeDao.update(type);
    }

    @Override
    public int deleted(int id) throws SQLException {
        LostDaoBizImpl lostDaoBiz =new LostDaoBizImpl();
        if(lostDaoBiz.getLost(null,null,null,-1,id).size()<=0){
            typeDao.deleted(id);
            return 1;	//删除成功
        }else{
            return 0;    //该主题下有文章
        }
    }
}
