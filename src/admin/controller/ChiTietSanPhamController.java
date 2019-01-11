package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChiTietSanPham")
public class ChiTietSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChiTietSanPhamController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msp = request.getParameter("ID");
		response.setContentType("text/html");  
		ServletContext context=getServletContext();  
		context.setAttribute("msp",msp);  
		response.sendRedirect("Admin/ChiTietSanPham.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
