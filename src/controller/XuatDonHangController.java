package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Set;
import dao.MuaHangDAO;
import model.ChiTietDonHang;
import model.DanhSachDonHang;
import model.DonHang;
import model.KhachHang;
import model.SanPham;
import model.ThongTinSanPhamTrongGioHang;
@WebServlet("/XuLyXuatDonHang")
public class XuatDonHangController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		KhachHang khachHang=(KhachHang) session.getAttribute("khachHang");
		Map<String, ThongTinSanPhamTrongGioHang> gioHang = (Map<String, ThongTinSanPhamTrongGioHang>) session.getAttribute("giohang");
		Random random=new Random();
		int maDonHang = random.nextInt(20000000);
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String ngayDatHang = dateFormat.format(date);
		
		String trangThaiGiaoHang = "Đã xuất đơn hàng ngày test Thứ 3 ngày 6-6-2017";
		
		String tenSanPham="";
		
		int tongTien=0;
		
		String diaChiGiaoHang="";
		
		String soDienThoai = "";
		
		int soThuTu=0;
		
		String tenKhachHang="";
		
		for (ThongTinSanPhamTrongGioHang sanPham : gioHang.values()) {
			tenSanPham+=sanPham.getTenSP()+",";
			tongTien+=sanPham.getGia()*sanPham.getSoLuong();
		}
		
		soDienThoai=khachHang.getSdt();
		tenKhachHang=khachHang.getTenKhachHang();
		tenSanPham=tenSanPham.substring(0, tenSanPham.length()-1);
		ChiTietDonHang chiTietDonHang= new ChiTietDonHang(soThuTu, maDonHang+"", ngayDatHang, trangThaiGiaoHang, tenKhachHang, tenSanPham, tongTien, diaChiGiaoHang, soDienThoai, "", 0, khachHang.getTenTaiKhoan()+"Ä�Ã£ xuáº¥t");
		MuaHangDAO.addChiTietDonHang(chiTietDonHang);
		MuaHangDAO.addDonHang(new DonHang(maDonHang+"", ngayDatHang, tenKhachHang, tongTien, soDienThoai, khachHang.getTenTaiKhoan()+"Đã xuất"));
		Map<String, ThongTinSanPhamTrongGioHang> gioHan1g = new HashMap<>();
		session.setAttribute("giohang", gioHan1g);
		guiMatKhauVeMail(khachHang.getEmail(),maDonHang+"");
		response.sendRedirect("thongbao.jsp?action=xuatdonhang");
	}
	
	public static void guiMatKhauVeMail(String email,String maDonHang){
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		Session s = Session.getInstance(p,
				 new javax.mail.Authenticator() {
				 protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication("nhom001.laptrinhweb.shopphone@gmail.com", "abcdabcd");
				 }
				});
		Message msg = new MimeMessage(s);
		try {
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setSubject("Cua hang Shopphone thong tin den ban");
			msg.setText("Cam on ban da mua hang cua chung toi. Ma don hang la : "+ maDonHang+". Chung toi se lien he voi ban trong thoi gian ngan nhat.");
			Transport.send(msg);
		} catch (AddressException e) {
		} catch (MessagingException e) {
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
