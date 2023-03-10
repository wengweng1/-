package biz.BizImpl;

import biz.UserDaoBiz;
import dao.DaoImpl.UserDaoImpl;
import entity.Page;
import entity.User;

import java.sql.SQLException;
import java.util.List;

public class UserDaoBizImpl implements UserDaoBiz {
    UserDaoImpl userDao =new UserDaoImpl();
    @Override
    public int AddUser(User user) throws SQLException {
        return userDao.AddUser(user);
    }

    @Override
    public List<User> getUser(String u_name, String u_password,Page page,int u_id) throws SQLException {
        return userDao.getUser(u_name,u_password,page,u_id);
    }

    @Override
    public int getCount(String user_name) throws Exception {
        return userDao.getCount(user_name);
    }

    @Override
    public int update(User user) throws SQLException {
        return userDao.update(user);
    }

    @Override
    public int deleted(int id) throws SQLException {
        return userDao.deleted(id);
    }
}
