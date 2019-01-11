package admin.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.*;
import admin.model.*;

@WebServlet("/Search")
public class XuLyLocTheoAutoComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public XuLyLocTheoAutoComplete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();

		ServletContext contextChucNang = getServletContext();
		String chucNang = (String) contextChucNang.getAttribute("chucNang");

		String email = request.getParameter("email");
		String maSP = request.getParameter("masp");
		String soluong = request.getParameter("slmua");
		String chucNangKhac = request.getParameter("chucNang");

		if (soluong == null || soluong.equals("")) {
			soluong = "1";
		}
		if (chucNangKhac == null) {
			chucNangKhac = "";
		}

		if (chucNang == null || chucNang.equals("")) {
			System.out.println("Không có chức năng");
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// chức năng xóa
		if (chucNangKhac.equals("Xoa")) {
			String id = request.getParameter("id");
			new SanPhamDAO().deleteSanPhamDatHang(id);
			soluong = "0";
			session.removeAttribute("SanPham");
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// Chức năng xuất đơn hàng
		if (chucNangKhac.equals("XuatDonHang")) {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			KhachHang kh = (KhachHang) session.getAttribute("KhachHang");
			ServletContext contextSoThuTuDonHang = getServletContext();
			String stt = (String) contextSoThuTuDonHang.getAttribute("sttDonHang");
			if (stt == null) {
				stt = 10 + "";
			}
			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd");
			String ngayGui = timeFormat.format(today.getTime());
			
			DonHang dh = new DonHang(Integer.parseInt(stt) + new SanPhamDAO().random(3000) + "", "DH" + Integer.parseInt(stt) + new SanPhamDAO().random(3000) + "", ngayGui,
					"Đang xu lý ", kh.getName(), new SanPhamDAO().getSanPhamMuaHang(),
					new SanPhamDAO().tongGiaTienDatHang(), kh.getAddress(), kh.getPhone(), "", kh.getUser(),
					new SanPhamDAO().getSoLuongTong());
			try {
				new DonHangDAO().add(dh);
				session.removeAttribute("KhachHang");
				SanPhamDAO.dsDatHang.removeAll(SanPhamDAO.dsDatHang);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Lổi xuất đơn hàng");
			}
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		} else
		// Chức năng tăng số lượng 1 đơn vị
		if (chucNangKhac.equals("Tang")) {
			soluong = "0";
			String id = request.getParameter("id");
			new SanPhamDAO().tangSoLuong(id);
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// chức năng giảm số lượng 1 đơn vị
		if (chucNangKhac.equals("Giam")) {
			soluong = "0";
			String id = request.getParameter("id");
			new SanPhamDAO().giamSoLuong(id);
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// chức năng đổi khách hàng
		if (chucNangKhac.equals("doiKH")) {
			ServletContext contextdisable = getServletContext();
			contextdisable.setAttribute("disabledButton", "");
			session.removeAttribute("KhachHang");
			SanPhamDAO.dsDatHang.removeAll(SanPhamDAO.dsDatHang);
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// chức năng lọc theo tên
		if (chucNang.equals("LocTheoTen")) {
			KhachHang kh = new KhachHangDAO().find(email);
			ServletContext contextdisable = getServletContext();
			contextdisable.setAttribute("disabledButton", "disabled");
			session.setAttribute("KhachHang", kh);
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else
		// chức năng lọc theo tên sản phẩm
		if (chucNang.equals("LocTheoTenSanPham")) {
			SanPhamDatHang sp = new SanPhamDAO().findProduce(maSP);
			if (sp != null) {
				sp.setSoLuong(soluong);
			}
			session.setAttribute("SanPham", sp);
			response.sendRedirect("Admin/DatHangOnline.jsp");

		} else
		// chức năng thay đổi số lượng sản phẩm
		if (chucNang.equals("changecount")) {
			SanPhamDatHang sp = new SanPhamDAO().findProduce(maSP);
			sp.setSoLuong(soluong);
			session.setAttribute("SanPham", sp);
			response.sendRedirect("Admin/DatHangOnline.jsp");
		} else {
			System.out.println("Chuc nang la: " + chucNang);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
