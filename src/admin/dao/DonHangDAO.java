package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import admin.model.*;

public class DonHangDAO implements ObjectDAO {
	public static Map<String, DonHang> mapOrder = loadDataOrder();
	public static Map<String, DonHang> mapUndo = new HashMap<>();

	public boolean delAll() {
		mapUndo.putAll(mapOrder);
		mapOrder.clear();
		return true;
	}
	public ArrayList<DonHang> layDonHangTheoNgayMua(String ngayMua) {
		ArrayList<DonHang> listDH = new ArrayList<>();
		for (DonHang dhang : mapOrder.values()) {
			if (dhang.getNgayGui().equals(ngayMua)) {
				listDH.add(dhang);
			}
		}
		return listDH;
	}

	
	public boolean undo() {
		mapOrder.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
	public String random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapOrder.containsKey(res)) {
			res = rd.nextInt(limit);
		}
		return res+"";
	}
	
	public  int soLieuBieuDoDoanhThuDonHang(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKe;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoTuan(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoTuan;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoTuanHeThong(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoTuanHeThong;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoThang(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoThang;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoNgay(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoNgay;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoThangHeThong(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoThangHeThong;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	public  int soLieuBieuDoDoanhThuDonHangTheoNgayHeThong(String productID){
		Map<String,DonHang> mapDonHang =ThongKeDAO.mapDonHangThongKeTheoNgayHeThong;
		int sum=0;
		for(DonHang sp:mapDonHang.values()){
			if(sp.getTenSanPham().substring(0,2).equals(productID.substring(0,2))){
				sum+=Integer.parseInt(sp.getTongSoTien());
			}
		}
		return sum;
	}
	
	public boolean delete(String maDH) {
		mapOrder.remove(maDH);
		String sql = "delete from DonHang where MaDonHang='" + maDH + "'";
		String sql2 = "delete from ChiTietDonHang where MaDonHang='" + maDH + "'";
		try {
			new MyConnectDB().thucThiSQL(sql);
			new MyConnectDB().thucThiSQL(sql2);
			return true;
		} catch (Exception e) {
			System.out.println("Hệ thống lỗi vì:" + e.getMessage());
			return false;
		}
	}

	public static Map<String, DonHang> loadDataOrder() {
		Map<String, DonHang> map = new HashMap<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from  ChiTietDonHang");
			while (rs.next()) {
				String stt = rs.getString(1);
				String maDonHang = rs.getString(2);
				String ngayGui = rs.getString(3);
				String trangThai = rs.getString(4);
				String tenKhachHang = rs.getString(5);
				String tenSanPham = rs.getString(6);
				String tongSoTien = rs.getString(7);
				String diaChi = rs.getString(8);
				String sdt = rs.getString(9);
				String moTa = rs.getString(10);
				String username = rs.getString(11);
				String soLuong = rs.getString(12);
				map.put(maDonHang, new DonHang(stt, maDonHang, ngayGui, trangThai, tenKhachHang, tenSanPham, tongSoTien,
						diaChi, sdt, moTa, username, soLuong));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	@Override
	public boolean add(Object obj) {
		DonHang d = (DonHang) obj;
		mapOrder.put(d.getMaDonHang(), d);
		try {
			// new MyConnectDB().thucThiSQL("insert into ChiTietDonHang values
			// ('" + d.getSdt() + "','" + d.getMaDonHang()
			// + "','" + d.getNgayGui() + "','" + d.getTrangThai() + "','" +
			// d.getTenKhachHang() + "','"
			// + d.getTenSanPham() + "','" + d.getTongSoTien() + "','" +
			// d.getDiaChi() + "','" + d.getSdt() + "','"
			// + d.getMoTa() + "','" + d.getSoLuong() + "','" + d.getUsername()
			// + "')");
			// new MyConnectDB().thucThiSQL("insert into DonHang values ('" +
			// d.getMaDonHang() + "','" + d.getNgayGui()
			// + "','" + d.getTenKhachHang() + "','" + d.getTongSoTien() + "','"
			// + d.getSdt() + "','"
			// + d.getUsername() + "')");

			String sql = "insert into  ChiTietDonHang  values (?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, d.getStt());
			ppstm.setString(2, d.getMaDonHang());
			ppstm.setString(3, d.getNgayGui());
			ppstm.setString(4, d.getTrangThai());
			ppstm.setString(5, d.getTenKhachHang());
			ppstm.setString(6, d.getTenSanPham());
			ppstm.setString(7, d.getTongSoTien());
			ppstm.setString(8, d.getDiaChi());
			ppstm.setString(9, d.getSdt());
			ppstm.setString(10, d.getMoTa());
			ppstm.setString(11, d.getSoLuong());
			ppstm.setString(12, d.getUsername());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		DonHang d = (DonHang) obj;
		mapOrder.replace(d.getMaDonHang(), d);
		try {
			String sql = "update  ChiTietDonHang   set NgayDatHang=?,TrangThaiGiaoHang=?,TenKhachHang=?,TongGiaTien=?,DiaChiGiaoHang=?,SoDienThoai=?,Mota=? where MaDonHang=?";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(3, d.getNgayGui());
			ppstm.setString(4, d.getTrangThai());
			ppstm.setString(5, d.getTenKhachHang());
			ppstm.setString(6, d.getTenSanPham());
			ppstm.setString(7, d.getTongSoTien());
			ppstm.setString(8, d.getDiaChi());
			ppstm.setString(9, d.getSdt());
			ppstm.setString(10, d.getMoTa());
			ppstm.setString(11, d.getSoLuong());
			ppstm.setString(12, d.getUsername());

			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}
}
