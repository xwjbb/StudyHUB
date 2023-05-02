package demo1;

import jdk.nashorn.internal.ir.ReturnNode;

import java.sql.*;

public class JdbcDemo05 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String driverClass = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/hadoopdb?serverTimezone=GMT%2B8";
        String root = "root";
        String password = "xiao9426";
        Connection conn = DriverManager.getConnection(url,root,password);
        System.out.println(conn);
        Class.forName(driverClass);
        Statement stmt = conn.createStatement();
        String sql = "SELECT id,username,password,email,phone,created,updated FROM t_user";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next() == true){
            int id = rs.getInt("id");
            String userName = rs.getString("username");
            String userPassword = rs.getString("password");
            String Email = rs.getString("email");
            String Phone = rs.getString("phone");
            Timestamp Created = rs.getTimestamp("created");
            Timestamp Updated = rs.getTimestamp("updated");
            System.out.println(id + " " + userName + " " + userPassword + " " + Email + " " + Phone + " " + Created + " " + Updated);
        }

        if (conn != null){
            conn.close();
        }
    }
}
