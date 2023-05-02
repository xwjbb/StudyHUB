package cn.tedu.shopping.web.servlet;

import cn.tedu.shopping.dao.UserDao;
import cn.tedu.shopping.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updatepassword.do")
public class UpdatePasswordServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strid = request.getParameter("id");
        int id = Integer.parseInt(strid);
        String newPassword = request.getParameter("npwd");
        UserDao userDao = new UserDao();
        try {
            userDao.updatePassword(id,newPassword);
            response.sendRedirect("web/login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("web/500.html");
        }

    }
}
