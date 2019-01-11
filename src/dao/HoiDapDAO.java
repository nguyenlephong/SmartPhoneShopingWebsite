package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import model.CauHoi;
import model.CauTraLoi;
import model.ConnectionDB;
import model.SanPham;
import model.ThongTinDienThoai;

public class HoiDapDAO {
	/*
	 * 
	 */
	public static final String path = "image/HoiDap/" ;
public Map<Integer, CauHoi> dsCauHoi;
public Map<Integer, CauHoi> dsCauHoChuaTL ;
public Map<Integer, CauHoi> dsCauHoDaTL ;
public Map<String, CauHoi> dsCauHoiTheoTen;
public Map<Integer, ArrayList<CauTraLoi>> dsTraLoi;
private Connection connect;
private ResultSet rs = null;
private PreparedStatement ps;
private Statement st;
private CauHoi cauHoi;
private TatCaSPDao sanpham;
private ChonSanPhamDao chonsp;
private String sql;
Connections con ;
public HoiDapDAO() {
con = PoolConnect.getInstance().freeConnection();
	connect = con.getConnect();
	sanpham = new TatCaSPDao();
	chonsp = new ChonSanPhamDao();
	dsCauHoi = new HashMap<>();
	dsCauHoChuaTL = new HashMap<>();
	dsCauHoDaTL = new HashMap<>();
	dsTraLoi = new HashMap<>();
	dsCauHoiTheoTen = new HashMap<>();
	getDanhSachCauHoi();
	layCauHoiChuaTL();
//	dsTraLoi = getDanhSachTraLoi();
	sql ="";
	dongThanhPhan();
	PoolConnect.getInstance().getConnectionWork();
}
public String getTime(){
	 String timeStamp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
	 return timeStamp;
}
public void layCauHoiChuaTL(){
	for (Entry<Integer, CauHoi> ch : dsCauHoi.entrySet()) {
		if(!ch.getValue().getTrangThai().startsWith("Da")){
			dsCauHoChuaTL.put(ch.getKey(), ch.getValue());
		}
		dsCauHoDaTL.put(ch.getKey(), ch.getValue());
	}
}
public boolean kiemTraSearch(String chuoiCon,String chuoiCha){
	int count =0,i=0,j=0,index =0;
	chuoiCon.toLowerCase();
	chuoiCha.toLowerCase();
	for ( i = 0; i < chuoiCha.length(); i++) {
		index = i;
		for ( j = 0; j < chuoiCon.length(); j++) {
			if(chuoiCon.charAt(j) == chuoiCha.charAt(index)){
				count++;
				index++;	
				if(count == chuoiCon.length()){
					return true;
				}
			}
			else {
				count =0;
				break;
			}
		}
	}
	return false;
}
public ArrayList<ThongTinDienThoai> timSanPhamLienQuan(String masp){
	ArrayList<ThongTinDienThoai> res = new ArrayList<>();
	String sub = masp.substring(0, 2);
	System.out.println(masp);
	if(sub.equalsIgnoreCase("i0")){
		chonsp.chonSanPham("Iphone");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("SS")){
		chonsp.chonSanPham("Samsung");
		System.out.println("Vao SamSung");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("SN")){
		chonsp.chonSanPham("Sony");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("LG")){
		chonsp.chonSanPham("LG");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("OP")){
		chonsp.chonSanPham("Oppo");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("HT")){
		chonsp.chonSanPham("HTC");
		return res= chonsp.chonTheoNhaSX;
	}
	if(sub.equalsIgnoreCase("HU")){
		chonsp.chonSanPham("Huawei");
		return res= chonsp.chonTheoNhaSX;
	}
	return null;
}
public ThongTinDienThoai timSanPham(String masp){
	try {
		for (ThongTinDienThoai sp : sanpham.tatCa) {
			if(sp.getMaSP().equals(masp)){
				return sp;
			}
		}
	} catch (Exception e) {
		System.out.println("timSanPham "+ e.getMessage());
	}
	return null;
}
public ArrayList<ThongTinDienThoai> getSanPhamHoiNhieu(){
	try {
		ArrayList<String> tmp = timSanPhamHoiNhieu();
		ArrayList<ThongTinDienThoai> res = new ArrayList<>() ;
		for (int i = 0; i < tmp.size(); i++) {
			res.add(timSanPham(tmp.get(i)));
		}
		return res;
	} catch (Exception e) {
		System.out.println("getSanPhamHoiNhieu " +e.getMessage());
	}
	return null;
}
public void taoThanhPhan(String pssql,String stsql){
	try {
		ps = connect.prepareStatement(pssql);
		st=connect.createStatement();
		if(pssql !=null){
			rs = ps.executeQuery();
		}
		if(stsql !=null){
			rs = st.executeQuery(stsql);
		}
		
	} catch (Exception e) {
		System.out.println("taoThanhPhan" +e.getMessage());
		// TODO: handle exception
	}
}
public void dongThanhPhan(){
	try {
		rs.close();
		st.close();
		ps.close();
		connect.close();
		
	} catch (Exception e) {
		System.out.println("dongThanhPhan"+ e.getMessage());
	}
}
public ArrayList<String> timSanPhamHoiNhieu(){
	
	ArrayList<String> res = new ArrayList<>();
	 sql = "SELECT MaSP FROM HoiDap GROUP BY MaSP HAVING COUNT(*) >= 2";
	try {
		st = connect.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			res.add(rs.getString(1));
		}
	} catch (Exception e) {
		System.out.println("timSanPhamHoiNhieu"+e.getMessage());
	}
	/*
	 * grouby nhom lai roi moi dem
	 */
	return res;
}
public ArrayList<CauHoi> getCauHoiQuanTamNhieu(){
	 sql = "select l.MaHD,max(l.LuotXem) from LuotXem_HD l where l.LuotXem >= 80000 GROUP BY l.MaHD ";
	ArrayList<CauHoi> res = new ArrayList<>();
	try {
//		taoThanhPhan(sql, null);
		ps = connect.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()) {
			res.add(dsCauHoi.get(rs.getInt(1)));
		}
		return res;
	} catch (Exception e) {
		System.out.println("getCauHoiQuanTamNhieu" + e.getMessage());
	}
	return null;
}
public ArrayList<CauTraLoi> getTraLoi(int maHD){
	ArrayList<CauTraLoi> res = new ArrayList<>();
	try {
		st = connect.createStatement();
		rs = st.executeQuery(" select * from HoiDapChiTiet where MaHD='"+maHD+"'  ");
		while (rs.next()) {
			res.add(new CauTraLoi(rs.getInt(1), rs.getString(3),path+rs.getString(2)));
		}
		return res;
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("layTraLoi"+e.getMessage());
	}
	return null;
}
public void addCauTraLoi(CauTraLoi traloi){
	try {
		ps = connect.prepareStatement("insert into HoiDapChiTiet values(?,?,?)");
		ps.setInt(1, traloi.getMaHD());
		ps.setString(2, traloi.getHinhanh());
		ps.setString(3, traloi.getNoidung());
		ps.executeUpdate();
	} catch (Exception e) {
		System.out.println("addCauTraLoi" + e.getMessage());
	}
}
//public ArrayList<CauTraLoi> layCauTraLoi(int maHD){
//	
//}
//public Map<Integer, ArrayList<CauTraLoi>> getDanhSachTraLoi(){
//	try {
//		st = connect.createStatement();
//		rs = st.executeQuery(" select * from HoiDap ");
//		while (rs.next()) {
//			dsTraLoi.put(rs.getInt(1),getTraLoi(rs.getInt(1)));
//		}
//	} catch (Exception e) {
//		System.out.println("getDanhSachTraLoi"+e.getMessage());
//	}
//	return dsTraLoi;
//}

