package model;

import admin.model.Date;

public class ChiTietDonHang extends PhieuMuaHang{
	private int STT;
	private String trangThaiGiaoHang;
	private String tenSanPham;
	private String diaChiGiaoHang;
	private int soLuong;
	private String moTa;
	public ChiTietDonHang( int sTT,String maDonHang, String ngayDatHang, String trangThaiGiaoHang, String tenKhachHang, String tenSanPham ,int tongThanhTien,
			  String diaChiGiaoHang, String soDienThoai, String moTa,int soLuong,String username) {
		super(maDonHang, ngayDatHang, tenKhachHang, tongThanhTien, soDienThoai,username);
		this.STT = sTT;
		this.trangThaiGiaoHang = trangThaiGiaoHang;
		this.tenSanPham = tenSanPham;
		this.diaChiGiaoHang = diaChiGiaoHang;
		this.moTa = moTa;
		this.soLuong=soLuong;
	}
	public int getSTT() {
		return STT;
	}
	public void setSTT(int sTT) {
		STT = sTT;
	}
	
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getTrangThaiGiaoHang() {
		return trangThaiGiaoHang;
	}
	public void setTrangThaiGiaoHang(String trangThaiGiaoHang) {
		this.trangThaiGiaoHang = trangThaiGiaoHang;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public String getDiaChiGiaoHang() {
		return diaChiGiaoHang;
	}
	public void setDiaChiGiaoHang(String diaChiGiaoHang) {
		this.diaChiGiaoHang = diaChiGiaoHang;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	@Override
	public String toString() {
		return "ChiTietDonHang [STT=" + STT + ", trangThaiGiaoHang=" + trangThaiGiaoHang + ", tenSanPham=" + tenSanPham
				+ ", diaChiGiaoHang=" + diaChiGiaoHang + ", soLuong=" + soLuong + ", moTa=" + moTa + ", getSTT()="
				+ getSTT() + ", getSoLuong()=" + getSoLuong() + ", getTrangThaiGiaoHang()=" + getTrangThaiGiaoHang()
				+ ", getTenSanPham()=" + getTenSanPham() + ", getDiaChiGiaoHang()=" + getDiaChiGiaoHang()
				+ ", getMoTa()=" + getMoTa() + ", getMaDonHang()=" + getMaDonHang() + ", getNgayDatHang()="
				+ getNgayDatHang() + ", getTenKhachHang()=" + getTenKhachHang() + ", getTongThanhTien()="
				+ getTongThanhTien() + ", getSoDienThoai()=" + getSoDienThoai() + ", getUserName()=" + getUserName()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
