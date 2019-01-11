package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DanhSachDonHang {
	public static ArrayList<ChiTietDonHang> danhSachDonHang() {
		int count=0;
		ArrayList<ChiTietDonHang> ds = new ArrayList<>();
		try {
			Connection connection = ConnectionDB.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from ChiTietDonHang");

			while (resultSet.next()) {
				count++;
				ds.add(new ChiTietDonHang(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10),resultSet.getInt(11),resultSet.getString(12)));
			}

		} catch (SQLException e) {

		}
		return ds;
	}
	public static int soLuongDonHang(){
		return danhSachDonHang().size();
	}
	public static ArrayList<ChiTietDonHang>  danhSachDonHangTheoUser(String id){
		ArrayList<ChiTietDonHang> ds=new ArrayList<>();
		
		Connection connection=ConnectionDB.getConnection();
		try{
		Statement statement =connection.createStatement();
		ResultSet resultSet=statement.executeQuery("select * from ChiTietDonHang where Username = '"+id+"'");
		
		while(resultSet.next()){
			ds.add(new ChiTietDonHang(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10), resultSet.getInt(11), resultSet.getString(12)));
		}
		}catch(SQLException e){
			
		}
		return ds;
	}
	
	public static void main(String[] args) {
		System.out.println(danhSachDonHangTheoUser("hau"));
	}
}
