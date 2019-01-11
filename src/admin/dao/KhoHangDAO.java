package admin.dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import admin.model.*;

public class KhoHangDAO {
		public static Map<String, KhoHang> mapKhoHang = loadDataKhoHang();

		public static Map<String, KhoHang> loadDataKhoHang() {
			 Map<String,KhoHang> map = new HashMap<>();
				try {
					ResultSet rs = new MyConnectDB().chonDuLieu("select * from  QuanLiTonKho");
					while(rs.next()){
						String id = rs.getString(1);
						String xyz = rs.getString(2);
						String productID = rs.getString(3);
						String productName = rs.getString(4);
						String producerName=rs.getString(5);
						String soLuongChuaBanDuoc = rs.getString(6);
						String giaTienChuaBanDuoc = rs.getString(7);
						String soLuongBanDuoc = rs.getString(8);
						String giaTienBanDuoc = rs.getString(9);
						map.put(id, new KhoHang(id, xyz, productID, productName,producerName, soLuongChuaBanDuoc, giaTienChuaBanDuoc, soLuongBanDuoc, giaTienBanDuoc));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return map;
		}
		public static int countAmountExist(){
			int sum=0;
			for(KhoHang kh : mapKhoHang.values()){
				sum+=Integer.parseInt(kh.getSoLuongChuaBanDuoc());
			}
			return sum;
		}
		public static int countAmountLeave(){
			int sum=0;
			for(KhoHang kh : mapKhoHang.values()){
				sum+=Integer.parseInt(kh.getSoLuongBanDuoc());
			}
			return sum;
		}
		
}
