package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TimKiemDao;

/**
 * Servlet implementation class XuLyTimKiem
 */
@WebServlet("/XuLyTimKiem")
public class XuLyTimKiem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyTimKiem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ServletContext context=getServletContext();
		TimKiemDao t=new TimKiemDao();
		t.timkiem=new ArrayList<>();
		String timkiem=request.getParameter("timkiem");
		t.timKiemSP(timkiem);
		if(TimKiemDao.timkiem.size()>0){
			request.getSession().setAttribute("timkiem", TimKiemDao.timkiem);
			response.sendRedirect("timkiem.jsp");
		}else{
			response.sendRedirect("sanphamloi.jsp");
		}
	}

}
