package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;
@WebServlet("/KhachHang")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public KhachHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		
		if(action==null){
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else if(action.equals("Del")){
			String id = request.getParameter("id");
			UndoDAO.undoCustomer.push(KhachHangDAO.mapCustomer.get(id));
			new KhachHangDAO().delete(id);
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else
			//chức năng xóa toàn bộ khách hàng
			if(action.equals("DelAll")){
			new KhachHangDAO().delAll();
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else
			//chức năng undoAll
			if(action.equals("UndoAll")){
			new KhachHangDAO().undo();
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else
			//chức năng undoOne
			if(action.equals("UndoOne")){
			new UndoDAO().restoreDeletedCustomer();
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else
			if(action.equals("Edit")){
			String id= request.getParameter("id");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String stk = request.getParameter("stk");
			new KhachHangDAO().edit(new KhachHang(id, username, password, name, email, address, phone, stk));
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}else if(action.equals("Add")){
			String id= new KhachHangDAO().random(5000);
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address= request.getParameter("address");
			String phone = request.getParameter("phone");
			String stk = request.getParameter("stk");
			new KhachHangDAO().add(new KhachHang(id, username, password, name, email, address, phone, stk));
			response.sendRedirect("Admin/KhachHang/TaiKhoanKH.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
