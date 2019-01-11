package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;

@WebServlet("/Excel")
public class ProcessFileExcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessFileExcelController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html ; charset=utf-8");

		String text = request.getParameter("data");
		String action = request.getParameter("action");
		// String[] s = text.split(",");
		System.out.println(text);
		if (action == null || action.equals("")) {
		} else
		// chức năng import khách hàng từ excel
		if (action.equals("Customer")) {
			Map<String, KhachHang> mapCustomer = new ImportExcelFileDAO(text)
					.getCustomer(new ImportExcelFileDAO(text).getStringArray());
			if (!mapCustomer.isEmpty()) {
				for (KhachHang customer : mapCustomer.values()) {
					new KhachHangDAO().add(customer);
				}
			}
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		} else
		// chức năng import sản phẩm từ excel
		if (action.equals("Product")) {
			System.out.println(text);
			Map<String, SanPham> mapSanPham = new ImportExcelFileDAO(text)
					.getSanPham(new ImportExcelFileDAO(text).getStringArray());
			if (!mapSanPham.isEmpty()) {
				for (SanPham sp : mapSanPham.values()) {
					new SanPhamDAO().add(sp);
				}
			}
			response.sendRedirect("Admin/SanPham/SanPham.jsp");

		} else
		// chức năng import đơn hàng từ excel
		if (action.equals("Comment")) {
			Map<String, BinhLuan> mapBinhLuan = new ImportExcelFileDAO(text)
					.getBinhLuan(new ImportExcelFileDAO(text).getStringArray());
			if (!mapBinhLuan.isEmpty()) {
				for (BinhLuan o : mapBinhLuan.values()) {
					new BinhLuanDAO().add(o);
				}
			}else{
				mapBinhLuan.clear();
			}
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");

		} else {
			// chức năng import đơn hàng từ excel
			if (action.equals("Order")) {
				Map<String, DonHang> mapOrder = new ImportExcelFileDAO(text)
						.getDonHang(new ImportExcelFileDAO(text).getStringArray());
				if (!mapOrder.isEmpty()) {
					for (DonHang o : mapOrder.values()) {
						new DonHangDAO().add(o);
					}
				}
				response.sendRedirect("Admin/DonHang/DonHang.jsp");

			} else {
				// chức năng import đơn hàng từ excel
				if (action.equals("Producer")) {
					Map<String, NhaSanXuat> mapNhaSanXuat = new ImportExcelFileDAO(text)
							.getNhaSanXuat(new ImportExcelFileDAO(text).getStringArray());
					if (!mapNhaSanXuat.isEmpty()) {
						for (NhaSanXuat o : mapNhaSanXuat.values()) {
							new NhaSanXuatDAO().add(o);
						}
					}
					response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");

				} else {
					System.out.println("Rỗng");
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
