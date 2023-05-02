package demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {
    private static String driverClass = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/hadoopdb?serverTimezone=GMT%2B8";
    private static String user = "root";
    private static String password = "xiao9426";
    // 1、加载驱动
    static{
        try {
            System.out.println("-------------加载驱动程序-------------");
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    // 2、创建连接
    public static Connection getConn() throws SQLException {
        Connection conn = DriverManager.getConnection(url,user,password);
        return conn;
    }
    // 3、关闭连接
    public static void close(Connection conn){
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        Connection conn1 = getConn();
        System.out.println(conn1);
        Connection conn2 = getConn();
        System.out.println(conn2);
        conn1.close();
        conn2.close();
    }
}
