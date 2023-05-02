package cn.tedu.ums.dao;

import cn.tedu.ums.entity.Article;
import org.junit.Test;

import java.sql.SQLException;

public class TestArticleDao {
    @Test
    public void testSave(){
        Article article = new Article();
        article.setTitle("day1log");
        article.setContent("123456789xiaowenjie");
        article.setUserId(0001);
        ArticleDao articleDao = new ArticleDao();
        try{
            articleDao.save(article);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
