package controller;

import java.io.IOException;
import java.net.URLDecoder;
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

@WebServlet("/XuLyDangKy")
public class DangKiController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext context=getServletContext();
		String username = request.getParameter("username");
		String passwdChuaMaHoa = request.getParameter("password");
		String passwd = bamMatKhau(passwdChuaMaHoa);
		String email = request.getParameter("email");
		String soDienThoai = request.getParameter("sdt");
		String diaChi = request.getParameter("diachi");
		String ten = request.getParameter("ten");
		String soTaiKhoan = request.getParameter("sotaikhoan");
		String tenKhachHang=convertFromUTF8(ten);
		KhachHang khachHang = new KhachHang(username, passwd, tenKhachHang, email, diaChi, soDienThoai, soTaiKhoan, 0);
		Map<String, KhachHang> danhSachKhachHang = (Map<String, KhachHang>) session.getAttribute("danhSachKhachHang");
		if(danhSachKhachHang==null){
			danhSachKhachHang=new HashMap<String, KhachHang>();
		}
		danhSachKhachHang.put(khachHang.getTenTaiKhoan(), khachHang);
		KhachHangDao.dangKi(khachHang);
		session.setAttribute("danhSachKhachHang", danhSachKhachHang);
		response.sendRedirect("XuLyDangNhap?username="+username+"&password="+passwd+"&thongtin=dangki");

	}
	
	// Chuyen doi chuoi sang utf -8 
	public static String convertFromUTF8(String s) {
		String out = null;
		try {
			out = new String(s.getBytes("ISO-8859-1"), "UTF-8");
		} catch (java.io.UnsupportedEncodingException e) {
			return null;
		}
		return out;
	}
	public static String bamMatKhau(String matKhau){
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
		    hash = hash*4 + matKhau.charAt(i);
		}
		return hash+"";
	}
}
