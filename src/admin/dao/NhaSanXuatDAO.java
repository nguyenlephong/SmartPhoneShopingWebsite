package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import admin.model.*;

public class NhaSanXuatDAO implements ObjectDAO {
	public static Map<String, NhaSanXuat> mapProducer = loadDataProducer();
	public static Map<String, NhaSanXuat> mapUndo = new HashMap<>();
	public static ArrayList<NhaSanXuat> listProducer = loadDataProducerByList();
	
	public boolean delAll() {
		mapUndo.putAll(mapProducer);
		mapProducer.clear();
		return true;
	}
	
	
	private static ArrayList<NhaSanXuat> loadDataProducerByList() {
		ArrayList<NhaSanXuat> list = new ArrayList<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from HangSanXuat");
			while (rs.next()) {
				String id = rs.getString(1);
				String maNSX = rs.getString(2);
				String maSP = rs.getString(3);
				String tenNSX = rs.getString(4);
				String diaChi = rs.getString(5);
				String sdt = rs.getString(6);
				list.add(new NhaSanXuat(id, maNSX, maSP, tenNSX, diaChi, sdt));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public static Map<String,SanPham> getSelectProduct(String id) {
		SanPhamDAO.mapProduct = SanPhamDAO.loadDataProduct();
		Map<String,SanPham> product = new HashMap<>();
		for (NhaSanXuat nsx : listProducer) {
			if (nsx.getMaNSX().equals(id)) {
				SanPham sp =SanPhamDAO.mapProduct.get(nsx.getMaSP());
				if(sp!=null){
					product.put(nsx.getMaSP(),sp);
				}else{
					continue;
				}
			}
		}
		System.out.println(product);
		return product;
	}

	public boolean undo() {
		mapProducer.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

	public boolean delete(String id) {
		mapProducer.remove(id);
		String sql = "delete from HangSanXuat where MaNhaSanXuat='" + id + "'";
		try {
			new MyConnectDB().thucThiSQL(sql);
		} catch (Exception e) {
			System.out.println("Hệ thống lỗi vì:" + e.getMessage());
			return false;
		}
		return true;
	}

	public String random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapProducer.containsKey(res)) {
			res = rd.nextInt(limit);
		}
		return res + "";
	}

	public static Map<String, NhaSanXuat> loadDataProducer() {
		Map<String, NhaSanXuat> map = new HashMap<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from HangSanXuat");
			while (rs.next()) {
				String id = rs.getString(1);
				String maNSX = rs.getString(2);
				String maSP = rs.getString(3);
				String tenNSX = rs.getString(4);
				String diaChi = rs.getString(5);
				String sdt = rs.getString(6);
				map.put(maNSX, new NhaSanXuat(id, maNSX, maSP, tenNSX, diaChi, sdt));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	@Override
	public boolean add(Object obj) {
		NhaSanXuat n = (NhaSanXuat) obj;
		mapProducer.put(n.getMaNSX(), n);
		try {
			String sql = "insert into HangSanXuat values (?,?,?,?,?,?)";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, n.getId());
			ppstm.setString(2, n.getMaNSX());
			ppstm.setString(3, n.getMaSP());
			ppstm.setString(4, n.getTenNSX());
			ppstm.setString(5, n.getDiaChi());
			ppstm.setString(6, n.getSdt());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		NhaSanXuat n = (NhaSanXuat) obj;
		mapProducer.replace(n.getMaNSX(), n);
		try {
			String sql = "update HangSanXuat set TenNhaSanXuat=?,DiaChi=?,SoDienThoai=? where MaNhaSanXuat=?";
			Connection connect = MyConnectDB.connect();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, n.getTenNSX());
			ppstm.setString(2, n.getDiaChi());
			ppstm.setString(3, n.getSdt());
			ppstm.setString(4, n.getMaNSX());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Hệ thống gặp lỗi " + e.getMessage());
			return false;
		}
		return true;
	}
}
