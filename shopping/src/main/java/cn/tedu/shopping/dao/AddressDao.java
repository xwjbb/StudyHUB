package cn.tedu.shopping.dao;

import cn.tedu.shopping.entity.Address;

import cn.tedu.shopping.util.jdbcutil;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDao {
    public void save(Address address) throws SQLException{
        Connection conn = null;
        String SQL="insert into t_shipping(username,address,phone,uid) values(?,?,?,?)";
        try {
            conn = jdbcutil.getConn();
            PreparedStatement ps=(PreparedStatement)conn.prepareStatement(SQL);
            ps.setString(1, address.getusername());
            ps.setString(2,address.getaddress());
            ps.setString(3,address.getPhone());
            ps.setString(4,address.getUid());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
    public void delete(int id) throws SQLException {
        String sql ="DELETE FROM t_shipping WHERE id=?";
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
    public void update(Address address) throws SQLException {
        String sql = "UPDATE t_shipping SET username=? ,address= ?,phone= ? WHERE uid= ? AND id = ?";
        Connection conn =null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,address.getusername());
            pstmt.setString(2,address.getaddress());
            pstmt.setString(3,address.getPhone());
            pstmt.setString(4,address.getUid());
            pstmt.setInt(5,address.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
    public List<Address> findByUid(String uid) throws SQLException {
        List<Address> list = new ArrayList<Address>();
        String sql = "SELECT id,username,address,phone,created,updated,uid FROM t_shipping WHERE uid= ?";
        Connection conn = null;
        try {
            conn =jdbcutil.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,uid);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Address address = new Address();
                //将结果集数据封装到address对象中
                address.setId(rs.getInt("id"));
                address.setusername(rs.getString("username"));
                address.setaddress(rs.getString("address"));
                address.setPhone(rs.getString("phone"));
                address.setCreated(rs.getTimestamp("created"));
                address.setUpdated(rs.getTimestamp("updated"));
                address.setUid(rs.getString("uid"));
                list.add(address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
        return list;
    }
}
