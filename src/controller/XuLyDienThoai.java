package controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ChonSanPhamDao;

/**
 * Servlet implementation class XuLyDienThoai
 */
@WebServlet("/XuLyDienThoai")
public class XuLyDienThoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	LocGia l=new LocGia();
//	MyConnectDB m=new MyConnectDB();
//	SapXepGia s=new SapXepGia();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyDienThoai() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChonSanPhamDao sp=new ChonSanPhamDao();
		ChonSanPhamDao.chonTheoNhaSX=new ArrayList<>();
		response.setContentType("text/html");
		String iphone=request.getParameter("iphone");
		String samsung=request.getParameter("samsung");
		String lg=request.getParameter("lg");
		String oppo=request.getParameter("oppo");
		String htc=request.getParameter("htc");
		String sony=request.getParameter("sony");
		String huawei=request.getParameter("huawei");
		String tatca=request.getParameter("tatca");
		if(iphone!=null){
			sp.chonSanPham("Iphone");
		}
		if(samsung!=null){
			sp.chonSanPham("Samsung");
		}
		if(lg!=null){
			sp.chonSanPham("LG");
			
		}
		if(sony!=null){
			sp.chonSanPham("Sony");
			
		}
		if(htc!=null){
			sp.chonSanPham("HTC");
			
		}
		
		if(oppo!=null){
			sp.chonSanPham("Oppo");
			
		}
		if(huawei!=null){
		sp.chonSanPham("Huawei");
			
		}
		if(tatca!=null){
			sp.chonSanPham("Tatca");
		}
		if(ChonSanPhamDao.chonTheoNhaSX.size()>0){
			response.sendRedirect("loc.jsp");
		}else{
			response.sendRedirect("sanphamloi.jsp");
		}
		
		}
}
