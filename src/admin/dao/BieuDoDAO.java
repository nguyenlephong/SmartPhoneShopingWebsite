package admin.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import admin.model.*;

public class BieuDoDAO {
	ArrayList<admin.model.BangTinhTrangKho> listTinhTrangKho= new ArrayList<>();
	ArrayList<BangDoanhThuChiTiet> listDoanhThuChiTiet= new ArrayList<>();
	ArrayList<BangDiem> listBangDiem= new ArrayList<>();

	public BieuDoDAO() {
		super();
	}
	public ArrayList<BangTinhTrangKho> duLieuBang() throws Exception{
		MyConnectDB mycn = new MyConnectDB();
		ResultSet rs = mycn.chonDuLieu("SELECT qt.TenNhaSanXuat,SUM(qt.SoLuongChuaBanDuoc)SoLuongChuaBanDuoc,sum(qt.GiaTriChuaBanDuoc)GiaTriChuaBanDuoc,sum(qt.SoLuongBanDuoc)SoLuongBanDuoc,sum(qt.GiaTriBanDuoc)GiaTriBanDuoc,sum(qx.SoLuongXuat)SoLuongXuat,sum(qx.GiaTriUocTinh)GiaTriUocTinh from [dbo].[QuanLiTonKho] qt join [dbo].[QuanLiXuatKho] qx on qt.MaSanPham=qx.MaSanPham group by qt.TenNhaSanXuat ");
		while(rs.next()){
			String nsx=rs.getString(1);
			String slcbd=rs.getString(2);
			String gtcbd=rs.getString(3);
			String slbd=rs.getString(4);
			String gtbd=rs.getString(5);
			String slx=rs.getString(6);
			String gtx=rs.getString(7);
				listTinhTrangKho.add(new BangTinhTrangKho(nsx, slcbd, gtcbd, slbd, gtbd, slx, gtx));
		}
		if(!listTinhTrangKho.isEmpty())return listTinhTrangKho ;
		else return null;
	}
	public ArrayList<BangDoanhThuChiTiet> duLieuBangDoanhThuChiTiet(String tenNSX) throws Exception{
		MyConnectDB mycn = new MyConnectDB();
		ResultSet rs = mycn.chonDuLieu("select qt.TenSanPham,qt.GiaTriChuaBanDuoc,qt.GiaTriBanDuoc,qx.GiaTriUocTinh from [dbo].[QuanLiTonKho] qt join [dbo].[QuanLiXuatKho] qx on qt.MaSanPham=qx.MaSanPham where qt.TenSanPham like'"+tenNSX+"%'");
		while(rs.next()){
			String nsx=rs.getString(1);
			String gtcbd=rs.getString(2);
			String gtbd=rs.getString(3);
			String gtx=rs.getString(4);
		
			listDoanhThuChiTiet.add(new BangDoanhThuChiTiet(nsx, gtcbd, gtbd, gtx));
		}
		if(!listDoanhThuChiTiet.isEmpty())return listDoanhThuChiTiet ;
		else return null;
	}
	public ArrayList<BangDiem> duLieuBangDiem(String maUser) throws Exception{
		MyConnectDB mycn = new MyConnectDB();
		ResultSet rs = mycn.chonDuLieu("SELECT * FROM [dbo].[BangDiem] WHERE MaUser ='"+maUser+"'");
		while(rs.next()){
			String ma=rs.getString(1);
			String mon=rs.getString(2);
			String diem=rs.getString(3);
			
			listBangDiem.add(new BangDiem(ma, mon, diem));
		}
		if(!listBangDiem.isEmpty())return listBangDiem ;
		else return null;
	}
	public static void main(String[] args) throws Exception {
		System.out.println(new BieuDoDAO().duLieuBangDiem("1"));
	}
}
