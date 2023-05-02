package cn.tedu.demo.dao;

import cn.tedu.demo.entity.Article;
import cn.tedu.demo.utils.jdbcutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ArticleDao {
    public void save(Article article) throws SQLException {
        String sql = "INSERT INTO t_article(title,content,created,userid) VALUES(?,?,NOW(),?)";
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setString(1,article.getTitle());
            pstmt.setString(2,article.getContent());
            pstmt.setInt(3,article.getUserId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
    public void delect(Article article) throws SQLException {
        String sql = "DELETE FROM t_article WHERE id=?";
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setInt(1,article.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
    public void update(Article article) throws SQLException {
        String sql = "UPDATE t_article SET title= ?,content=? WHERE id= ?";
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setString(1,article.getTitle());
            pstmt.setString(2, article.getContent());
            pstmt.setInt(3,article.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
    public void findByUserid(int userid) throws SQLException {
        String sql = "SELECT id,title,content,created,userid FROM t_article WHERE userid=?";
        Connection conn = null;
        try {
            conn = jdbcutil.getConn();
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setInt(1,userid);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }finally {
            jdbcutil.close(conn);
        }
    }
}
