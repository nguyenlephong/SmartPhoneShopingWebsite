package admin.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import admin.model.*;

public class LoadDTBDAO {
		boolean ok;
		
		public LoadDTBDAO(boolean ok) {
			super();
			this.ok = ok;
		}

		public static ThongKe thongKeSoLieu() {
			ThongKe tk = null;
			int soLuongUser=KhachHangDAO.mapCustomer.size();
			int soLuongSanPham=0;
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select * from SanPham");
				while(rs.next()){
					String st = rs.getString(6);
					soLuongSanPham+=Integer.parseInt(st);
				}            	 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			int soLuongSanPhamConKho=KhoHangDAO.countAmountExist();
			int soLuongTruyCap=0;
			int soLuongDonDatHang =DonHangDAO.mapOrder.size();
			int soLuongBinhLuan=BinhLuanDAO.mapComment.size();
			int soLuongSanPhamBanDuoc=KhoHangDAO.countAmountLeave();
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select * from ThongKeTruyCap");
				while(rs.next()){
					String st = rs.getString(2);
					soLuongTruyCap+=Integer.parseInt(st);
				}            	 
			} catch (Exception e) {
				e.printStackTrace();
			}
			tk=new ThongKe(soLuongUser, soLuongSanPham, soLuongSanPhamConKho,soLuongSanPhamBanDuoc, soLuongTruyCap, soLuongDonDatHang, soLuongBinhLuan);
			return tk;
		}

		public LoadDTBDAO() {
			
		}
		
		
}
