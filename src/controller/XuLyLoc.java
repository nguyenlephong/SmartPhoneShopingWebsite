package controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.LocSanPhamDao;
import model.ThongTinDienThoai;
/**
 * Servlet implementation class XuLyLoc
 */
@WebServlet("/XuLyLoc")
public class XuLyLoc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyLoc() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocSanPhamDao loc = new LocSanPhamDao();
//		ServletContext context=getServletContext();
		LocSanPhamDao.listLoc = new ArrayList<>();
		String chon = request.getParameter("chon");
		String chongia=request.getParameter("chongia");
		String chongia1=request.getParameter("chongia1");
		String locgia=request.getParameter("locgia");
		if(chon!=null){
				loc.chonHang(chon);
				chon=null;
		}else if(chongia!=null&&chongia1!=null){
			loc.locGia(chongia, chongia1);
			chongia=null;
			chongia1=null;
		}else if(locgia!=null){
			loc.sapXepGia(locgia);
			locgia=null;
		}
		if (LocSanPhamDao.listLoc.size()> 0) {
			request.getSession().setAttribute("list", LocSanPhamDao.listLoc);
			response.sendRedirect("loc.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
//		ServletContext context=getServletContext();
		LocSanPhamDao sp=new LocSanPhamDao();
		String xuLyLoc=request.getParameter("xuly");
		if(xuLyLoc.equals("xulyloc1")){
			String tendt=request.getParameter("tendt");
			String giadt=request.getParameter("giadt");
			String camera=request.getParameter("camera");
			String selfie=request.getParameter("selfie");
			String bonhotrong=request.getParameter("bonhotrong");
			int gia1 = 0;
			int gia2 = 0;
			sp.chonHang(tendt);
			if(giadt!=null){
				if(giadt.equals("1den3")){
					gia1=1000000;
					gia2=3000000;
				}else if(giadt.equals("3den8")){
					gia1=3000000;
					gia2=8000000;
				}else if(giadt.equals("8den10")){
					gia1=8000000;
					gia2=10000000;
				}else if(giadt.equals("10den20")){
					gia1=10000000;
					gia2=20000000;
				}
				sp.chonTheoGia(gia1, gia2);;
			}
			if(camera!=null){
				sp.chonCamera(Integer.parseInt(camera));
			}
			if(selfie!=null){
				sp.chonSelfie(Integer.parseInt(selfie));
			}
			if(bonhotrong!=null){
				sp.chonBoNhoTrong(Integer.parseInt(bonhotrong));
			}
			response.setContentType("text/html");
			if(LocSanPhamDao.listLoc.size()>0){
				request.getSession().setAttribute("list", LocSanPhamDao.listLoc);
				response.sendRedirect("loc.jsp");
			}else{
				response.sendRedirect("sanphamloi.jsp");
			}
		}else if(xuLyLoc.equals("xulyloc2")){
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			LocSanPhamDao.listLoc=new ArrayList<>();
			String camerasau = request.getParameter("cmrs");
			String cameratruoc = request.getParameter("cmrt");
			String dungLuongPin = request.getParameter("dungluongpin");
			String boNhoTrong = request.getParameter("bnt");
			if (camerasau == null || camerasau.equals("")) {
				camerasau = "";
			}
			if (cameratruoc == null || cameratruoc.equals("")) {
				cameratruoc = "";
			}
			if (dungLuongPin == null || dungLuongPin.equals("")) {
				dungLuongPin = "";
			}
			if (boNhoTrong == null || boNhoTrong.equals("")) {
				boNhoTrong = "";
			}
			String str = "camerasau" + camerasau + " and  cameratruoc" + cameratruoc + " and Dungluongpin" + dungLuongPin
					+ " and Bonhotrong" + boNhoTrong;
			ArrayList<ThongTinDienThoai> locTheoTinhNang = LocSanPhamDao.locTheoTinhNangCuaDienThoai(str);
			LocSanPhamDao.listLoc=locTheoTinhNang;
			if (LocSanPhamDao.listLoc.size() == 0) {
				response.sendRedirect("sanphamloi.jsp");
			} else {
				request.getSession().setAttribute("list", LocSanPhamDao.listLoc);
				response.sendRedirect("loc.jsp");
			}
		}
		
	}

}
