package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import admin.model.*;

public class BinhLuanDAO implements ObjectDAO {
	public static Map<String, BinhLuan> mapComment = loadDataComment();
	public static Map<String,BinhLuan> mapUndo=new HashMap<>();
	
	public boolean delAll() {
		mapUndo.putAll(mapComment);
		mapComment.clear();
		return true;
	}

	public boolean undo() {
		mapComment.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
	
	public BinhLuanDAO(){
	}
	
	public static Map<String, BinhLuan> loadDataComment() {
		 Map<String,BinhLuan> map = new HashMap<>();
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select * from  BinhLuan");
				while(rs.next()){
					String id = rs.getString(1);
					String name = rs.getString(2);
					String date = rs.getString(3);
					String content = rs.getString(4);
					map.put(id, new BinhLuan(id, name, date, content));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return map;
	}
	
	@Override
	public boolean add(Object obj) {
	BinhLuan	b=(BinhLuan) obj;
	mapComment.put(b.getStt(), b);
	try {
//			new MyConnectDB().thucThiSQL("insert into [dbo].[BinhLuan] values ('" + b.getStt() + "','" + b.getTen()
//					+ "','" + b.getNgay() + "','" + b.getNoiDung() + "')");
			String sql="insert into BinhLuan values (?,?,?,?)";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,b.getStt());
			ppstm.setString(2, b.getTen());
			ppstm.setString(3, b.getNgay());
			ppstm.setString(4,b.getNoiDung());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String id) {
		String sql = "delete from BinhLuan where STT='" + id + "'";
		mapComment.remove(id);
		try {
			new MyConnectDB().thucThiSQL(sql);
		} catch (Exception e) {
			System.out.println("Hệ thống lỗi vì:" + e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		BinhLuan	b=(BinhLuan) obj;
		mapComment.replace(b.getStt(), b);
		try {
//			new MyConnectDB().thucThiSQL(
//					"update BinhLuan set STT='" + b.getStt() + "',TenKhachHang='" + b.getTen() + "',NgayGoi='"
//							+ b.getNgay() + "',NoiDung='" + b.getNoiDung() + "' where STT='" + b.getStt() + "'");
			String sql="update BinhLuan set STT=?,TenKhachHang=?,NgayGoi=?,NoiDung=? where STT=?";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, b.getStt());
			ppstm.setString(2, b.getTen());
			ppstm.setString(3,b.getNgay());
			ppstm.setString(4, b.getNoiDung());
			ppstm.setString(5, b.getStt());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	public BinhLuan layBinhLuanTheoNgayMua(String ngayMua) {
			BinhLuan dh = null;
			for (BinhLuan dhang : mapComment.values()) {
				if (dhang.getNgay().equals(ngayMua)) {
					dh = dhang;
				}
			}
			return dh;
	}


}
