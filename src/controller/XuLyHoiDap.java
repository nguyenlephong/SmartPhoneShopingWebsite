package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoiDapDAO;
import model.CauHoi;
import model.CauTraLoi;
import model.ThongTinDienThoai;

/**
 * Servlet implementation class XuLyHoiDap
 */
@WebServlet("/Xulyhd")
public class XuLyHoiDap extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  HoiDapDAO dao;
	    CauHoi cauhoi;
	    ArrayList<CauTraLoi> dstraloi;
	    ArrayList<ThongTinDienThoai> dsSanPham;
	    ArrayList<ThongTinDienThoai> dsSanPhamLienQuan;
	    Map<Integer, CauHoi> dsCauHoi;
	    ArrayList<CauHoi> dsCauHoiQuanTam;
	 /**
	  * @see HttpServlet#HttpServlet()
	  */
	 public XuLyHoiDap() {
	     super();
	     dao = new HoiDapDAO();
	 }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String mahd = request.getParameter("mahd");
			String action = request.getParameter("action");
			if(action != null){
			if(action.equals("1")){
			
				dsCauHoi = dao.dsCauHoDaTL;
			}
			else if (action.equals("2")) {
				dsCauHoi = dao.dsCauHoChuaTL;
			}
			session.removeAttribute("dsTimThay");
			session.removeAttribute("dsCauHoi1");
			session.setAttribute("dsCauHoi1", dsCauHoi);
			response.sendRedirect("hoidap.jsp");
			return;
			}
			if(mahd == null && action == null){
				dsCauHoi = dao.dsCauHoDaTL;
				dsSanPham = dao.getSanPhamHoiNhieu();
				dsCauHoiQuanTam= dao.getCauHoiQuanTamNhieu();
				session.setAttribute("dsCauHoi1", dsCauHoi);
				session.setAttribute("dsSanPham1", dsSanPham);
				session.setAttribute("dsCauHoiQuanTam1", dsCauHoiQuanTam);
//				request.getRequestDispatcher("hoidap.jsp").forward(request, response);
				response.sendRedirect("hoidap.jsp");
			}
			else {
				int maHD = Integer.parseInt(request.getParameter("mahd"));
				cauhoi= dsCauHoi.get(maHD);
				dstraloi = dao.getTraLoi(maHD);
				System.out.println(dstraloi);
				dsSanPhamLienQuan=dao.timSanPhamLienQuan(cauhoi.getMaSanPham());
	/*			System.out.println(dsSanPhamLienQuan);
	*/			session.setAttribute("cauhoi", cauhoi);
				session.setAttribute("dstraloi", dstraloi);
				session.setAttribute("dsSanPhamLienQuan", dsSanPhamLienQuan);
				response.sendRedirect("hoidapchitiet.jsp");
			}
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		}
}