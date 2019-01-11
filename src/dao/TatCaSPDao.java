package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ConnectionDB;
import model.ThongTinDienThoai;
public class TatCaSPDao {
	public  static final ArrayList<ThongTinDienThoai>tatCa=new ArrayList<>();
	private Connection conn;
	private ResultSet rs=null;
	private java.sql.Statement stmt=null;

	public  TatCaSPDao() {
		super();
		conn=ConnectionDB.getConnection();
			String searchQuery="select t.MaSanPham,t.Tensanpham,t.Giasanpham,t.Manhinhrong,t.Congnghemanhinh,t.Hedieuhanh,t.Tocdocpu,t.Ram,t.Bonhotrong,t.Cameratruoc,t.Camerasau,t.Dungluongpin,t.Sim,t.Hinhanhsanpham  from ThongTinChiTiet t";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(searchQuery);
				while(rs.next()){
					ThongTinDienThoai t=new ThongTinDienThoai(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
					tatCa.add(t);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public java.sql.Statement getStmt() {
		return stmt;
	}

	public void setStmt(java.sql.Statement stmt) {
		this.stmt = stmt;
	}


	

}
