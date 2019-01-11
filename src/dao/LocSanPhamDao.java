package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.ConnectionDB;
import model.ThongTinDienThoai;

public class LocSanPhamDao {
	public static ArrayList<ThongTinDienThoai> listLoc = new ArrayList<>();

	public LocSanPhamDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	// Loc theo sp hot
	public void chonHang(String s) {
		listLoc = new ArrayList<>();
		// TatCaSPDao tc=null;
		String sub;
		for (int i = 0; i < TatCaSPDao.tatCa.size(); i++) {
			sub = TatCaSPDao.tatCa.get(i).getTen().split(" ")[0];
			System.out.println(sub);
			if (sub.equalsIgnoreCase(s)) {
				listLoc.add(TatCaSPDao.tatCa.get(i));
			}
		}
	}

	public void chonTheoGia(int g1, int g2) {
		ArrayList<ThongTinDienThoai> list = new ArrayList<>();
		int gia;
		for (int i = 0; i < listLoc.size(); i++) {
			gia = Integer.parseInt(listLoc.get(i).getGia().trim());
			if (gia >= g1 && gia <= g2) {
				list.add(listLoc.get(i));
			}
		}
		listLoc=list;
		
	}
	public void chonCamera(int camera){
		ArrayList<ThongTinDienThoai> list = new ArrayList<>();
		int temp;
		for(int i=0;i<listLoc.size();i++){
			temp=Integer.parseInt(listLoc.get(i).getCamera().trim());
			if(camera==13){
				if(temp>=13){
					list.add(listLoc.get(i));
				}
			}else
			if(temp==camera){
				list.add(listLoc.get(i));
			}
		}
		listLoc=list;
	}
	
	public void chonSelfie(int selfie){
		ArrayList<ThongTinDienThoai> list = new ArrayList<>();
		int temp;
		for(int i=0;i<listLoc.size();i++){
			temp=Integer.parseInt(listLoc.get(i).getSelfie().trim());
			if(selfie==13){
				if(temp>=13){
					list.add(listLoc.get(i));
				}
			}else
			if(temp==selfie){
				list.add(listLoc.get(i));
			}
		}
		listLoc=list;
	}
	
	public void chonBoNhoTrong(int boNhoTrong){
		ArrayList<ThongTinDienThoai> list = new ArrayList<>();
		int temp;
		for(int i=0;i<listLoc.size();i++){
			temp=Integer.parseInt(listLoc.get(i).getRom().trim());
			System.out.println(temp);
			if(boNhoTrong==64){
				if(temp>=64){
					list.add(listLoc.get(i));
				}
			}else
			if(temp==boNhoTrong){
				list.add(listLoc.get(i));
			}
		}
		listLoc=list;
	}
	
	// Loc theo gia sp
	public void locGia(String a, String b) {
		listLoc = new ArrayList<>();
		int gia;
		int g1 = Integer.parseInt(a);
		int g2 = Integer.parseInt(b);
		for (int i = 0; i < TatCaSPDao.tatCa.size(); i++) {
			gia = Integer.parseInt(TatCaSPDao.tatCa.get(i).getGia());
			if (gia >= g1 && gia <= g2) {
				listLoc.add(TatCaSPDao.tatCa.get(i));
			}
		}

	}

	// Loc Theo Tinh Nang
	public static String catChuoi(String s) {
		String[] str = s.split("and");
		String stringTmp = "";
		String sql = "";
		for (String string : str) {
			stringTmp = string.trim();
			if (coLaSoKhong(stringTmp.substring(stringTmp.length() - 1, stringTmp.length()))) {
				sql += stringTmp + " and ";
			}
		}
		return sql.substring(0, sql.length() - 4).trim();
	}

	private static boolean coLaSoKhong(String substring) {
		try {
			Integer.parseInt(substring);
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}

	public static ArrayList<ThongTinDienThoai> locTheoTinhNangCuaDienThoai(String s) {
		String str = catChuoi(s);
		ArrayList<ThongTinDienThoai> ds = new ArrayList<>();
		try {
			Connection connection = ConnectionDB.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(
					"select  MaSanPham, Tensanpham, Giasanpham, Manhinhrong, Congnghemanhinh, Hedieuhanh, Tocdocpu, Ram, Bonhotrong, Cameratruoc, Camerasau, Dungluongpin, Sim, Hinhanhsanpham from ThongTinChiTiet where "
							+ str);
			while (resultSet.next()) {
				ds.add(new ThongTinDienThoai(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),
						resultSet.getString(8), resultSet.getString(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getString(12), resultSet.getString(13),
						resultSet.getString(14)));
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return ds;
	}

	// SapXepSp
	public void sapXepGia(String gia) {
		listLoc = new ArrayList<>();
		for (int i = 0; i < TatCaSPDao.tatCa.size(); i++) {
			listLoc.add(TatCaSPDao.tatCa.get(i));
		}
		if (gia.equals("caodenthap")) {
			Collections.sort(listLoc, new Comparator<ThongTinDienThoai>() {

				@Override
				public int compare(ThongTinDienThoai o1, ThongTinDienThoai o2) {
					return Integer.parseInt(o2.getGia()) - Integer.parseInt(o1.getGia());
				}
			});
		} else if (gia.equals("thapdencao")) {
			Collections.sort(listLoc, new Comparator<ThongTinDienThoai>() {

				@Override
				public int compare(ThongTinDienThoai o1, ThongTinDienThoai o2) {
					return Integer.parseInt(o1.getGia()) - Integer.parseInt(o2.getGia());
				}
			});
		}
	}

}
