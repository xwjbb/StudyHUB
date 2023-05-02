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

@WebServlet("/findByIdUser.do")
public class FindByIdUserServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        int id =Integer.parseInt(strId);
        UserDao userDao = new UserDao();
        try{
            User user = userDao.findById(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("userUpdate.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("err.html");
        }


    }
}
