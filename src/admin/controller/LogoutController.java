package admin.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LogoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		getServletContext().setAttribute("taiKhoanDaDangNhap", new ArrayList<>());
		HttpSession ssDangXuat = request.getSession(false);
		if (ssDangXuat != null) {
			ssDangXuat.invalidate();
		}
		response.sendRedirect("Admin/index.jsp");
	}

}
