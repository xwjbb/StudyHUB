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

@WebServlet("/userUpdate.do")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        HttpSession session = request.getSession();
        int id = Integer.parseInt(strId);
        User user = (User) session.getAttribute("user");
        user.setId(id);
        user.setEmail(email);
        user.setPhone(phone);

        UserDao userDao = new UserDao();
        try {
            userDao.update(user);
            /*
            User nuser = userDao.findById(id);
            request.setAttribute("user",nuser);
            request.getRequestDispatcher("web/personage.jsp").forward(request,response);
             */
            session.setAttribute("user",user);
            response.sendRedirect("web/personage.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("web/500.html");
        }
    }
}
