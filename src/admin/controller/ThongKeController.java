package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.*;
import admin.model.*;

@WebServlet("/ThongKe")
public class ThongKeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThongKeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");
		if (action == null) {

		} else if (action.equals("DonHangTheoNgay")) {
			String startDate = request.getParameter("startDate");
			Map<String,DonHang> map = new ThongKeDAO().getDonHangTheoNgay(startDate);
			String s="none";
			if(map.size()>0){
				s="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("nd1", s);
			session.setAttribute("date1", startDate);
			 response.sendRedirect("Admin/DonHang/ThongKe.jsp#ngay");
		}
		else if (action.equals("DonHangTheoThang")) {
			String startDate = request.getParameter("startDate");
			Map<String,DonHang> map = new ThongKeDAO().getDonHangTheoThang(startDate);
			String s="none";
			if(map.size()>0){
				s="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("td1", s);
			session.setAttribute("month1", startDate);
			 response.sendRedirect("Admin/DonHang/ThongKe.jsp#thang");
		}
		else if (action.equals("DonHangTheoKhoangNgay")) {
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			// Khi lấy được giá trị của ngày bắt đầu và ngày kết thúc thì mình
			// chuyển 2 chuổi này thành đối tượng,và đồng thời gởi 2 ngày này về
			// lại trang sản phẩm để gọi phương thức thống kê
			Date d1 = ThongKeDAO.changeDate(startDate);
			Date d2 = ThongKeDAO.changeDate(endDate);
			// new ThongKeDAO().danhSachTheoKhoangNgay(DonHangDAO.mapDonHang,
			// d1, d2);
			HttpSession session = request.getSession();
			session.setAttribute("knd1", d1);
			session.setAttribute("knd2", d2);
//			getServletContext().getRequestDispatcher("/Admin/DonHang/ThongKeDonHang.jsp").forward(request, response);
			 response.sendRedirect("Admin/DonHang/ThongKe.jsp#khoangngay");
			 
		}
		else if (action.equals("DonHangTheoTuan")) {
			String week = request.getParameter("week");
			String text = request.getParameter("startDate");
			Map<String,DonHang> map = new ThongKeDAO().getDonHangTheoTuan(week,text);
			String s="none";
			if(map.size()>0){
				s="ok";
			}
			HttpSession session = request.getSession();
			session.setAttribute("wd1", s);
			session.setAttribute("text", text);
			session.setAttribute("week", week);
			 response.sendRedirect("Admin/DonHang/ThongKe.jsp#tuan");
		}
		else if (action.equals("BinhLuan")) {
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			// Khi lấy được giá trị của ngày bắt đầu và ngày kết thúc thì mình
			// chuyển 2 chuổi này thành đối tượng,và đồng thời gởi 2 ngày này về
			// lại trang sản phẩm để gọi phương thức thống kê
			Date d1 = ThongKeDAO.changeDate(startDate);
			Date d2 = ThongKeDAO.changeDate(endDate);
			// new ThongKeDAO().danhSachTheoKhoangNgay(DonHangDAO.mapDonHang,
			// d1, d2);
			HttpSession session = request.getSession();
			session.setAttribute("bld1", d1);
			session.setAttribute("bld2", d2);
			 response.sendRedirect("Admin/BinhLuan/ThongKeBinhLuan.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
