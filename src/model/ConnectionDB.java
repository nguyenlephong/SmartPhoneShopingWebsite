package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class ConnectionDB {
	public static Connection getConnection() {
		Connection conn = null;
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopphonechuan","root","abcdabcd");
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://shopphoneltw.database.windows.net:1433;database=Shopphone;user=shopphone@shopphoneltw;password=Admin1234;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30");
		
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Success: ");
		}
		return conn;
	}
	public static Map<String, ThongSoKiThuatSanPham> danhSachTatCaSanPham(){
		Map<String, ThongSoKiThuatSanPham> danhSachTatCaSanPham=new HashMap<>();
		Connection connection=getConnection();
		try {
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("select * from ThongTinChiTiet");
			while(resultSet.next()){
				danhSachTatCaSanPham.put(resultSet.getString(2), new ThongSoKiThuatSanPham(resultSet.getString(1), resultSet.getString(2),
						resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getString(12), resultSet.getString(13),
						resultSet.getString(14), resultSet.getString(15), resultSet.getString(16),
						resultSet.getString(17), resultSet.getString(18), resultSet.getString(19),
						resultSet.getString(20), resultSet.getString(21), resultSet.getString(22),
						resultSet.getString(23), resultSet.getString(24), resultSet.getString(25),
						resultSet.getString(26)));
			}
			
		} catch (SQLException e) {
		
		}
		return danhSachTatCaSanPham;
	}
	public ThongSoKiThuatSanPham thongSoKiThuatCuaDienThoaiVoiMaSP(String maSP) {
		ThongSoKiThuatSanPham thongSoKiThuatSanPham = null;	
		Connection conn = getConnection();
		String sql = "select * from ThongTinChiTiet where MaSanPham = "+"'"+maSP+"'";
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				thongSoKiThuatSanPham = new ThongSoKiThuatSanPham(resultSet.getString(1), resultSet.getString(2),
						resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getString(8), resultSet.getString(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getString(12), resultSet.getString(13),
						resultSet.getString(14), resultSet.getString(15), resultSet.getString(16),
						resultSet.getString(17), resultSet.getString(18), resultSet.getString(19),
						resultSet.getString(20), resultSet.getString(21), resultSet.getString(22),
						resultSet.getString(23), resultSet.getString(24), resultSet.getString(25),
						resultSet.getString(26));
			}

		} catch (SQLException e) {
			System.out.println("Success: ");
		}
		return thongSoKiThuatSanPham;
	}
	public static String timMaSPVoiTenSP(String tenSP){
		String result="";
		try{
		Connection connection=getConnection();
		Statement statement =connection.createStatement();
		ResultSet resultSet=statement.executeQuery("select MaSanPham from ThongTinChiTiet where TenSanPham='"+tenSP+"'");
		while(resultSet.next()){
			result=resultSet.getString(1);
		}
		
	} catch (SQLException e) {
		System.out.println("Success: ");
	}
		return result;
	}
	
	
	
	public static void main(String[] args) {
		getConnection();
	}
}
