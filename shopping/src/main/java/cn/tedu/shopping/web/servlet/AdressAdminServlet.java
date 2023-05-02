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
import java.util.List;

@WebServlet("/address.do")
public class AdressAdminServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String adres = request.getParameter("address");
        String phone = request.getParameter("phone");
        String uid = request.getParameter("uid");
        Address address = new Address();
        address.setUid(uid);
        address.setaddress(adres);
        address.setusername(username);
        address.setPhone(phone);
        AddressDao addressDao = new AddressDao();
        try {
            addressDao.save(address);
            response.sendRedirect("/shopping/findAdress.do?uid="+uid);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("web/500.html");
        }
    }
}
