package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.ChiTietDonHang;
import model.ConnectionDB;
import model.DonHang;

public class MuaHangDAO extends ConnectionDB {
	public static  void addDonHang(DonHang donHang) {
		try {
			Connection connection=getConnection();
			PreparedStatement statement2 = connection.prepareStatement("insert into DonHang(MaDonHang,NgayDatHang,TenKhachHang,TongGiaTien,SoDienThoai,Username) values(?,?,?,?,?,?)");
			statement2.setString(1, donHang.getMaDonHang());
			statement2.setString(2, donHang.getNgayDatHang());
			statement2.setString(3, donHang.getTenKhachHang());
			statement2.setInt(4, donHang.getTongThanhTien());
			statement2.setString(5, donHang.getSoDienThoai());
			statement2.setString(6, donHang.getUserName());
			statement2.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public static void addChiTietDonHang(ChiTietDonHang chiTietDonHang) {
		try {
			Connection connection=getConnection();
			 PreparedStatement statement = connection.prepareStatement("insert into ChiTietDonHang(STT,MaDonHang,NgayDatHang,TrangThaiGiaoHang,TenKhachHang,TenSanPham,TongGiaTien,DiaChiGiaoHang,SoDienThoai,Mota,Soluong,Username) values(?,?,?,?,?,?,?,?,?,?,?,?);");
			 statement.setString(1, chiTietDonHang.getSTT()+"");
			 statement.setString(2, chiTietDonHang.getMaDonHang());
			 statement.setDate(3, Date.valueOf(chiTietDonHang.getNgayDatHang()));
			 statement.setString(4, chiTietDonHang.getTrangThaiGiaoHang());
			 statement.setString(5, chiTietDonHang.getTenKhachHang());
			 statement.setString(6, chiTietDonHang.getTenSanPham());
			 statement.setInt(7, chiTietDonHang.getTongThanhTien());
			 statement.setString(8, chiTietDonHang.getDiaChiGiaoHang());
			 statement.setString(9, chiTietDonHang.getSoDienThoai());
			 statement.setString(10, chiTietDonHang.getMoTa());
			 statement.setInt(11,chiTietDonHang.getSoLuong());
			 statement.setString(12, chiTietDonHang.getUserName());
			 statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void deleteDonHang(String tenSP){
		try {
			Connection connection=getConnection();
			 Statement statement = connection.createStatement();
			 statement.executeUpdate("DELETE from ChiTietDonHang WHERE TenSanPham ='"+tenSP+"'");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void xoaDonHangTheoUser(String user){
		try {
			Connection connection=getConnection();
			 Statement statement = connection.createStatement();
			 statement.executeUpdate("DELETE from ChiTietDonHang WHERE Username ='"+user+"'");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static int soLuongSanPhamTrongGioHangTheoUser(String user){
		int result=0;
		try{
		Connection connection=getConnection();
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery("SELECT COUNT(Username) FROM ChiTietDonHang WHERE Username='"+user +"'");
		while(resultSet.next()){
			result=resultSet.getInt(1);
		}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public static Date chuyenStringThanhDate(String s){
		int nam = Integer.parseInt(s.split("-")[0].trim());
		int thang = Integer.parseInt(s.split("-")[1].trim());
		int ngay = Integer.parseInt(s.split("-")[2].trim());
		return new Date(nam, thang, ngay);
	}
}
