package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;

@WebServlet("/Producer")
public class ProducerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProducerController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		if (action == null) {
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		} else if (action.equals("Del")) {
			String id = request.getParameter("id");
			UndoDAO.undoNhaSanXuat.push(NhaSanXuatDAO.mapProducer.get(id));
			new NhaSanXuatDAO().delete(id);
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		} else 
			if(action.equals("DelAll")){
			new NhaSanXuatDAO().delAll();
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		}else
			//chức năng undoAll
			if(action.equals("UndoAll")){
			new NhaSanXuatDAO().undo();
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		}else
			//chức năng undoOne
			if(action.equals("UndoOne")){
			new UndoDAO().restoreDeletedProducer();
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		}else
			
			if (action.equals("Edit")) {
			String id =new NhaSanXuatDAO().random(3000);
			String maNSX = request.getParameter("id");
			String maSP = request.getParameter("other_id");
			String tenNSX = request.getParameter("name");
			String address = request.getParameter("address");
			String sdt = request.getParameter("sdt");
			NhaSanXuat nsx = new NhaSanXuat(id, maNSX, maSP, tenNSX, address, sdt);
			new NhaSanXuatDAO().edit(nsx);
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		} else if (action.equals("Add")) {
			String id = new NhaSanXuatDAO().random(5000);
			String maNSX = request.getParameter("maNSX");
			String maSP = request.getParameter("other_id");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String sdt = request.getParameter("sdt");
			NhaSanXuat nsx = new NhaSanXuat(id, maNSX, maSP, name, address, sdt);
			new NhaSanXuatDAO().add(nsx);
			response.sendRedirect("Admin/NhaSanXuat/NhaSanXuat.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
