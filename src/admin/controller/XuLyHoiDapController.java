package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.*;
import admin.model.*;

/**
 * Servlet implementation class XuLyHoiDapController
 */
@WebServlet("/XuLyHoiDap")
public class XuLyHoiDapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String HOIDAP = "Admin/HoiDapAdmin.jsp";
	public static final String SUAHOIDAP ="Admin/HoiDap/SuaHoiDap.jsp";
	public static final String TRALOI = "Admin/HoiDap/TraLoiHoiDap.jsp";
	HoiDapDAO hoidap;
	CauHoi hd;
	String url = "";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyHoiDapController() {
		super();
		hoidap = HoiDapDAO.getInstance();
	
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	System.out.println("Vao Day");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		if (action != null) {
			int maHD= Integer.parseInt(request.getParameter("maHD"));
			
			switch (action) {
			case "sua":
				hd= hoidap.timBangMaHD(maHD);
				if(!hd.getTrangThai().startsWith("Da")){
					response.sendRedirect(HOIDAP);
					return;
				}
/*				System.out.println("Cau Hoi: "+hd);
*/				session.setAttribute(BienHang.VALUEHOIDAP, hd);
				ArrayList<CauTraLoi> dsBuocLam = hoidap.getTraLoi(hd.getStt());
/*				System.out.println("dsBuocLam "+dsBuocLam);
*/				String[] buoclam = new String[dsBuocLam.size()];
			String[] hinhanh = new String[dsBuocLam.size()];
				int i =0;
				for (CauTraLoi traloi : dsBuocLam) {
					buoclam[i] = traloi.getNoidung();
					hinhanh[i] = traloi.getHinhanh();
					i++;
				}
				session.setAttribute(BienHang.BUOC1, buoclam);
				session.setAttribute(BienHang.BUOC3, hd.getTraloi());
				session.setAttribute(BienHang.BUOC2, hinhanh);
				session.setAttribute("dstl", dsBuocLam);
				url = SUAHOIDAP;
				break;
			case "traloi":
				hd = hoidap.timBangMaHD(maHD);
				if(hd.getTrangThai().startsWith("Da")){
					response.sendRedirect(HOIDAP);
					return;
				}
				session.removeAttribute(BienHang.BUOC1);
    			session.removeAttribute(BienHang.BUOC2);
    			session.removeAttribute(BienHang.BUOC3);
    			session.removeAttribute(BienHang.THONGBAO);
				session.setAttribute(BienHang.VALUEHOIDAP, hd);
				url = TRALOI;
				break;

			case "xoa":
				hoidap.dsCauHoi.remove(maHD);
//					hoidap.xoa(maHD);
					Map<Integer, CauHoi>ds = hoidap.dsCauHoi;
					session.setAttribute(BienHang.DANHSACHHD, ds);
					response.sendRedirect(HOIDAP);
				break;
			default:
				break;
			}
		/*	request.getRequestDispatcher(url).forward(request, response);		
			return;*/
			response.sendRedirect(url);
		}
		else {
			System.out.println("Action bi null");
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String[] buocLam;
		String noidung;
		buocLam = request.getParameterValues(BienHang.NAMEHOIDAPTL);
		noidung= request.getParameter(BienHang.NOIDUNGHOIDAPTL);
		session.setAttribute(BienHang.BUOC1, buocLam);
		session.setAttribute(BienHang.BUOC3, noidung);
	/*System.out.println(noidung);
	System.out.println(buocLam);*/
		if(action.equals("traloi")){
			System.out.println("Vao Day");
	response.sendRedirect(TRALOI);
		}
		response.sendRedirect(SUAHOIDAP);
	}

}
