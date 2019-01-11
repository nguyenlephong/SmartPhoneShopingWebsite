package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.ChiTietDonHang;
import model.KhachHang;
import model.SanPham;
import model.ThongSoKiThuatSanPham;
import model.VerifyUtils;

@WebServlet("/XuLyDangNhap")
public class DangNhapController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<String> taiKhoanDaDangNhap = (List<String>) getServletContext().getAttribute("taiKhoanDaDangNhap");
		String user = request.getParameter("username");
		String passChuaMuaHoa = request.getParameter("password");
		String passwd = bamMatKhau(passChuaMuaHoa);
		ServletContext context = getServletContext();
		String urlRQ = (String) context.getAttribute("url");
		// kiá»ƒm tra biáº¿n valid
		boolean valid = true;
		// kiá»ƒm tra chuá»•i lá»—i
		String error = null;
		String errorCC = null;

		Map<String, KhachHang> ds = (Map<String, KhachHang>) session.getAttribute("danhSachKhachHang");
		// Xu ly kt tk
		if (!ds.containsKey(user) || !ds.get(user).getMatKhau().equals(passwd)) {
			valid = false;
			error = "Tài khoản hoặc mật khẩu không đúng !";
		}
		// Xu ly kt capcha
		if (valid) {
			String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
			valid = VerifyUtils.verify(gRecaptchaResponse);
			if (!valid) {
				errorCC = "Capcha không chính xác !";
			}
		}
		if (valid) {
			KhachHang khachHang = ds.get(user); // tao ra duoc 1 khach hang
			session.setAttribute("khachHang", khachHang); // luu khach hang lai
			session.setMaxInactiveInterval(3000 * 60);
//			Cookie khach = new Cookie("khachHang", URLEncoder.encode(khachHang.getTenKhachHang(), "UTF-8"));
			taiKhoanDaDangNhap.add(user);
			context.setAttribute("taiKhoanDaDangNhap", taiKhoanDaDangNhap);
			session.setAttribute("user", user);
//			response.addCookie(khach);
			String encodedURL = response.encodeRedirectURL(urlRQ);
			response.sendRedirect(encodedURL);
		} else if (!valid) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			if (error != null) {
				request.setAttribute("loiTK", error);
				request.setAttribute("us", user);
				request.setAttribute("ps", passwd);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dangnhap.jsp");
				rd.forward(request, response);
			} else if (errorCC != null) {
				request.setAttribute("loiCC", errorCC);
				request.setAttribute("us", user);
				request.setAttribute("ps", passwd);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dangnhap.jsp");
				rd.forward(request, response);
			}
			valid = true;
			// error=null;
			// errorCC=null;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<String> taiKhoanDaDangNhap = (List<String>) getServletContext().getAttribute("taiKhoanDaDangNhap");
		String user = request.getParameter("username");
		String passwd = request.getParameter("password");
		ServletContext context = getServletContext();
		String urlRQ = (String) context.getAttribute("url");
		Map<String, KhachHang> ds = (Map<String, KhachHang>) session.getAttribute("danhSachKhachHang");
		
		if (ds.containsKey(user) && ds.get(user).getMatKhau().equals(passwd)) { // kiem tra dang nhap
			KhachHang khachHang = ds.get(user); // tao ra duoc 1 khach hang
			session.setAttribute("khachHang", khachHang); // luu khach hang lai
			session.setMaxInactiveInterval(3000 * 60);
//			Cookie khach = new Cookie("khachHang", URLEncoder.encode(khachHang.getTenKhachHang(), "UTF-8"));
//			response.addCookie(khach);
			taiKhoanDaDangNhap.add(user);
			context.setAttribute("taiKhoanDaDangNhap", taiKhoanDaDangNhap);
			session.setAttribute("user", user);
			String encodedURL = response.encodeRedirectURL(urlRQ);
			response.sendRedirect(encodedURL);
		}
	}
	public static String bamMatKhau(String matKhau){
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
		    hash = hash*4 + matKhau.charAt(i);
		}
		return hash+"";
	}
}
