package demo1;



import com.mysql.cj.jdbc.Driver;

import java.sql.SQLException;

public class Hello {
    public static void main(String[] args) throws SQLException {
        Object obj = new Driver();

        System.out.println(obj);
        }
}
