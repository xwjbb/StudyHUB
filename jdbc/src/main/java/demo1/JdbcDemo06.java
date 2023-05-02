package demo1;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcDemo06 {
    public static void main(String[] args) throws SQLException {
        Scanner sc = new Scanner(System.in);
        System.out.println("账号:");
        String userName = sc.nextLine();
        System.out.println("密码");
        String password = sc.nextLine();
        sc.close();

        Connection conn = JdbcUtil.getConn();
        Statement stmt = conn.createStatement();
        String sql = "";
    }
}
