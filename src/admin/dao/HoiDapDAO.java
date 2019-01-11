package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Predicate;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import admin.model.*;
import model.ConnectionDB;

public class HoiDapDAO {
	Connection con;
	PreparedStatement ps;
	Statement st;
	ResultSet rs;
	HoiDap hd;
	public Map<Integer, CauHoi> dsCauHoi;
	public Map<Integer, CauHoi> dsCauHoChuaTL;
	public Map<Integer, CauHoi> dsCauHoDaTL;
	public Map<String, CauHoi> dsCauHoiTheoTen;
	public Map<String, CauHoi> dsHoiDapChiTiet;
	Map<Integer, ArrayList<CauTraLoi>> dsTraLoi;
	MyConnectDB my;
	public int soCauChuaTraLoi = 1, soCauHoiNhieu = 1;
	public int soCauTraLoiSSung =0,soCauChuaTraLoiSSung=0;
	public int soCauTraLoiIP =0,soCauChuaTraLoiIP=0;
	private static HoiDapDAO instance;

	public static HoiDapDAO getInstance() {
		if (instance == null) {
			instance = new HoiDapDAO();
		}
		return instance;
	}

	private HoiDapDAO() {
		try {
			con = new ConnectionDB().getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		dsCauHoi = new HashMap<>();
		dsCauHoChuaTL = new HashMap<>();
		dsCauHoDaTL = new HashMap<>();
		dsCauHoiTheoTen = new HashMap<>();
		dsHoiDapChiTiet = new HashMap<>();
	
		getDanhSachCauHoi();
		// layCauHoiChuaTL();
		/*
		 * List<Map.Entry<Integer, CauHoi>> list = new
		 * LinkedList<Map.Entry<Integer, CauHoi>>(dsCauHoi.entrySet());
		 * Collections.sort(list,((o1,o2) ->
		 * o1.getValue().getTrangThai().compareTo(o2.getValue().getTrangThai()))
		 * ); dsCauHoi =new LinkedHashMap<>(); list.forEach(x
		 * ->dsCauHoi.put(x.getKey(), x.getValue()));
		 */
		// dsCauHoi.forEach((k,v) -> System.out.println("Item : " + k + " Count
		// : " + v));
		dsTraLoi = getDanhSachTraLoi();
		setTrangThai();
		thongKeCauHoi();
	}

	// public void suaCauTraLoi(CauTraLoi traloi){
	// CauTraLoi ct = getTraLoi(traloi.getMaHD());
	// }
	public void setTrangThai() {
		dsCauHoi.forEach((k, v) -> {
			if (v.getLuotXem() >= 50000) {
				soCauHoiNhieu++;
			}
			if (!dsTraLoi.containsKey(k)) {
				v.setTrangThai("Chua Tra Loi");
				dsCauHoChuaTL.put(k, v);
				soCauChuaTraLoi++;
			} else {
				v.setTrangThai("Da Tra Loi");
				dsCauHoDaTL.put(k, v);
			}
		});
	}
	public void thongKeCauHoi(){
		soCauTraLoiSSung = demCauHoiTheoLoai(dsCauHoDaTL.values().stream().collect(Collectors.toList()), p -> p.getMaSanPham().startsWith("SS"));
		soCauChuaTraLoiSSung = demCauHoiTheoLoai(dsCauHoChuaTL.values().stream().collect(Collectors.toList()), p -> p.getMaSanPham().startsWith("SS"));
		soCauTraLoiIP = demCauHoiTheoLoai(dsCauHoDaTL.values().stream().collect(Collectors.toList()), p -> p.getMaSanPham().startsWith("I"));
		soCauChuaTraLoiIP = demCauHoiTheoLoai(dsCauHoChuaTL.values().stream().collect(Collectors.toList()), p -> p.getMaSanPham().startsWith("I"));
	}
public int demCauHoiTheoLoai(List<CauHoi> data,Predicate<CauHoi> dieukien){
	return (int) data.stream()
				.filter(dieukien)
				.count();
				
}
	public Map<Integer, ArrayList<CauTraLoi>> getDanhSachTraLoi() {
		Map<Integer, ArrayList<CauTraLoi>> res = new HashMap<>();
		ArrayList<CauTraLoi> tmp;
		try {
			ps = con.prepareStatement("select * from HoiDapChiTiet");
			rs = ps.executeQuery();
			while (rs.next()) {
				if (res.get(rs.getInt(1)) != null) {
					tmp = res.get(rs.getInt(1));
				} else {
					tmp = new ArrayList<>();
				}
				tmp.add(new CauTraLoi(rs.getString(3), rs.getString(2), rs.getInt(1), rs.getInt(4)));
				res.put(rs.getInt(1), tmp);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getDanhSachTraLoi" + e.getMessage());
		}
		System.out.println("Get Danh Sach Tra Loi Thanh Cong");
		return res;
	}

	public void getDanhSachCauHoi() {
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from HoiDap");
			while (rs.next()) {
				dsCauHoi.put(rs.getInt(1), new CauHoi(rs.getInt(1), rs.getString(5), rs.getString(2), rs.getString(4),
						rs.getString(3), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
				dsCauHoiTheoTen.put(rs.getString(2),
						new CauHoi(rs.getInt(1), rs.getString(5), rs.getString(2), rs.getString(4), rs.getString(3),
								rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
			System.out.println("getDanhSachCauHoi" + e.getMessage());
		}
	}

	public void layCauHoiChuaTL() {
		for (Entry<Integer, CauHoi> ch : dsCauHoi.entrySet()) {
			if (!ch.getValue().getTrangThai().startsWith("Da")) {
				dsCauHoChuaTL.put(ch.getKey(), ch.getValue());
			}
			dsCauHoDaTL.put(ch.getKey(), ch.getValue());
		}
	}

	public void suaTraLoi(ArrayList<CauTraLoi> data, String noidung) {
		try {
			int maHd = data.get(0).getMaHD();
			String hinhAnh, traLoi;
			ps = con.prepareStatement("update  HoiDap set NoiDungTraLoi=? where MaHD=?");
			ps.setString(1, noidung);
			ps.setInt(2, maHd);
			ps.executeUpdate();
			for (CauTraLoi cauTraLoi : data) {
				hinhAnh = cauTraLoi.getHinhanh();
				traLoi = cauTraLoi.getNoidung();
				ps = con.prepareStatement("update  HoiDapChiTiet set HinhAnh=? ,TraLoi= ? where maCH =? ");
				ps.setString(1, hinhAnh);
				ps.setString(2, traLoi);
				ps.setInt(3, cauTraLoi.getStt());
				// System.out.println(hinhAnh+"____"+cauTraLoi.getStt());
				ps.executeUpdate();
			}
			dongThanhPhan();
			return;
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void dongThanhPhan() {
		try {
			rs.close();
			st.close();
			ps.close();
		} catch (Exception e) {
			System.out.println("dongThanhPhan" + e.getMessage());
		}
	}

	public ArrayList<CauTraLoi> getTraLoi(int maHD) {
		ArrayList<CauTraLoi> res = new ArrayList<>();
		try {
			return dsTraLoi.get(maHD);
		} catch (Exception e) {
			System.out.println("layTraLoi" + e.getMessage());
		}
		return null;
	}

	public String[] getDsHinhAnhTraLoi(int mahd) {
		ArrayList<CauTraLoi> dsTL = dsTraLoi.get(mahd);
		String[] res = new String[dsTL.size()];
		int tmp = 0;
		for (CauTraLoi c : dsTL) {
			res[tmp++] = c.getHinhanh();
		}
		return res;
	}

	public String[] getDsBuocTraLoi(int mahd) {
		ArrayList<CauTraLoi> dsTL = dsTraLoi.get(mahd);
		System.out.println(dsTraLoi);
		System.out.println(dsTL);
		if (dsTL != null) {
			String[] res = new String[dsTL.size()];
			int tmp = 0;
			for (CauTraLoi c : dsTL) {
				res[tmp++] = c.getNoidung();
			}
			return res;
		}
		return null;
	}

	// public Map<Integer, ArrayList<CauTraLoi>> getDanhSachTraLoi(){
	// try {
	//
	// for (Entry<Integer, CauHoi> hoiDap : dsCauHoi.entrySet()) {
	// dsTraLoi.put(hoiDap.getKey(),getTraLoi(hoiDap.getKey()));
	// }
	// } catch (Exception e) {
	// System.out.println("getDanhSachTraLoi"+e.getMessage());
	// }
	// return dsTraLoi;
	// }
	public void addCauTraLoi(ArrayList<CauTraLoi> traloi, String noidung) {
		try {
			ps = con.prepareStatement("update  HoiDap set NoiDungTraLoi=? where MaHD=?");
			ps.setString(1, noidung);
			ps.setInt(2, traloi.get(0).getMaHD());
			ps.executeUpdate();
			for (CauTraLoi cauTraLoi : traloi) {
				ps = con.prepareStatement("insert into HoiDapChiTiet values(?,?,?)");
				ps.setInt(1, cauTraLoi.getMaHD());
				ps.setString(2, cauTraLoi.getHinhanh());
				ps.setString(3, cauTraLoi.getNoidung());
				ps.executeUpdate();
			}
			dongThanhPhan();
		} catch (Exception e) {
			System.out.println("addCauTraLoi" + e.getMessage());
		}
		return;
	}

	public CauHoi timBangMaHD(int maHD) {
		try {
			return dsCauHoi.get(maHD);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public boolean them(Object ob) {
		int tmp = 1;
		hd = (HoiDap) ob;
		try {
			con = my.connect();
			ps = con.prepareStatement("insert into HoiDap values( ?,?,?,?,?,?,?,?)");
			ps.setInt(tmp++, hd.getMaHD() + 1);
			ps.setString(tmp++, hd.getTenHD());
			ps.setString(tmp++, hd.getHinhAnh());
			ps.setString(tmp++, hd.getNoiDung());
			ps.setString(tmp++, hd.getMaSP());
			ps.setString(tmp++, hd.getTrangthai());
			ps.setString(tmp++, hd.getNguoiDang());
			ps.setString(tmp++, hd.getNgayDang());
			ps.executeUpdate();
			ps.close();
			con.close();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean xoa(int maHD) {
		try {
			con = my.connect();
			con.prepareStatement("delete from HoiDap where MaHD = '" + maHD + "'    ").executeUpdate();
			con.prepareStatement("delete from HoiDapChiTiet where MaHD = '" + maHD + "'    ").executeUpdate();
			con.prepareStatement("delete from LuotXem_HD where MaHD = '" + maHD + "'    ").executeUpdate();

			// ps=con.prepareStatement("dbcc checkident(HoiDap,reseed,1)"); //
			// '"+maHD+"'
			// ps.executeUpdate();
			// con.prepareStatement("declare @count int FROM
			// [dbo].[HoiDap]").execute();
			// con.prepareStatement("SELECT @count =0 FROM [dbo].[HoiDap]
			// ").execute();
			// con.prepareStatement("UPDATE `HoiDap` SELECT `HoiDap`.`MaHD`=
			// @count:=@count + 1").executeUpdate();
			// ps =con.prepareStatement("declare @max int");
			// ps.executeQuery();
			// ps=con.prepareStatement("select @max = max(maHD) from HoiDap; ");
			// ps.executeQuery();
			// ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	public static void main(String[] args) {
		HoiDapDAO dao = new HoiDapDAO();
		ArrayList<CauTraLoi> dsTraLoi = new ArrayList<>();
		dao.addCauTraLoi(dsTraLoi, "ABCD");
		dao.thongKeCauHoi();
		// System.out.println(dao.add(new HoiDap("25", "CĂ¡ch káº¿t ná»‘i
		// Ä‘iá»‡n thoáº¡i Lenovo Vibe P1 vá»›i mĂ¡y tĂ­nh", "asd", "Trong
		// trÆ°á»�ng há»£p quĂªn máº­t kháº©u ID Apple (iCloud) cĂ¡c",
		// "Chua Tra Loi", "I15092", "Tuan", "3/28/2017")));
		// for (HoiDap hd : dao.layTatCaHoiDap()) {
		// System.out.println(hd.getMaHD());
		// }
	}
}
