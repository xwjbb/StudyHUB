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

@WebServlet("/userUpdate.do")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int id = Integer.parseInt(strId);
        User user = new User();
        user.setId(id);
        user.setEmail(email);
        user.setPhone(phone);
        UserDao userDao = new UserDao();
        try {
            userDao.update(user);
            response.sendRedirect("findAllUser.do");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("err.html");
        }
    }
}
