package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.KhachHang;

@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class LoginWithPlusinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginWithPlusinController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

		if (action == null) {

		} else if (action.equals("Face")) {
			HttpSession session = request.getSession();
			String username = request.getParameter("id");
			String passwd = request.getParameter("id");
			if (username == null || username.equals("")) {
				response.sendRedirect("index.jsp");
			} else {
				String email = request.getParameter("email");
				String soDienThoai = "";
				String diaChi = "";
				String ten = request.getParameter("name");
				String soTaiKhoan = "";
				KhachHang khachHang = new KhachHang(username, passwd, ten, email, diaChi, soDienThoai, soTaiKhoan, 0);
				Map<String, KhachHang> danhSachKhachHang = (Map<String, KhachHang>) session
						.getAttribute("danhSachKhachHang");
				if (danhSachKhachHang == null) {
					danhSachKhachHang = new HashMap<String, KhachHang>();
				}
				danhSachKhachHang.put(khachHang.getTenTaiKhoan(), khachHang);
				if (!danhSachKhachHang.containsKey(username)) {
					KhachHangDao.dangKi(khachHang);
				}
				session.setAttribute("danhSachKhachHang", danhSachKhachHang);
				response.sendRedirect("XuLyDangNhap?username=" + username + "&password=" + passwd);
			}
		} else if (action.equals("Google")) {
            
			HttpSession session = request.getSession();
			String username = request.getParameter("id");
			String passwd = request.getParameter("etag");
			String fullname= request.getParameter("fullName");
			String age= request.getParameter("age");
			String imageURL = request.getParameter("image");
			
			if (username == null || username.equals("")) {
				response.sendRedirect("index.jsp");
			} else {
				String email = request.getParameter("email");
				String soDienThoai = "";
				String diaChi = "";
				String ten = request.getParameter("name");
				String soTaiKhoan = "";
				KhachHang khachHang = new KhachHang(username, passwd, ten, email, diaChi, soDienThoai, soTaiKhoan, 0);
				Map<String, KhachHang> danhSachKhachHang = (Map<String, KhachHang>) session
						.getAttribute("danhSachKhachHang");
				if (danhSachKhachHang == null) {
					danhSachKhachHang = new HashMap<String, KhachHang>();
				}
				danhSachKhachHang.put(khachHang.getTenTaiKhoan(), khachHang);
				if (!danhSachKhachHang.containsKey(username)) {
					KhachHangDao.dangKi(khachHang);
				}
				session.setAttribute("danhSachKhachHang", danhSachKhachHang);
				response.sendRedirect("XuLyDangNhap?username=" + username + "&password=" + passwd);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
