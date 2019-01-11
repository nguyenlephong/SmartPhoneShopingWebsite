package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import admin.dao.*;
import admin.model.*;
/**
 * Servlet implementation class XuLyHoiDapHinhAnh
 */
@WebServlet("/XuLyHinhAnh")
public class XuLyHoiDapHinhAnh extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HoiDapDAO dao ;
	ArrayList<CauTraLoi> dsTraLoi;
	String[] hinhAnh = new String[10];
	String[] hinhAnhTmp = new String[10];
	String[] fileNames = new String[10];
	ArrayList<CauTraLoi> dsTraLoiLuu ;
	int tmp =0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyHoiDapHinhAnh() {
        super();
        dao = HoiDapDAO.getInstance();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		CauHoi hd = (CauHoi) session.getAttribute(BienHang.VALUEHOIDAP);
/*		System.out.println("Cau Hoi"+ hd);*/
		int maHd= hd.getStt();
		hinhAnhTmp = dao.getDsHinhAnhTraLoi(maHd);
		/*System.out.println("Hinh anh tmp"+ hinhAnhTmp);*/
		hinhAnh =request.getParameterValues(BienHang.HINHANHHOIDAPTL);
/*		System.out.println("Hinh anh Lay Duoc"+ hinhAnh);*/
		if(action == null ){
			hinhAnh = dao.getDsHinhAnhTraLoi(maHd);
			session.setAttribute(BienHang.BUOC2, hinhAnh);
			response.sendRedirect(XuLyHoiDapController.SUAHOIDAP);
		}
		
		/*System.out.println("Hinh anh tmp: "+ Arrays.toString(hinhAnhTmp));
		System.out.println("Hinh Anh: "+Arrays.toString(hinhAnh));*/
	for (int i = 0; i < hinhAnh.length; i++) {
		if(hinhAnh[i].equals("")){
			hinhAnh[i] = hinhAnhTmp[i];
		}
	}
dsTraLoiLuu = (ArrayList<CauTraLoi>) session.getAttribute("dstl");
//	System.out.println("Danh Sach Tra Loi Luu: "+dsTraLoiLuu);
		session.setAttribute(BienHang.BUOC2, hinhAnh);
		String[] buocLam = (String[]) session.getAttribute(BienHang.BUOC1);
		String noidung = (String) session.getAttribute(BienHang.BUOC3);
		/*System.out.println("noi dung 1"+noidung);
		System.out.println("Buoc Lam 1"+Arrays.toString(buocLam));
		System.out.println("hinh Anh 1"+Arrays.toString(hinhAnh));*/
		if(hinhAnh != null && buocLam != null && noidung != null){
			ArrayList<CauTraLoi> dsTraLoi = new ArrayList<>();
			String thongbao = "Sửa Thông Tin Thành Công";
			session.setAttribute(BienHang.THONGBAO, thongbao);
			for (int i = 0; i < buocLam.length; i++) {
				CauTraLoi traloi = new CauTraLoi(buocLam[i], hinhAnh[i],maHd,dsTraLoiLuu.get(i).getStt());
			dsTraLoi.add(traloi);
			}
			if(action.equals("sua")){
			dao.suaTraLoi(dsTraLoi,noidung);
			response.sendRedirect(XuLyHoiDapController.SUAHOIDAP);
			}
			else {
				dao.addCauTraLoi(dsTraLoi,noidung);
				response.sendRedirect(XuLyHoiDapController.TRALOI);
			}
		}
		}
	}
