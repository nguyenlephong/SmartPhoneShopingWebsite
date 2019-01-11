package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;

@WebServlet("/Order")
public class DonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DonHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		if (action == null) {
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		} else if (action.equals("Del")) {
			String id = request.getParameter("id");
			UndoDAO.undoOrder.push(DonHangDAO.mapOrder.get(id));
			new DonHangDAO().delete(id);
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		} else 
			//chức năng xóa toàn bộ khách hàng
			if(action.equals("DelAll")){
			new DonHangDAO().delAll();
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		}else
			//chức năng undoAll
			if(action.equals("UndoAll")){
			new DonHangDAO().undo();
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		}else
			//chức năng undoOne
			if(action.equals("UndoOne")){
			new UndoDAO().restoreDeletedOrder();
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
		}else
			if (action.equals("Edit")) {
			String id = new DonHangDAO().random(5000);
			String other_id = request.getParameter("id");
			String date = request.getParameter("date").substring(0,10);
			String name = request.getParameter("name");
			String tenSP = request.getParameter("tenSP");
			String sdt = request.getParameter("sdt");
			String mota = request.getParameter("mota");
			String count = request.getParameter("count");
			String address= request.getParameter("address");
			String status = request.getParameter("status");
			
			DonHang d = new DonHang(id, other_id, date, status, name, tenSP, count, address, sdt, mota,"admin","1");
			new DonHangDAO().edit(d);
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
			} else if (action.equals("Add")) {
			String id = new DonHangDAO().random(5000);
			String other_id = request.getParameter("other_id");
			String date = request.getParameter("date");
			String name = request.getParameter("name");
			String tenSP = request.getParameter("tenSP");
			String mota = request.getParameter("mota");
			String count = request.getParameter("count");
			String address= request.getParameter("address");
			String sdt= request.getParameter("sdt");
			String status = request.getParameter("status");
			
			DonHang d = new DonHang(id, other_id, date, status, name, tenSP, count, address, sdt, mota,"amdin","1");
			new DonHangDAO().add(d);
			response.sendRedirect("Admin/DonHang/DonHang.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
