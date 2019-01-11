package admin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MyConnectDB {
		public static String sqlDB;
		
		public MyConnectDB() {
			super();
			sqlDB = "jdbc:sqlserver://shopphoneltw.database.windows.net:1433;database=Shopphone;user=shopphone@shopphoneltw;password=Admin1234;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30";
		}
		
		public static  Connection connect() throws Exception{
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection connect = DriverManager.getConnection(sqlDB);
//				Class.forName("com.mysql.jdbc.Driver");
//				Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopphonechuan","root","abcdabcd");
				return connect;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return null;
		}
		public  void thucThiSQL(String sql) throws Exception{
			Connection connect =connect();
			Statement stmt = connect.createStatement();
			stmt.executeUpdate(sql);
		}
		public ResultSet chonDuLieu(String sql) throws Exception{
			Connection connect =connect();
			Statement stmt = connect.createStatement();
			ResultSet rs=	stmt.executeQuery(sql);
			return rs;
		}
		
		public static void main(String[]  args) throws Exception {
			System.out.println(90);
			MyConnectDB myConnectDB = new MyConnectDB();
			myConnectDB.connect();
		}
		
		public PreparedStatement dungStament(String sql) throws SQLException, Exception{
			return connect().prepareStatement(sql);
		}
		
		public ArrayList<BinhLuan> danhSach() throws Exception {
			ArrayList<BinhLuan> ds = new ArrayList<>();
			try {
				ResultSet rs = chonDuLieu("select * from BinhLuan");
				while (rs.next()) {
					BinhLuan bl = new BinhLuan(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
					ds.add(bl);
				}
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e.getMessage());
			}
			return ds;
		}
		public ArrayList<KhachHang> danhSachKH() {
			ArrayList<KhachHang> ds = new ArrayList<>();
			try {
				ResultSet rs = chonDuLieu("select * from  KhachHang ");
				while (rs.next()) {
					KhachHang tk = new KhachHang(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8));
					ds.add(tk);
				}
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return ds;
		}
		public ArrayList<NhaSanXuat> danhSachNSX()  {
			ArrayList<NhaSanXuat> ds = new ArrayList<>();
			try {
				ResultSet rs = chonDuLieu("select * from  HangSanXuat ");
				while (rs.next()) {
					NhaSanXuat nsx = new NhaSanXuat(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
					ds.add(nsx);
				}
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return ds;
		}
		public ArrayList<DonHang> danhSachDonHang() {
			ArrayList<DonHang> ds = new ArrayList<>();
			try {
				ResultSet rs =chonDuLieu("select * from DonHang");
				while (rs.next()) {
//					DonHang donHang = new DonHang(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
//							rs.getString(5));
//					ds.add(donHang);
				}
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return ds;
		}
}
