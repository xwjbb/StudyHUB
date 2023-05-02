package cn.tedu.demo.web.servlet;

import cn.tedu.demo.dao.UserDao;
import cn.tedu.demo.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/regist.do")
public class RegistServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("用户注册----");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        UserDao userDao = new UserDao();
        try {
            userDao.save(user);
            response.sendRedirect("login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("err.html");
        }
    }
}
