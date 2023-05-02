package cn.tedu.shopping.web.servlet;

import cn.tedu.shopping.dao.AddressDao;
import cn.tedu.shopping.entity.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteAddress.do")
public class DeleteAddressServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String srtId = req.getParameter("id");
        String uid = req.getParameter("uid");
        int id = Integer.parseInt(srtId);
        AddressDao addressDao = new AddressDao();
        try {
            addressDao.delete(id);
            resp.sendRedirect("/shopping/findAdress.do?uid="+uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
