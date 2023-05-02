package cn.tedu.ums.dao;

import cn.tedu.ums.entity.User;
import cn.tedu.ums.utils.jdbcutil;
import com.sun.rowset.JdbcRowSetResourceBundle;

import javax.sql.rowset.JdbcRowSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {


    public void save(User user) throws SQLException {
        String sql = "INSERT INTO t_user(username,password,email,phone,created,updated) VALUES(?,?,?,?,NOW(),NOW())";
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setString(1,user.getUserName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4,user.getPhone());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }

    public void delete(int id) throws SQLException {
        String sql ="DELETE FROM t_user WHERE id=?";
        Connection conn =null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }

    public void updatePassword(int id,String newPassword) throws SQLException {
        String sql = "UPDATE t_user SET PASSWORD=? WHERE id=?";
        Connection conn =null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setString(1,newPassword);
            pstmt.setInt(2,id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }

    public void update(User user) throws SQLException {
        String sql = "UPDATE t_user SET email= ?,phone= ? WHERE id= ?";
        Connection conn =null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getEmail());
            pstmt.setString(2,user.getPhone());
            pstmt.setInt(3,user.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }

    public User findByUser(String userName ,String password) throws SQLException {
        String sql = "SELECT id,username,password,email,phone,created,updated FROM t_user WHERE username=? AND password=?";
        User user = null;
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userName);
            pstmt.setString(2,password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCreated(rs.getTimestamp("created"));
                user.setUpdated(rs.getTimestamp("updated"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
        return user;
    }

    public void findAll(){

    }
}
