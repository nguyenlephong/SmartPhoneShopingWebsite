package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import model.ConnectionDB;
import model.ThongTinDienThoai;

public class TimKiemDao {
	public static ArrayList<ThongTinDienThoai> timkiem = new ArrayList<>();
	public static TreeSet<String> tree = new TreeSet<>();
	Connection conn;
	ResultSet result = null;
	java.sql.Statement stmt = null;

	public TimKiemDao() {
		super();
		conn = ConnectionDB.getConnection();
	}

	public void timKiemSP(String s) {
		String query = "select t.MaSanPham,t.Tensanpham,t.Giasanpham,t.Manhinhrong,t.Congnghemanhinh,t.Hedieuhanh,t.Tocdocpu,t.Ram,t.Bonhotrong,t.Cameratruoc,t.Camerasau,t.Dungluongpin,t.Sim,t.Hinhanhsanpham   from ThongTinChiTiet t where t.tensanpham like '"+s+"%'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeQuery(query);
			while (result.next()) {
				ThongTinDienThoai tt = new ThongTinDienThoai(result.getString(1), result.getString(2),
						result.getString(3), result.getString(4), result.getString(5), result.getString(6),
						result.getString(7), result.getString(8), result.getString(9), result.getString(10),
						result.getString(11), result.getString(12), result.getString(13), result.getString(14));
				timkiem.add(tt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void loadDSDT() {
		String query = "select t.tensanpham from thongtinchitiet t";
		try {
			stmt = conn.createStatement();
			result = stmt.executeQuery(query);
			while (result.next()) {
				String res = result.getString(1);
				tree.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void loadDSDT1() {
		String query = "select t.tensanpham from thongtinchitiet t";
		try {
			stmt = conn.createStatement();
			result = stmt.executeQuery(query);
			while (result.next()) {
				String res = result.getString(1).split(" ")[0];
				tree.add(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
