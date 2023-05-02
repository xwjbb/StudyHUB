package cn.tedu.demo.web.servlet;

import cn.tedu.demo.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteUser.do")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        System.out.println("删除账号-------"+strId);
        int id = Integer.parseInt(strId);
        UserDao userDao = new UserDao();
        try {
            userDao.delete(id);
            response.sendRedirect("findAllUser.do");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("err.html");
        }
    }
}
