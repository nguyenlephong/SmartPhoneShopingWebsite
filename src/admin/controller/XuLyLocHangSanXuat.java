package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;

@WebServlet("/XuLyLocHangSanXuat")
public class XuLyLocHangSanXuat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public XuLyLocHangSanXuat() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String chucNang = request.getParameter("chucNang");
		SanPhamDAO.mapProduct = SanPhamDAO.loadDataProduct();
			// chức năng hiển thị product đã lọc
			if (chucNang.equals("Product")) {
				String id = request.getParameter("id");
				Map<String, SanPham> mapFilter =  NhaSanXuatDAO.getSelectProduct(id);
				SanPhamDAO.mapProduct.clear();
				SanPhamDAO.mapProduct.putAll(mapFilter);
				response.sendRedirect("Admin/SanPham/SanPham.jsp");
			} else
			// chức năng hiển thị tất cả product
			if (chucNang.equals("AllProduct")) {
				SanPhamDAO.mapProduct = SanPhamDAO.loadDataProduct();
				response.sendRedirect("Admin/SanPham/SanPham.jsp");
			}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
