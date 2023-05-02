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
import java.util.List;

@WebServlet("/findAllUser.do")
public class FindAllUserServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        try {
            List<User> list = userDao.findAll();
            request.setAttribute("list",list);
            request.getRequestDispatcher("userList.jsp").forward(request,response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }

    }
}
