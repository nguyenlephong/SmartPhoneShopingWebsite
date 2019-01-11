package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.ConnectionDB;
import model.MoTaThongTinSanPham;

public class MoTaThongTinSanPhamDAO {
	public static Map<String, MoTaThongTinSanPham> danhSachSanPhamDuocMoTa() {
		Map<String, MoTaThongTinSanPham> ds = new HashMap<>();
		try {
			Connection connection = ConnectionDB.getConnection();
			Statement statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery("select * from ThongTinChiTietSanPham");
			while (resultSet.next()) {
				ds.put(resultSet.getString(2), new MoTaThongTinSanPham(resultSet.getInt(1), resultSet.getString(2),
						resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getString(12), resultSet.getString(13),
						resultSet.getString(14), resultSet.getString(15), resultSet.getString(16),
						resultSet.getString(17), resultSet.getString(18), resultSet.getString(19),
						resultSet.getString(20), resultSet.getString(21), resultSet.getString(22),
						resultSet.getString(23), resultSet.getString(24)));
			}

		} catch (SQLException e) {
			System.out.println("Da xay ra loi: " + e.getMessage());
		}
		return ds;
	}
}
