package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.*;

@WebServlet("/SuaNhanVienCaNhan")
public class SuaNhanVienCaNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SuaNhanVienCaNhanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String ngay = request.getParameter("date");
		String chuyennganh = request.getParameter("chuyennganh");
		String web = request.getParameter("web");
		String sothich = request.getParameter("sothich");
		
		try {
			new MyConnectDB().thucThiSQL("update user  set id='" + id + "',username='" + username + "',password='"
					+ password + "',name='" + name + "',email='" + email + "',address='" + address + "',phone='" + phone
					+ "',date='" +ngay+ "',chuyennganh='" +chuyennganh+ "',website='" +web+ "',sothich='" +sothich+ "' where id='" + id + "'");
			response.sendRedirect("Admin/CaNhan.jsp");
		} catch (Exception e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
