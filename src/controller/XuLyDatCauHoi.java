package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyStore.Entry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import dao.ChonSanPhamDao;
import dao.HoiDapDAO;
import dao.TatCaSPDao;
import model.CauHoi;
import model.ThongTinDienThoai;

/**
 * Servlet implementation class XuLyDatCauHoi
 */
@WebServlet("/XuLych")
public class XuLyDatCauHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String CAUHOI= "datcauhoi.jsp";
	private static String THONGTIN= "hoidapchitiet.jsp";
	private static String HOIDAP= "hoidap.jsp";
	private static String SPHOIDAP= "sanphamhoidap.jsp";
	ChonSanPhamDao spDao ;
	HoiDapDAO hdDao;
	TatCaSPDao sp;
	HoiDapDAO dao;
	ArrayList<CauHoi> dsTimThay;
	ArrayList<ThongTinDienThoai> dsTimThaySP;
    ArrayList<ThongTinDienThoai> dsSanPham;
    ArrayList<CauHoi> dsCauHoiQuanTam;
    Map<Integer, CauHoi> dsCauHoi;

    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyDatCauHoi() {
        super();
        spDao = new ChonSanPhamDao();
        hdDao = new HoiDapDAO();
        sp = new TatCaSPDao();
        dao = new HoiDapDAO();
        dsTimThay = new ArrayList<>();
        dsTimThaySP = new ArrayList<>();
         dsCauHoiQuanTam= new ArrayList<>();
			dsCauHoi = dao.dsCauHoi;
        // TODO Auto-generated constructor stub
    }
	public void kiemTra(String data,HttpSession session,String key){
		if(data != null){
			session.setAttribute(key, data);
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String loai = request.getParameter("loaisp");
		HttpSession session = request.getSession();
		String value = request.getParameter("test"); // get value cua textarea
		ArrayList<String> dsLoai  = new ArrayList<>();
		String search = request.getParameter("search");
		String option = request.getParameter("loaisp");
		String maSp = request.getParameter("masp");
		String tenCh = request.getParameter("tench");
		String ten = request.getParameter("ten");
		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
		if(search == null){
			if(maSp == null){
				dsSanPham = dao.getSanPhamHoiNhieu();
				dsCauHoiQuanTam= dao.getCauHoiQuanTamNhieu();
				session.setAttribute("dsSanPham", dsSanPham);
				session.setAttribute("dsCauHoiQuanTam1", dsCauHoiQuanTam);
			}
		if(option == null){
			dsLoai.add("---Chọn Loại Sản Phẩm---");
			dsLoai.add("Iphone");
			dsLoai.add("Samsung");
			dsLoai.add("Sony");
			dsLoai.add("LG");
			dsLoai.add("Oppo");
			dsLoai.add("HTC");
			dsLoai.add("Huawei");
			session.setAttribute("dsLoai", dsLoai);
			response.sendRedirect(CAUHOI);
		}
		else  {
			kiemTra(ten, session, "name");
			kiemTra(sdt, session, "sdt");
			kiemTra(email, session, "email");
			dsLoai =(ArrayList<String>) session.getAttribute("dsLoai");
			if (!dsLoai.contains(option)){
				ThongTinDienThoai spChon = dao.timSanPham(option);
				session.setAttribute("SPChon", spChon);
				if(value == ""){
					response.sendRedirect(CAUHOI);
				}
				else if(value != null) {
					CauHoi ch = new CauHoi(dsCauHoi.size()+6, "Chua Tra Loi", tenCh, value, "", spChon.getMaSP(), ten, dao.getTime());
					dao.addCauHoi(ch);
					response.sendRedirect(HOIDAP);
				}
			}
			else {
			if(option.equalsIgnoreCase("---Chọn Sản Phẩm---")){
				option = "Tatca";
			}
			else {
				if(!spDao.chonTheoNhaSX.isEmpty()){
					spDao.chonTheoNhaSX.clear();
				}
				spDao.chonSanPham(option);
				session.setAttribute("dsSP", spDao.chonTheoNhaSX);
				response.sendRedirect(CAUHOI);
			}
			}
		}
		}
		else { // nguoc lai search k bang null
			Map<String, CauHoi> dsCauHoi = hdDao.dsCauHoiTheoTen;
			Map<String, CauHoi> dsCauHoiTimThay = new HashMap<>();
			for (java.util.Map.Entry<String,CauHoi> entry : dsCauHoi.entrySet()) { // lay ds cac san pham lien quan
				if(hdDao.kiemTraSearch(search, entry.getKey())){
					dsCauHoiTimThay.put(entry.getKey(), entry.getValue());
				}
			}
			if(!dsCauHoiTimThay.isEmpty()){
				session.setAttribute("dsTimThay", dsCauHoiTimThay);
				response.sendRedirect(HOIDAP);
			} 
			// kiem tra chuoi String , trang dang nhap .jsp,kiem tra cau hoi da ton tai chua
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
