package dao;

import entity.Admin;
import entity.Page;
import entity.User;

import java.sql.SQLException;
import java.util.List;

public interface AdminDao {
    public List<Admin> getAdmin(String a_name, String a_password, Page page,int a_id) throws SQLException;
    public int AddAdmin(Admin admin) throws SQLException;
    int getCount(String a_name ) throws Exception;
    int update(Admin admin) throws SQLException;
    int deleted(int id) throws SQLException;
}
