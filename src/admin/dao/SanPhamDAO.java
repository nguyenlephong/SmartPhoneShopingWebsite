package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import admin.model.*;

public class SanPhamDAO implements ObjectDAO {
	public static ArrayList<SanPham> dsSanPham = new ArrayList<>();
	public static ArrayList<SanPhamDatHang> dsDatHang = new ArrayList<>();
	public static Map<String, String> timTenSanPham = new HashMap<>();
	public static Map<String, SanPham> mapProduct = loadDataProduct();
	public static Map<String, SanPham> mapUndo = new HashMap<>();
	
	public SanPhamDAO() {
		// dsSanPham.removeAll(dsSanPham);
		// dsSanPham = getAllSanPham();
	}

	
	
	public boolean delAll() {
		mapUndo.putAll(mapProduct);
		mapProduct.clear();
		return true;
	}

	public boolean undo() {
		mapProduct.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

	public String random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapProduct.containsKey(res)) {
			res = rd.nextInt(limit);
		}
		return res + "";
	}

	public static Map<String, SanPham> loadDataProduct() {
		Map<String, SanPham> map = new HashMap<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from ThongTinChiTiet");
			while (rs.next()) {
				String soThuTu = rs.getString(1);
				String maSanPham = rs.getString(2);
				String tenSanPham = rs.getString(3);
				String giaSanPham = rs.getString(4);
				String congNgheManHinh = rs.getString(5);
				String doPhanGiai = rs.getString(6);
				String manHinhRong = rs.getString(7);
				String matKinhCamUng = rs.getString(8);
				String cameraTruoc = rs.getString(9);
				String cameraSau = rs.getString(10);
				String denFlash = rs.getString(11);
				String heDieuHanh = rs.getString(12);
				String tocDoCPU = rs.getString(13);
				String ram = rs.getString(14);
				String boNhoTrong = rs.getString(15);
				String theNhoNgoai = rs.getString(16);
				String mang = rs.getString(17);
				String sim = rs.getString(18);
				String wifi = rs.getString(19);
				String gps = rs.getString(20);
				String chatLieu = rs.getString(21);
				String kichThuoc = rs.getString(22);
				String trongLuong = rs.getString(23);
				String dungLuongPin = rs.getString(24);
				String loaiPin = rs.getString(25);
				String urlHinhAnh = rs.getString(26);
				SanPham sp = new SanPham(soThuTu, maSanPham, tenSanPham, giaSanPham, congNgheManHinh, doPhanGiai,
						manHinhRong, matKinhCamUng, cameraTruoc, cameraSau, denFlash, heDieuHanh, tocDoCPU, ram,
						boNhoTrong, theNhoNgoai, mang, sim, wifi, gps, chatLieu, kichThuoc, trongLuong, dungLuongPin,
						loaiPin, urlHinhAnh);
				map.put(maSanPham, sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	public String getSanPhamMuaHang() {
		String sp = "";
		for (int i = 0; i < dsDatHang.size(); i++) {
			sp += dsDatHang.get(i).getTenSanPham() + ", ";
		}
		return sp;
	}

	public String tongGiaTienDatHang() {
		String gia = "0";
		for (int i = 0; i < dsDatHang.size(); i++) {
			gia = Integer.parseInt(dsDatHang.get(i).getGiaSanPham()) + Integer.parseInt(gia) + "";
		}
		return gia;
	}

	public boolean deleteSanPhamDatHang(String id) {
		for (int i = 0; i < dsDatHang.size(); i++) {
			if (dsDatHang.get(i).getMaSanPham().equals(id)) {
				dsDatHang.remove(i);
				return true;
			}
		}
		return false;
	}

	public SanPhamDatHang changeCount(String id, String count) {
		SanPhamDatHang sp = null;
		for (int i = 0; i < dsDatHang.size(); i++) {
			if (dsDatHang.get(i).getMaSanPham().equals(id)) {
				dsDatHang.get(i).setSoLuong(count);
			}
		}
		return sp;
	}

	public Map<String, String> getFindName() {
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from ThongTinChiTiet");
			while (rs.next()) {
				String tenSP = rs.getString(3);
				String maSP = rs.getString(2);
				timTenSanPham.put(maSP, tenSP);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timTenSanPham;
	}

	public boolean addSPDatHang(SanPhamDatHang sp, String soluong) {
		if (soluong.equals("")) {
			soluong = "1";
		}
		String id = sp.getMaSanPham();
		boolean add = daCoTrongDanhSachDatHangChua(id);
		try {
			if (add == true) {
				int index = dsDatHang.size();
				for (int j = 0; j < index; j++) {
					if (dsDatHang.get(j).getMaSanPham().equals(id)) {
						dsDatHang.get(j).setSoLuong(
								Integer.parseInt(dsDatHang.get(j).getSoLuong()) + Integer.parseInt(soluong) + "");
						// index = j;
						return true;
					}
				}

			}
			if (add == false) {
				dsDatHang.add(sp);
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

	public boolean daCoTrongDanhSachDatHangChua(String id) {
		int count = 0;
		for (int j = 0; j < dsDatHang.size(); j++) {
			if (dsDatHang.get(j).getMaSanPham().equals(id)) {
				count++;
			}
		}
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}

	public SanPham find(String id) {
		SanPham sp = null;
		ArrayList<SanPham> listsp = getAllSanPham();
		for (int i = 0; i < listsp.size(); i++) {
			if (listsp.get(i).getMaSanPham().equals(id)) {
				sp = listsp.get(i);
			}
		}
		return sp;

	}

	public SanPhamDatHang findProduce(String id) {
		SanPhamDatHang sp = null;
		ArrayList<SanPhamDatHang> listsp = getAllSanPhamDatHang();
		for (int i = 0; i < listsp.size(); i++) {
			if (listsp.get(i).getMaSanPham().equals(id)) {
				sp = listsp.get(i);
			}
		}
		return sp;

	}

	@Override
	public boolean add(Object obj) {
		SanPham sp = (SanPham) obj;
		mapProduct.put(sp.getMaSanPham(), sp);
		try {
			// new MyConnectDB().thucThiSQL("insert into ThongTinChiTiet
			// values('" + sp.getSoThuTu() + "','"
			// + sp.getMaSanPham() + "','" + sp.getTenSanPham() + "','" +
			// sp.getGiaSanPham() + "','"
			// + sp.getCongNgheManHinh() + "','" + sp.getDoPhanGiai() + "','" +
			// sp.getManHinhRong() + "','"
			// + sp.getMatKinhCamUng() + "','" + sp.getCameraTruoc() + "','" +
			// sp.getCameraSau() + "','"
			// + sp.getDenFlash() + "','" + sp.getHeDieuHanh() + "','" +
			// sp.getTocDoCPU() + "','" + sp.getRam()
			// + "','" + sp.getBoNhoTrong() + "','" + sp.getTheNhoNgoai() +
			// "','" + sp.getMang() + "','"
			// + sp.getSim() + "','" + sp.getWifi() + "','" + sp.getGps() +
			// "','" + sp.getChatLieu() + "','"
			// + sp.getKichThuoc() + "','" + sp.getTrongLuong() + "','" +
			// sp.getDungLuongPin() + "','"
			// + sp.getLoaiPin() + "','" + sp.getUrlHinhAnh() + "')");
			String sql = "insert into ThongTinChiTiet values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getSoThuTu());
			ppstm.setString(2, sp.getMaSanPham());
			ppstm.setString(3, sp.getTenSanPham());
			ppstm.setString(4, sp.getGiaSanPham());
			ppstm.setString(5, sp.getCongNgheManHinh());
			ppstm.setString(6, sp.getDoPhanGiai());
			ppstm.setString(7, sp.getManHinhRong());
			ppstm.setString(8, sp.getMatKinhCamUng());
			ppstm.setString(9, sp.getCameraTruoc());
			ppstm.setString(10, sp.getCameraSau());
			ppstm.setString(11, sp.getDenFlash());
			ppstm.setString(12, sp.getHeDieuHanh());
			ppstm.setString(13, sp.getTocDoCPU());
			ppstm.setString(14, sp.getRam());
			ppstm.setString(15, sp.getBoNhoTrong());
			ppstm.setString(16, sp.getTheNhoNgoai());
			ppstm.setString(17, sp.getMang());
			ppstm.setString(18, sp.getSim());
			ppstm.setString(19, sp.getWifi());
			ppstm.setString(20, sp.getGps());
			ppstm.setString(21, sp.getChatLieu());
			ppstm.setString(22, sp.getKichThuoc());
			ppstm.setString(23, sp.getTrongLuong());
			ppstm.setString(24, sp.getDungLuongPin());
			ppstm.setString(25, sp.getLoaiPin());
			ppstm.setString(26, sp.getUrlHinhAnh());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	public ArrayList<SanPham> getAllSanPham() {
		ArrayList<SanPham> sp = new ArrayList<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from ThongTinChiTiet");
			while (rs.next()) {
				String stt = rs.getString(1);
				String msp = rs.getString(2);
				String tsp = rs.getString(3);
				String gia = rs.getString(4);
				String cnmh = rs.getString(5);
				String dophangiai = rs.getString(6);
				String manhinhrong = rs.getString(7);
				String matkinhcamung = rs.getString(8);
				String cmrt = rs.getString(9);
				String cmrs = rs.getString(10);
				String denflash = rs.getString(11);
				String hedieuhanh = rs.getString(12);
				String cpu = rs.getString(13);
				String ram = rs.getString(14);
				String bnt = rs.getString(15);
				String thenhongoai = rs.getString(16);
				String mang = rs.getString(17);
				String sim = rs.getString(18);
				String wifi = rs.getString(19);
				String gps = rs.getString(20);
				String chatlieu = rs.getString(21);
				String kichthuoc = rs.getString(22);
				String trongluong = rs.getString(23);
				String dungluongpin = rs.getString(24);
				String loaipin = rs.getString(25);
				String hinhanh = rs.getString(26);
				sp.add(new SanPham(stt, msp, tsp, gia, cnmh, dophangiai, manhinhrong, matkinhcamung, cmrt, cmrs,
						denflash, hedieuhanh, cpu, ram, bnt, thenhongoai, mang, sim, wifi, gps, chatlieu, kichthuoc,
						trongluong, dungluongpin, loaipin, hinhanh));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sp;

	}

	public ArrayList<SanPhamDatHang> getAllSanPhamDatHang() {
		ArrayList<SanPhamDatHang> sp = new ArrayList<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from ThongTinChiTiet");
			while (rs.next()) {
				String stt = rs.getString(1);
				String msp = rs.getString(2);
				String tsp = rs.getString(3);
				String gia = rs.getString(4);
				String cnmh = rs.getString(5);
				String dophangiai = rs.getString(6);
				String manhinhrong = rs.getString(7);
				String matkinhcamung = rs.getString(8);
				String cmrt = rs.getString(9);
				String cmrs = rs.getString(10);
				String denflash = rs.getString(11);
				String hedieuhanh = rs.getString(12);
				String cpu = rs.getString(13);
				String ram = rs.getString(14);
				String bnt = rs.getString(15);
				String thenhongoai = rs.getString(16);
				String mang = rs.getString(17);
				String sim = rs.getString(18);
				String wifi = rs.getString(19);
				String gps = rs.getString(20);
				String chatlieu = rs.getString(21);
				String kichthuoc = rs.getString(22);
				String trongluong = rs.getString(23);
				String dungluongpin = rs.getString(24);
				String loaipin = rs.getString(25);
				String hinhanh = rs.getString(26);
				sp.add(new SanPhamDatHang(stt, msp, tsp, gia, cnmh, dophangiai, manhinhrong, matkinhcamung, cmrt, cmrs,
						denflash, hedieuhanh, cpu, ram, bnt, thenhongoai, mang, sim, wifi, gps, chatlieu, kichthuoc,
						trongluong, dungluongpin, loaipin, hinhanh, "1"));
				// return sp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sp;

	}

	public boolean delete(String maSP) {
		mapProduct.remove(maSP);
		String sql = "delete from ThongTinChiTiet where MaSanPham='" + maSP + "'";
		try {
			new MyConnectDB().thucThiSQL(sql);
			return true;
		} catch (Exception e) {
			System.out.println("Hệ thống lỗi vì:" + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean edit(Object obj) {
		SanPham sp = (SanPham) obj;
		mapProduct.replace(sp.getMaSanPham(), sp);
		try {
//			new MyConnectDB().thucThiSQL("update ThongTinChiTiet set STT='" + sp.getSoThuTu() + "',MaSanPham='"
//					+ sp.getMaSanPham() + "',Tensanpham='" + sp.getTenSanPham() + "',Giasanpham='" + sp.getGiaSanPham()
//					+ "',Congnghemanhinh='" + sp.getCongNgheManHinh() + "',Dophangiai='" + sp.getDoPhanGiai()
//					+ "',Manhinhrong='" + sp.getManHinhRong() + "',Matkinhcamung='" + sp.getMatKinhCamUng()
//					+ "',cameratruoc='" + sp.getCameraTruoc() + "',camerasau='" + sp.getCameraSau() + "',Denflash='"
//					+ sp.getDenFlash() + "',Hedieuhanh='" + sp.getHeDieuHanh() + "',Tocdocpu='" + sp.getTocDoCPU()
//					+ "',Ram='" + sp.getRam() + "',Bonhotrong='" + sp.getBoNhoTrong() + "',Thenhongoai='"
//					+ sp.getTheNhoNgoai() + "',Mang='" + sp.getMang() + "',Sim='" + sp.getSim() + "',Wifi='"
//					+ sp.getWifi() + "',GPS='" + sp.getGps() + "',Chatlieu='" + sp.getChatLieu() + "',Kichthuoc='"
//					+ sp.getKichThuoc() + "',Trongluong='" + sp.getTrongLuong() + "',Dungluongpin='"
//					+ sp.getDungLuongPin() + "',Loaipin='" + sp.getLoaiPin() + "',Hinhanhsanpham='" + sp.getUrlHinhAnh()
//					+ "'where MaSanPham='" + sp.getMaSanPham() + "'");

			String sql = "update ThongTinChiTiet set Tensanpham=?,Giasanpham=?,Congnghemanhinh=?,Dophangiai=?,Manhinhrong=?,Matkinhcamung=?,cameratruoc=?,camerasau=?,Denflash=?,Hedieuhanh=?,Tocdocpu=?,Ram=?,Bonhotrong=?,Thenhongoai=?,Mang=?,Sim=?,Wifi=?,GPS=?,Chatlieu=?,Kichthuoc=?,Trongluong=?,Dungluongpin=?,Loaipin=?,Hinhanhsanpham=? where MaSanPham=?";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getTenSanPham());
			ppstm.setString(2, sp.getGiaSanPham());
			ppstm.setString(3, sp.getCongNgheManHinh());
			ppstm.setString(4, sp.getDoPhanGiai());
			ppstm.setString(5, sp.getManHinhRong());
			ppstm.setString(6, sp.getMatKinhCamUng());
			ppstm.setString(7, sp.getCameraTruoc());
			ppstm.setString(8, sp.getCameraSau());
			ppstm.setString(9, sp.getDenFlash());
			ppstm.setString(10, sp.getHeDieuHanh());
			ppstm.setString(11, sp.getTocDoCPU());
			ppstm.setString(12, sp.getRam());
			ppstm.setString(13, sp.getBoNhoTrong());
			ppstm.setString(14, sp.getTheNhoNgoai());
			ppstm.setString(15, sp.getMang());
			ppstm.setString(16, sp.getSim());
			ppstm.setString(17, sp.getWifi());
			ppstm.setString(18, sp.getGps());
			ppstm.setString(19, sp.getChatLieu());
			ppstm.setString(20, sp.getKichThuoc());
			ppstm.setString(21, sp.getTrongLuong());
			ppstm.setString(22, sp.getDungLuongPin());
			ppstm.setString(23, sp.getLoaiPin());
			ppstm.setString(24, sp.getUrlHinhAnh());
			ppstm.setString(25, sp.getMaSanPham());
			
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	public static void main(String[] args) throws Exception {
		SanPham sp = new SanPham("12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12",
				"12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12");
		SanPham sp2 = new SanPham("12", "12", "12", "12", "123", "123", "12", "12", "12", "12", "12", "12", "12", "12",
				"12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12", "12");

		System.out.println(new SanPhamDAO().add(sp));
		System.out.println(new SanPhamDAO().edit(sp2));
	}

	public ArrayList<SanPhamDatHang> getDsDatHang() {
		return dsDatHang;
	}

	public void setDsDatHang(ArrayList<SanPhamDatHang> dsDatHang) {
		this.dsDatHang = dsDatHang;
	}

	public static void setTimTenSanPham(Map<String, String> timTenSanPham) {
		SanPhamDAO.timTenSanPham = timTenSanPham;
	}

	public static ArrayList<SanPham> getDsSanPham() {
		return dsSanPham;
	}

	public static void setDsSanPham(ArrayList<SanPham> dsSanPham) {
		SanPhamDAO.dsSanPham = dsSanPham;
	}

	public void tangSoLuong(String id) {
		for (int i = 0; i < dsDatHang.size(); i++) {
			if (dsDatHang.get(i).getMaSanPham().equals(id)) {
				dsDatHang.get(i).setSoLuong(Integer.parseInt(dsDatHang.get(i).getSoLuong()) + 1 + "");
			}
		}
	}

	public void giamSoLuong(String id) {
		for (int i = 0; i < dsDatHang.size(); i++) {
			if (dsDatHang.get(i).getMaSanPham().equals(id)) {
				dsDatHang.get(i).setSoLuong(Integer.parseInt(dsDatHang.get(i).getSoLuong()) - 1 + "");
			}
		}
	}

	public String getSoLuongTong() {
		String soLuong = "0";
		for (int i = 0; i < dsDatHang.size(); i++) {
			soLuong = Integer.parseInt(dsDatHang.get(i).getSoLuong()) + Integer.parseInt(soLuong) + "";
		}
		return soLuong;
	}
}
