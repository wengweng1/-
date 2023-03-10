package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.*;

public class BaseDao {
    //使用ComboPooledDataSource来生成DataSource的实例
    private static ComboPooledDataSource dataSource=null;
    static{
        dataSource=new ComboPooledDataSource();
    }
    protected Connection connection = null;
    protected Statement statement = null;
    protected PreparedStatement preparedStatement = null;
    protected ResultSet rs = null;
    public Connection getConnection() {
        try {
            connection = dataSource.getConnection();
            System.out.println("连接成功！");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public  void Release(Connection connection,Statement statement,PreparedStatement preparedStatement, ResultSet rs) throws SQLException {
        try {
            if (rs!=null){
                rs.close();
            }
            if (preparedStatement !=null){
                preparedStatement.close();
            }
            if (statement !=null){
                statement.close();
            }
            if (connection!=null){
                connection.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public int exceuteUpdate(String sql,Object...prams) throws SQLException {
        int result = 0;
        connection = this.getConnection();
        try{
            preparedStatement = connection.prepareStatement(sql);
            for (int i=0;i<prams.length;i++){
                preparedStatement.setObject(i+1,prams[i]);
            }
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Release(connection,statement,preparedStatement,rs);
        }
        return result;
    }

}
