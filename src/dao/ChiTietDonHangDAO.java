package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import model.ChiTietDonHang;
import model.ConnectionDB;

public class ChiTietDonHangDAO {
	public static Map<String, ChiTietDonHang> danhSachTatCaChiTietDonHang(){
		Map<String, ChiTietDonHang> danhSachTatCaChiTietDonHang=new HashMap<String, ChiTietDonHang>();
		Connections con = PoolConnect.getInstance().freeConnection();
		Connection connection=con.getConnect();
		try {
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("select * from ChiTietDonHang");
			while(resultSet.next()){
				danhSachTatCaChiTietDonHang.put(resultSet.getString(12), new ChiTietDonHang(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10), resultSet.getInt(11), resultSet.getString(12)));
			}
		} catch (SQLException e) {
		}
		con.closeConnect();
	return danhSachTatCaChiTietDonHang;
	}
	public static void main(String[] args) {
		System.out.println(danhSachTatCaChiTietDonHang());
	}
}
