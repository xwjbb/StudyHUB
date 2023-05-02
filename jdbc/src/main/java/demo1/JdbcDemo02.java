package demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcDemo02 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String driverClass = "com.mysql.cj.jdbc.Driver";
        System.out.println("加载驱动成功");
        String url = "jdbc:mysql://localhost:3306/hadoopdb?serverTimezone=GMT%2B8";
        String user = "root";
        String password = "xiao9426";

        Class.forName(driverClass);
        Connection conn = DriverManager.getConnection(url,user,password);
        Statement stmt = conn.createStatement();
        String sql = "INSERT INTO t_user(username,password,email,phone,created,updated) "+"VALUES('user004','123456','user@tedu.cn','15699783001',now(),now())";
        int i = stmt.executeUpdate(sql);
        if (i > 0){
            System.out.println("数据保存成功!");
        }
        conn.close();
    }
}
