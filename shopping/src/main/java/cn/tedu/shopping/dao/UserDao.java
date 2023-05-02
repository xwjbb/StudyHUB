package cn.tedu.shopping.dao;

import cn.tedu.shopping.entity.User;
import cn.tedu.shopping.util.jdbcutil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    public List<User> findAll() throws SQLException {
        List<User> list = new ArrayList<User>();
        String sql = "SELECT id,username,password,email,phone,created,updated FROM t_user";
        Connection conn = null;
        try {
            conn =jdbcutil.getConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                User user = new User();
                //将结果集数据封装到user对象中
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCreated(rs.getTimestamp("created"));
                user.setUpdated(rs.getTimestamp("updated"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
        return list;
    }

    public User findById(int id) throws SQLException {
        String sql = "SELECT id,username,password,email,phone,created,updated FROM t_user WHERE id=?";
        User user = null;
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
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

}