public void addCauHoi(CauHoi cauHoi){
	try {
		 // sau nay dung update setHinhAnh= .
		ps = connect.prepareStatement("insert into HoiDap(MaHD,TenHD,NoiDung,TrangThai,MaSP,NguoiDang,NgayDang) values(?,?,?,?,?,?,?)");
		ps.setInt(1, cauHoi.getStt());
		ps.setString(2, cauHoi.getTenCauHoi());
		ps.setString(3, cauHoi.getNoiDung());
		ps.setString(4, cauHoi.getTrangThai());
		ps.setString(5, cauHoi.getMaSanPham());
		ps.setString(6, cauHoi.getNguoiDang());
		ps.setString(7, cauHoi.getNgayDang());
		ps.executeUpdate();
	} catch (Exception e) {
		System.out.println("addCauHoi"+e.getMessage());
	}
}
public void delete(Object obj){
	
}
public CauHoi timCauHoi(int maHD){
	return dsCauHoi.get(maHD);
}
public void getDanhSachCauHoi(){
	try {
		st = connect.createStatement();
		rs = st.executeQuery("select * from HoiDap");
		while (rs.next()) {
			dsCauHoi.put(rs.getInt(1), new CauHoi(rs.getInt(1), rs.getString(5), rs.getString(2), rs.getString(4) ,rs.getString(3), rs.getString(6), rs.getString(7), rs.getString(8)));
			dsCauHoiTheoTen.put(rs.getString(2), new CauHoi(rs.getInt(1), rs.getString(5), rs.getString(2), rs.getString(4) ,rs.getString(3), rs.getString(6), rs.getString(7), rs.getString(8)));
		}
	} catch (Exception e) {
		System.out.println("getDanhSachCauHoi"+e.getMessage());
	}
}

}
