package model;

import admin.model.Date;

public abstract class PhieuMuaHang {
	private String maDonHang;
	private String ngayDatHang;
	private String tenKhachHang;
	private int tongThanhTien;
	private String soDienThoai;
	private String userName;
	public PhieuMuaHang(String maDonHang, String ngayDatHang, String tenKhachHang, int tongThanhTien,
			String soDienThoai, String userName) {
		super();
		this.maDonHang = maDonHang;
		this.ngayDatHang = ngayDatHang;
		this.tenKhachHang = tenKhachHang;
		this.tongThanhTien = tongThanhTien;
		this.soDienThoai = soDienThoai;
		this.userName = userName;
	}
	public String getMaDonHang() {
		return maDonHang;
	}
	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}
	public String getNgayDatHang() {
		return ngayDatHang;
	}
	public void setNgayDatHang(String ngayDatHang) {
		this.ngayDatHang = ngayDatHang;
	}
	public String getTenKhachHang() {
		return tenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}
	public int getTongThanhTien() {
		return tongThanhTien;
	}
	public void setTongThanhTien(int tongThanhTien) {
		this.tongThanhTien = tongThanhTien;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
