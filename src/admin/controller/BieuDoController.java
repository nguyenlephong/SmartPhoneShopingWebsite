package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/XuLyBieuDo")
public class BieuDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BieuDoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bieuDoTenNSX=request.getParameter("tenNSX");
		ServletContext context = getServletContext();
		context.setAttribute("bieuDoTenNSX", bieuDoTenNSX);
		response.sendRedirect("Admin/TrangChu.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
