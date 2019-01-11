package model;

public class ThongTinSanPhamTrongGioHang {
	private String maSP;
	private String tenSP;
	private int soLuong;
	private int gia;

	public ThongTinSanPhamTrongGioHang(String maSP, String tenSP, int soLuong, int gia) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.soLuong = soLuong;
		this.gia = gia;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getGia() {
		return gia * soLuong;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String toString() {
		return maSP + tenSP + gia + soLuong;
	}

}
