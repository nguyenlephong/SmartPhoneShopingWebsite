package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ThongTinSanPhamTrongGioHang;


@WebServlet("/ThayDoiSoLuongController")
public class ThayDoiSoLuongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String masp = request.getParameter("masp");
		String soLuog = request.getParameter("soluong-"+masp);
		Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPhamDaMua=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang");
		ThongTinSanPhamTrongGioHang hang = danhSachSanPhamDaMua.get(masp);
//		hang.setSoLuong(Integer.parseInt(soLuog.trim()));
		int a = Integer.parseInt(soLuog.trim());
		hang.setSoLuong(a);
		Map<String, ThongTinSanPhamTrongGioHang> map = new HashMap<>();
		map.putAll(danhSachSanPhamDaMua);
		map.put(masp, hang);
		session.setAttribute("giohang", map);
		Map<String, ThongTinSanPhamTrongGioHang> gio=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang");
		
		response.sendRedirect("giohang.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
