package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.ConnectionDB;
import model.KhachHang;

public class KhachHangDao {
	public static boolean dangNhap(String user,String passwd){
		Map<String , KhachHang> dsKhachHang=dsKhachHang();
		
		if(dsKhachHang.containsKey(user) && dsKhachHang.get(user).getMatKhau().equals(passwd)){
			return true;
		}
		return false;
	}
	public static void dangKi(KhachHang khachHang){
		Connection connection=ConnectionDB.getConnection();
		try {
			PreparedStatement statement=connection.prepareStatement("insert into KhachHang(STT,TenTaiKhoan,MatKhau,TenKhachHang,Email,DiaChi,SoDienThoai,SoTaiKhoan,SoSanPhamDaMua,role) values(?,?,?,?,?,?,?,?,?,?)");
			statement.setInt(1, dsKhachHang().size()+1);
			statement.setString(2,khachHang.getTenTaiKhoan());
			statement.setString(3,khachHang.getMatKhau());
			statement.setString(4, khachHang.getTenKhachHang());
			statement.setString(5, khachHang.getEmail());
			statement.setString(6, khachHang.getDiaChi());
			statement.setString(7, khachHang.getSdt());
			statement.setString(8, khachHang.getSoTaiKhoan());
			statement.setInt(9, khachHang.getSoSanPhamDaMua());
			statement.setString(10, khachHang.getRole());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static Map<String , KhachHang> dsKhachHang(){
		Map<String, KhachHang> ds=new HashMap<>();
		Connection connection=ConnectionDB.getConnection();
		try{
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery("select * from KhachHang");
		while(resultSet.next()){
			KhachHang khachhang=new KhachHang(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),resultSet.getString(8),resultSet.getInt(9));
			khachhang.setRole(resultSet.getString(10));
			ds.put(resultSet.getString(2), khachhang);
		}
		}catch(SQLException e){
			
		}
		return ds;
	}

	public boolean editPass(KhachHang kh) {
		Connection connection=ConnectionDB.getConnection();
		String sql="update KhachHang set MatKhau='" + kh.getMatKhau()+ "' where TenTaiKhoan='" +kh.getTenTaiKhoan()+ "'";
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
		}
		
		
		return false;
	}
	public static List<String> danhSachEmail(){
		List<String> ds = new ArrayList<>();
		Connection connection = ConnectionDB.getConnection();
		try{
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select Email from KhachHang");
		while(resultSet.next()){
			ds.add(resultSet.getString(1));
		}
		}catch(SQLException e){
			
		}
		return ds;
	}
	public static String bamMatKhau(String matKhau){
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
		    hash = hash*4 + matKhau.charAt(i);
		}
		return hash+"";
	}
	public static void main(String[] args) {
//		System.out.println(dsKhachHang().get("hau").getMatKhau().equals(bamMatKhau("123456")));
//		System.out.println(bamMatKhau("123456"));
//		System.out.println(bamMatKhau("123456").equals(bamMatKhau("123456")));
		System.out.println(dsKhachHang());
	}
}
