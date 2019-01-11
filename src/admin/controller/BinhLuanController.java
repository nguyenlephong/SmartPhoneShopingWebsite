package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.*;
import admin.model.*;

@WebServlet("/BinhLuan")
public class BinhLuanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BinhLuanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		if(action==null){
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}else
			if(action.equals("Del")){
			String id = request.getParameter("id");
			UndoDAO.undoBinhLuan.push(BinhLuanDAO.mapComment.get(id));
			new BinhLuanDAO().delete(id);
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}else
			if(action.equals("DelAll")){
			new BinhLuanDAO().delAll();
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}else
			//chức năng undoAll
			if(action.equals("UndoAll")){
			new BinhLuanDAO().undo();
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}else
			//chức năng undoOne
			if(action.equals("UndoOne")){
			new UndoDAO().restoreDeletedBinhLuan();
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}else
			if(action.equals("Edit")){
			String id= request.getParameter("id");
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String content = request.getParameter("content");
			new BinhLuanDAO().edit(new BinhLuan(id, name, date, content));
			response.sendRedirect("Admin/BinhLuan/BinhLuan.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
