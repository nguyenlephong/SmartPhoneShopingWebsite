package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SanPham;
import model.ThongSoKiThuatSanPham;
import model.ThongTinSanPhamTrongGioHang;

@WebServlet("/XuLyMuaHang")
public class XuLyMuaHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = (String) session.getAttribute("url");
		Map<String, ThongSoKiThuatSanPham> dssp = (Map<String, ThongSoKiThuatSanPham>) session.getAttribute("danhsachtatcasanpham");
		String masp = request.getParameter("maSP");
		ThongSoKiThuatSanPham sanPham = dssp.get(masp);
		Map<String, ThongTinSanPhamTrongGioHang> gioHang = (Map<String, ThongTinSanPhamTrongGioHang>) session.getAttribute("giohang");
		
		if(!gioHang.containsKey(masp)){
			ThongTinSanPhamTrongGioHang sanPhamTrongGioHang = new ThongTinSanPhamTrongGioHang(masp, sanPham.getTenSanPham(), 1, Integer.parseInt(sanPham.getGiaSanPham())); 
			gioHang.put(masp, sanPhamTrongGioHang);
		}else{
			ThongTinSanPhamTrongGioHang sanPhamTrongGioHang = gioHang.get(masp);
			sanPhamTrongGioHang.setSoLuong(sanPhamTrongGioHang.getSoLuong()+1);
			gioHang.put(masp, sanPhamTrongGioHang);
		}
		
		session.setAttribute("giohang", gioHang);
		response.sendRedirect(url);
	}
	public static void guiMatKhauVeMail(String email, String tenDienThoai) {
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		Session s = Session.getInstance(p, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("nhom001.laptrinhweb.shopphone@gmail.com", "abcdabcd");
			}
		});
		Message msg = new MimeMessage(s);
		try {
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setText("Cáº£m Æ¡n báº¡n Ä‘Ã£ mua Ä‘iá»‡n thoáº¡i: " + tenDienThoai + " chÃºng tÃ´i sáº½ liÃªn há»‡ vá»›i báº¡n sá»›m nháº¥t !!");
			Transport.send(msg);
		} catch (AddressException e) {
		} catch (MessagingException e) {
		}
	}

	public String laySoLuongMua(String s) {
		String[] str = s.split(" ");
		return str[0].charAt(0) + "";
	}

	public static String layTen(String s) {
		String str = s.split(":")[1];
		String ktr = str.split("---")[0];
		return ktr.trim();
	}
}
