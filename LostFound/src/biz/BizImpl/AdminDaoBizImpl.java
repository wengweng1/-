package biz.BizImpl;

import biz.AdminDaoBiz;
import dao.DaoImpl.AdminDaoImpl;
import entity.Admin;
import entity.Page;

import java.sql.SQLException;
import java.util.List;

public class AdminDaoBizImpl implements AdminDaoBiz {
    AdminDaoImpl adminDao = new AdminDaoImpl();
    @Override
    public List<Admin> getAdmin(String a_name, String a_password, Page page,int a_id) throws SQLException {
        return adminDao.getAdmin(a_name,a_password,page,a_id);
    }

    @Override
    public int AddAdmin(Admin admin) throws SQLException {
        return adminDao.AddAdmin(admin);
    }

    @Override
    public int getCount(String a_name) throws Exception {
        return adminDao.getCount(a_name);
    }

    @Override
    public int update(Admin admin) throws SQLException {
        return adminDao.update(admin);
    }

    @Override
    public int deleted(int id) throws SQLException {
        return adminDao.deleted(id);
    }


}
