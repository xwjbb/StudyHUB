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

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        System.out.println("用户登录-----");
        // 获取登录用户输入的账号和密码
        String userName = request.getParameter("userName");
        System.out.println(userName);
        String password = request.getParameter("password");
        System.out.println(password);
        //dao
        UserDao userDao = new UserDao();
        try {
            User user = userDao.findByUser(userName,password);
            if (user != null){
                response.sendRedirect("main.html");
            }else {
                response.sendRedirect("login.html");
            }
        } catch (SQLException e) {
            response.sendRedirect("err.html");
        }
    }
}
