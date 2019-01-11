package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import admin.dao.*;
import admin.model.*;
@WebServlet("/Product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "uploadImg";
	   // upload settings
	   private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
	   private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	   private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	public ProductController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		if (action == null) {
			response.sendRedirect("Admin/SanPham/SanPham.jsp");
		} else if (action.equals("Del")) {
			String maSP = request.getParameter("ID");
			UndoDAO.undoProduct.push(SanPhamDAO.mapProduct.get(maSP));
			new SanPhamDAO().delete(maSP);
			response.sendRedirect("Admin/SanPham/SanPham.jsp");
		} else
			if(action.equals("DelAll")){
				new SanPhamDAO().delAll();
				response.sendRedirect("Admin/SanPham/SanPham.jsp");
			}else
				//chức năng undoAll
				if(action.equals("UndoAll")){
				new SanPhamDAO().undo();
				response.sendRedirect("Admin/SanPham/SanPham.jsp");
			}else
				//chức năng undoOne
				if(action.equals("UndoOne")){
				new UndoDAO().restoreDeletedProduct();
				response.sendRedirect("Admin/SanPham/SanPham.jsp");
			}else
			if (action.equals("Edit")) {
			String maSP = request.getParameter("id");
			String id = new SanPhamDAO().random(3000);
			String ten = request.getParameter("ten");
			String gia = request.getParameter("gia");
			String cnmh = request.getParameter("congnghemanhinh");
			String dpg = request.getParameter("dophangiai");
			String mhrong = request.getParameter("dorongmanhinh");
			String camUng = request.getParameter("camUng");
			String cmrt = request.getParameter("cmrt");
			String cmrs = request.getParameter("cmrs");
			String den = request.getParameter("den");
			String hdh = request.getParameter("hedieuhanh");
			String cpu = request.getParameter("cpu");
			String ram = request.getParameter("ram");
			String boNhoTrong = request.getParameter("boNhoTrong");
			String theNho = request.getParameter("theNho");
			String ketnoimang = request.getParameter("ketnoimang");
			String theSim = request.getParameter("theSim");
			String wifi = request.getParameter("wifi");
			String gps = request.getParameter("gps");
			String chatlieu = request.getParameter("chatlieu");
			String kichThuoc = request.getParameter("kichThuoc");
			String trongluong = request.getParameter("trongluong");
			String pin = request.getParameter("pin");
			String loaipin = request.getParameter("loaibin");
			
			//String imageName = request.getParameter("datafile");
			String linkAnh = "image/ss/samsung galaxy j3.png";
			if(linkAnh.equals("")){
				linkAnh="image/ss/samsung galaxy j3.png";
			}

			SanPham sp = new SanPham(id, maSP, ten, gia, cnmh, dpg, mhrong, camUng, cmrt, cmrs, den, hdh, cpu, ram,
					boNhoTrong, theNho, ketnoimang, theSim, wifi, gps, chatlieu, kichThuoc, trongluong, pin, loaipin,
					linkAnh);

			new SanPhamDAO().edit(sp);
			response.sendRedirect("Admin/SanPham/SanPham.jsp");
		} else if (action.equals("Add")) {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String id = new KhachHangDAO().random(5000);
			
			String imageName = request.getParameter("datafile");
			String linkAnh = new SaveFileDAO().getImageUrl(imageName);
			
			String maSP = request.getParameter("maSP");
			String ten = request.getParameter("ten");
			String gia = request.getParameter("gia");
			String cnmh = request.getParameter("congnghemanhinh");
			String dpg = request.getParameter("dophangiai");
			String mhrong = request.getParameter("dorongmanhinh");
			String camUng = request.getParameter("camUng");
			String cmrt = request.getParameter("cmrt");
			String cmrs = request.getParameter("cmrs");
			String den = request.getParameter("den");
			String hdh = request.getParameter("hedieuhanh");
			String cpu = request.getParameter("cpu");
			String ram = request.getParameter("ram");
			String boNhoTrong = request.getParameter("boNhoTrong");
			String theNho = request.getParameter("theNho");
			String ketnoimang = request.getParameter("ketnoimang");
			String theSim = request.getParameter("theSim");
			String wifi = request.getParameter("wifi");
			String gps = request.getParameter("gps");
			String chatlieu = request.getParameter("chatlieu");
			String kichThuoc = request.getParameter("kichThuoc");
			String trongluong = request.getParameter("trongluong");
			String pin = request.getParameter("pin");
			String loaipin = request.getParameter("loaibin");

			SanPham sp = new SanPham(id, maSP, ten, gia, cnmh, dpg, mhrong, camUng, cmrt, cmrs, den, hdh, cpu, ram,
					boNhoTrong, theNho, ketnoimang, theSim, wifi, gps, chatlieu, kichThuoc, trongluong, pin, loaipin,
					linkAnh);
			new SanPhamDAO().add(sp);
			response.sendRedirect("Admin/SanPham/SanPham.jsp");
		}

	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
