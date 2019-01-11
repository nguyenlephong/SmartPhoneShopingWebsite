package controller;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
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

@WebServlet("/XuLyQuenMK")
public class XuLyQuenMK extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public XuLyQuenMK() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=request.getParameter("mailaddress");
		Map<String, KhachHang> danhSachKhachHang=(Map<String, KhachHang>)session.getAttribute("danhSachKhachHang");
		
		KhachHang khachHang = danhSachKhachHang.values().stream().filter(p->p.getEmail().equals(email)).findFirst().get();
		
		String password="123456";
		khachHang.setMatKhau(bamMatKhau(password));
		new KhachHangDao().editPass(khachHang);
		if(sendMail(email, "Mat khau cua ban la !", password)){
			session.setAttribute("danhSachKhachHang",KhachHangDao.dsKhachHang());
			response.sendRedirect("thongbao.jsp?action=quenmk");
		}
		
	}
    public static String bamMatKhau(String matKhau) {
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
			hash = hash * 4 + matKhau.charAt(i);
		}
		return hash + "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public static boolean sendMail(String to, String subject, String text) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("shopphoneltw@gmail.com", "abcdabcd");
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setFrom(new InternetAddress("shopphoneltw@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
		} catch (MessagingException e) {
			return false;
		}
		return true;
	}

}
