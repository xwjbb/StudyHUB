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

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        System.out.println("用户登录-----");
        String path = request.getContextPath();
        // 获取登录用户输入的账号和密码
        String userName = request.getParameter("lname");
        System.out.println(userName);
        String password = request.getParameter("lwd");
        System.out.println(password);
        //dao
        UserDao userDao = new UserDao();
        try {
            User user = userDao.findByUser(userName,password);
            if (user != null){
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                //request.setAttribute("user",user);
                //request.getRequestDispatcher("web/index.jsp").forward(request,response);
                response.sendRedirect("web/index.jsp");
            }else {
                response.sendRedirect("/web/login.html");
            }
        } catch (SQLException e) {
            response.sendRedirect("/web/500.html");
        }
    }
}
