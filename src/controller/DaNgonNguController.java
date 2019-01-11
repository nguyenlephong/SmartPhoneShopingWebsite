package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaNgonNguDAO;

/**
 * Servlet implementation class DaNgonNguController
 */
@WebServlet("/DaNgonNguController")
public class DaNgonNguController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DaNgonNguController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lang = request.getParameter("lang");
		HttpSession session = request.getSession();
		if(lang.equals("Vietnam")){
			session.setAttribute("ngonngu", DaNgonNguDAO.vietNam());
		}else{
			session.setAttribute("ngonngu", DaNgonNguDAO.english());
		}
		response.sendRedirect("dangnhap.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
