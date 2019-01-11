package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MuaHangDAO;
import model.ChiTietDonHang;
import model.DonHang;
import model.KhachHang;
import model.SanPham;
import model.ThongTinSanPhamTrongGioHang;

/**
 * Servlet implementation class XuLyDangXuat
 */
@WebServlet("/XuLyDangXuat")
public class DangXuatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DangXuatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession  session=request.getSession();
		System.out.println("user: " + request.getParameter("user"));
		ServletContext context=getServletContext();
		String url =(String) session.getAttribute("url");
//		Cookie[] cookies = request.getCookies();
//		if (cookies != null) {
//			for (Cookie cookie : cookies) {
//				cookie.setMaxAge(0);
//				response.addCookie(cookie);
//			}
//		}
		List<String> ds = (List<String>) getServletContext().getAttribute("taiKhoanDaDangNhap");
		String user = (String) session.getAttribute("user");
		ds.remove(user);
		List<String> dsN = new ArrayList<>();
		getServletContext().setAttribute("taiKhoanDaDangNhap",dsN);
//		System.out.println("Trước khi đăng xuất: " + session.getAttributeNames());
		if (session != null) {
			session.removeAttribute("khachHang");
		}
		Map<String, ThongTinSanPhamTrongGioHang> dss = (Map<String, ThongTinSanPhamTrongGioHang>) session.getAttribute("giohang");
//		session.setAttribute("gioHang", danhSachSanPhamTrongGioHang);
		// no encoding because we have invalidated the session
		session.setAttribute("giohang", dss);
		response.sendRedirect("sanpham.jsp");
	}
}
