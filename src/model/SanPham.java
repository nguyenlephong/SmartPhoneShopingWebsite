package model;

public class SanPham {
	private String maSanPham;
	private String  tenSanPham;
	private int giaSanPham;
	private String urlHinhAnh;
	private int soLuong;
	public SanPham(String maSanPham, String tenSanPham, int giaSanPham, String urlImage, int soLuong) {
		super();
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.giaSanPham = giaSanPham;
		this.urlHinhAnh = urlImage;
		this.soLuong = soLuong;
	}
	public String getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public int getGiaSanPham() {
		return giaSanPham;
	}
	public void setGiaSanPham(int giaSanPham) {
		this.giaSanPham = giaSanPham;
	}
	public String getUrlHinhAnh() {
		return urlHinhAnh;
	}
	public void setUrlHinhAnh(String urlHinhAnh) {
		this.urlHinhAnh = urlHinhAnh;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
}
