package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.KhachHang;

@WebServlet("/DoiMatKhau")
public class DoiMatKhauController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang) session.getAttribute("khachHang");
		String pass = request.getParameter("pass");
		String newpass = request.getParameter("newpass");
		String reps = request.getParameter("renewpass");
		String renewpass = bamMatKhau(reps);
		KhachHang updatePassKH = new KhachHang(kh.getTenTaiKhoan(), renewpass, kh.getTenKhachHang(), kh.getEmail(),
				kh.getDiaChi(), kh.getSdt(), kh.getSoTaiKhoan(), kh.getSoSanPhamDaMua());
		new KhachHangDao().editPass(updatePassKH);
		session.setAttribute("khachHang", updatePassKH);
		response.sendRedirect("thongbao.jsp?action=doimk");
	}

	public static String bamMatKhau(String matKhau) {
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
			hash = hash * 4 + matKhau.charAt(i);
		}
		return hash + "";
	}
}
