package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.*;

@WebServlet("/ThemHoaDonNhapKho")
public class ThemHoaDonNhapKhoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThemHoaDonNhapKhoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id="";
		String maNhapKho = request.getParameter("maNhapKho");
		String ngay = request.getParameter("ngay");
		String producer_id = request.getParameter("producer_id");
		String count = request.getParameter("count");
		String name = request.getParameter("name");
		String money = request.getParameter("money");
		PrintWriter out = response.getWriter();
		try {
			ResultSet rs =new MyConnectDB().chonDuLieu("select * from  NhapKho ");
			while (rs.next()) {
				String t = rs.getString(1);
				id=Integer.parseInt(t)+1+"";
			}
			new MyConnectDB().thucThiSQL("insert into  NhapKho  values ('"+id+"','"+maNhapKho+"','"+ngay+"','"+producer_id+"','"+count+"','"+name+"','"+money+"')");
			response.sendRedirect("Admin/KhoHang/NhapKho.jsp");
		} catch (ClassNotFoundException | SQLException e) {
					out.print(e.getMessage());	
					e.printStackTrace();
		} catch (Exception e) {
			out.print(e.getMessage());	
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
