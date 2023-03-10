package dao;

import entity.Page;
import entity.Type;


import java.sql.SQLException;
import java.util.List;

public interface TypeDao {
    public int AddType(Type type) throws SQLException;
    public List<Type> getType(String g_name, Page page, int g_id) throws SQLException;
    int getCount(String g_name ) throws Exception;
    int update(Type type) throws SQLException;
    int deleted(int id) throws SQLException;
}
