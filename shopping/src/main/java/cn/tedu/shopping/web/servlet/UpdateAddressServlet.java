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
@WebServlet("/updateAddress.do")
public class UpdateAddressServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        Address address1 = new Address();
        address1.setusername(username);
        address1.setaddress(address);
        address1.setPhone(phone);
        AddressDao addressDao = new AddressDao();
        try {
            addressDao.update(address1);
            resp.sendRedirect("/shopping/findAdress.do");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
