package cn.tedu.ums.dao;
import org.junit.Test;
import cn.tedu.ums.entity.User;
import java.sql.SQLException;

public class TestUserDao {
    @Test
    public void testSave() {
        System.out.println("--------------测试保存数据------------");

        User user = new User();
        user.setUserName("user006");
        user.setPassword("123456");
        user.setEmail("user006@tedu.cn");
        user.setPhone("15699782323");


        UserDao userDao = new UserDao();
        try {
            userDao.save(user);
            System.out.println("数据保存成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testDelete() throws SQLException {
        System.out.println("--------------测试删除数据------------");
        int id = 6;
        UserDao userDao = new UserDao();
        userDao.delete(id);
        System.out.println("数据删除成功");
    }
    @Test
    public void testUpdatePassword() throws SQLException {
        int id = 2;
        String newPassword = "1111111";
        UserDao userDao = new UserDao();
        userDao.updatePassword(id, newPassword);
        System.out.println("密码修改成功");
    }
    @Test
    public void testFindByUser() throws SQLException {
        String username = "user01";
        String password = "111111";
        UserDao userDao = new UserDao();
        User user = userDao.findByUser(username,password);
        if (user == null){
            System.out.println("账号或密码错误");
        }else {
            System.out.println(user);
        }
    }
}
