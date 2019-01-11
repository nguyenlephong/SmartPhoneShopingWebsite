package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import admin.model.*;

public class KhachHangDAO implements ObjectDAO {
	public static ArrayList<KhachHang> dsKhachHang = new ArrayList<>();
	public static Map<String,KhachHang> mapCustomer = loadDataCustomer();
	public static Map<String,KhachHang> mapUndo=new HashMap<>();
	
	
	public boolean delAll() {
		mapUndo.putAll(mapCustomer);
		mapCustomer.clear();
		return true;
	}

	public boolean undo() {
		mapCustomer.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
	public String random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapCustomer.containsKey(res)) {
			res = rd.nextInt(limit);
		}
		return res+"";
	}
	
	public ArrayList<KhachHang> getDanhSachKhachHang() {
		ArrayList<KhachHang> ds = new ArrayList<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from KhachHang");
			while (rs.next()) {
				String id = rs.getString(1);
				String user = rs.getString(2);
				String pass = rs.getString(3);
				String name = rs.getString(4);
				String email = rs.getString(5);
				String address = rs.getString(6);
				String phone = rs.getString(7);
				String stk = rs.getString(8);
				KhachHang s = new KhachHang(id, user, pass, name, email, address, phone, stk);
				ds.add(s);
			}
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ds;
	}
	public static Map<String, KhachHang> loadDataCustomer() {
		 Map<String,KhachHang> map = new HashMap<>();
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select * from KhachHang");
				while(rs.next()){
					String userid = rs.getString(1);
					String userName = rs.getString(2);
					String pass = rs.getString(3);
					String name = rs.getString(4);
					String email = rs.getString(5);
					String address = rs.getString(6);
					String phone = rs.getString(7);
					String stk = rs.getString(8);
					String slmuahang = rs.getString(9);
					map.put(userid, new KhachHang(userid, userName, pass, name, email, address, phone, stk,slmuahang));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return map;
	}
	public KhachHang find(String email){
		KhachHang kh =null;
		ArrayList<KhachHang> ds = getDanhSachKhachHang();
		for (int i = 0; i < ds.size(); i++) {
			if(email.equals(ds.get(i).getEmail())){
				kh=ds.get(i);
				return kh;
			}
		}
		return kh;
		
	}
	public boolean delete(String id) {
		mapCustomer.remove(id);
		String sql = "delete from KhachHang where STT='" + id + "'";
		try {
			new MyConnectDB().thucThiSQL(sql);
			return true;
		} catch (Exception e) {
			System.out.println("Hệ thống lỗi vì:" + e.getMessage());
			return false;
		}
	}

	// kiểm tra email tồn tại chưa
	public boolean checkEmail(String email) throws Exception {
		for(KhachHang u : mapCustomer.values()){
			if(u.getEmail().equals(email)){
				return true;
			}
		}
		return false;
	}

	// login
	public boolean checkLogin(String username, String pass) throws Exception {
		for(KhachHang u : mapCustomer.values()){
			if (u.getUser().equals(username) && u.getPass().equals(pass)) {
				TenDangNhap.name = u.getName();
				TenDangNhap.maDN = Integer.parseInt(u.getId());
				return true;
			}
		}
	return false;
}

	// goi email password
	public boolean sendEmail(String email) throws Exception {
		for(KhachHang u: mapCustomer.values()){
				if (u.getEmail().equals(email)) {
					new GoiMatKhau().sendMail(email, "Quên mật khẩu",
							"Tài khoản của bạn là" + u.getUser() + "\nMật khẩu của bạn là:" + u.getPass());
					return true;
				}
			}
		return false;
	}

	// kiểm tra username tồn tại chưa
	public boolean checkUserName(String username) throws Exception {
		for(KhachHang u : mapCustomer.values()){
			if (u.getUser().equals(username)) {
				return true;
			}
		}
		return false;
	}


	@Override
	public boolean add(Object obj)  {
		KhachHang u = (KhachHang) obj;
		mapCustomer.put(u.getId(), u);
		try {
//			new MyConnectDB().thucThiSQL("insert into [dbo].[KhachHang] values ('" + u.getUserid() + "','"
//					+ u.getUsername() + "','" + u.getPass() + "','" + u.getName() + "','" + u.getEmail() + "','"
//					+ u.getAddress() + "','" + u.getPhone() + "','" + u.getStk() + "','" + u.getSoLuotMuaHang() + "')");
			String sql="insert into KhachHang values (?,?,?,?,?,?,?,?,?)";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, u.getId());
			ppstm.setString(2, u.getUser());
			ppstm.setString(3, u.getPass());
			ppstm.setString(4, u.getName());
			ppstm.setString(5, u.getEmail());
			ppstm.setString(6, u.getAddress());
			ppstm.setString(7, u.getPhone());
			ppstm.setString(8, u.getStk());
			ppstm.setString(9, u.getSoLuotMuaHang());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		KhachHang u = (KhachHang) obj;
		mapCustomer.replace(u.getId(), u);
		try {
//			new MyConnectDB().thucThiSQL("update [dbo].[KhachHang] set STT='" + u.getUserid() + "',TenTaiKhoan='"
//					+ u.getUsername() + "',MatKhau='" + u.getPass() + "',TenKhachHang='" + u.getName() + "',Email='"
//					+ u.getEmail() + "',DiaChi='" + u.getAddress() + "',SoDienThoai='" + u.getPhone() + "',SoTaiKhoan='"
//					+ u.getStk() + "' where STT='" + u.getUserid() + "'");
			String sql = "update KhachHang set STT=?,TenTaiKhoan=?,MatKhau=?,TenKhachHang=?,Email=?,DiaChi=?,SoDienThoai=?,SoTaiKhoan=?,SoSanPhamDaMua=? where STT=?";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, u.getId());
			ppstm.setString(2, u.getUser());
			ppstm.setString(3, u.getPass());
			ppstm.setString(4, u.getName());
			ppstm.setString(5, u.getEmail());
			ppstm.setString(6, u.getAddress());
			ppstm.setString(7, u.getPhone());
			ppstm.setString(8, u.getStk());
			ppstm.setString(9, u.getSoLuotMuaHang());
			ppstm.setString(10, u.getId());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}
}
