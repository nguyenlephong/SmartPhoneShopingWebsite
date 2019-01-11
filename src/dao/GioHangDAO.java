package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import model.ConnectionDB;

public class GioHangDAO {
	public static Map<String,String> danhSachCacGioHang(){
		Map<String,String> danhSachCacGioHang=new HashMap<>();
		Connections con = PoolConnect.getInstance().freeConnection();
		Connection connection=con.getConnect();
		try {
			Statement statement=connection.createStatement();
			ResultSet resultSet =statement.executeQuery("select * from GioHang");
			while(resultSet.next()){
				danhSachCacGioHang.put(resultSet.getString(1), resultSet.getString(2));
			}
		} catch (SQLException e) {
		}
/*		con.closeConnect();*/
		return danhSachCacGioHang;
	}
	public static void themVaoDanhSachCacGioHang(String username,String maSPSoLuong){
		Connections con = PoolConnect.getInstance().freeConnection();
		Connection connection=con.getConnect();
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("insert into GioHang(Username,MaSPSoLuong) values (?,?)");
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, maSPSoLuong);
		} catch (SQLException e) {
		}
/*		con.closeConnect();*/
	}
}
