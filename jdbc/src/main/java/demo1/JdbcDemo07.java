package demo1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class JdbcDemo07 {
    public static void main(String[] args) throws SQLException {
        Scanner sc = new Scanner(System.in);
        String userName = sc.nextLine();
        String password = sc.nextLine();
        sc.close();
        Connection conn = JdbcUtil.getConn();

        String sql = "SELECT id,username,password,email,phone,created,updated FROM t_user WHERE username=? AND password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,userName);
        pstmt.setString(2,password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()){
            System.out.println("账号,密码正确!,登入成功,进入主页....");
        }
        else {
            System.out.println("账号,密码不正确");
        }
    }
}
