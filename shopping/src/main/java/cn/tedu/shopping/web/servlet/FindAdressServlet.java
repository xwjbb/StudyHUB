package cn.tedu.shopping.web.servlet;

import cn.tedu.shopping.dao.AddressDao;
import cn.tedu.shopping.entity.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/findAdress.do")
public class FindAdressServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        AddressDao addressDao = new AddressDao();
        try {
            System.out.println(uid);
            List<Address> list = addressDao.findByUid(uid);
            HttpSession session = req.getSession();
            session.setAttribute("list",list);
            resp.sendRedirect("web/addressAdmin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
