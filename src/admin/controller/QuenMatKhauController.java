package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
@WebServlet("/XuLyQuenMatKhau")
public class QuenMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuenMatKhauController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mailAddress = request.getParameter("mailaddress");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			if(!new ThanhVienDAO().sendEmail(mailAddress)){
				out.println("<html lang=\"vi\">\n" +
		                "<head><meta charset=utf-8><title>" + "Quên mật khẩu" + "</title></head>\n" +
		                "<body bgcolor=\"#CCFFCC\">\n" +
		                "<h1 align=\"center\">" + "Mật khẩu của bạn đã được gởi về mail!!!" + "</h1>\n" +
		                "\n <center><a href=\"Admin/index.jsp\">" + "Đăng nhập"+
		                "</a></center></body></html>");
			}else{
				out.println("<html lang=\"vi\">\n" +
		                "<head><meta charset=utf-8><title>" + "Quên mật khẩu" + "</title></head>\n" +
		                "<body bgcolor=\"#CCFFCC\">\n" +
		                "<h1 align=\"center\">" + "Bạn nhập sai thông tin ,vui lòng kiểm tra lại" + "</h1>\n" +
		                "\n <center><a href=\"Admin/QuenMatKhau.jsp\">" + "Trở về"+
		                "</a></center></body></html>");
			}
			//response.sendRedirect("QuenMatKhau.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
