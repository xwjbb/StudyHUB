package demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcDemo03 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String driverClass = "com.mysql.cj.jdbc.Driver";
        Class.forName(driverClass);
        System.out.println("加载驱动成功");
        String url = "jdbc:mysql://localhost:3306/hadoopdb";
        String root = "root";
        String password = "xiao9426";
        Connection conn = DriverManager.getConnection(url,root,password);
        System.out.println(conn);
        System.out.println("连接成功");
    }
}
