package cn.tedu.demo.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 *JDBC工具类 管理连接
 */
public class jdbcutil {
    //1.加载驱动
    private static String driverClass = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/hadoopdb?serverTimezone=GMT%2b8";
    private static String user = "root";
    private static String password = "xiao9426";

    static {
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //2.创建连接
    public  static Connection getConn() throws SQLException {
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;
    }



    //3.关闭连接
    public static void close(Connection conn) {
        if (conn != null) {
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
    }
}
