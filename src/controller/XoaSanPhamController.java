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

import dao.MuaHangDAO;
import model.KhachHang;
import model.SanPham;
import model.ThongTinSanPhamTrongGioHang;

@WebServlet("/XuLyXoaSanPham")
public class XoaSanPhamController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maSP=request.getParameter("maSP");
		HttpSession session=request.getSession();
		Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPhamDaMua=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang");
		danhSachSanPhamDaMua.remove(maSP);
		session.setAttribute("giohang", danhSachSanPhamDaMua);
		response.sendRedirect("giohang.jsp");
	}
}
