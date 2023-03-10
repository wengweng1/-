package biz;

import entity.Page;
import entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDaoBiz {
    public int AddUser(User user) throws SQLException;
    public List<User> getUser(String u_name, String u_password, Page page,int u_id) throws SQLException;
    int getCount(String user_name) throws Exception;
    int update(User user) throws SQLException;
    int deleted(int id) throws SQLException;
}
