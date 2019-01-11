package admin.model;

public class ThongKe {
	int soLuongUser;
	int soLuongSanPham;
	int soLuongSanPhamConKho;
	int soLuongSanPhamBanDuoc;
	int soLuongTuyCap;
	int soLuongDonDatHang;
	int soLuongBinhLuan;
	
	public ThongKe(int soLuongUser, int soLuongSanPham, int soLuongSanPhamConKho, int soLuongSanPhamBanDuoc,
			int soLuongTuyCap, int soLuongDonDatHang, int soLuongBinhLuan) {
		super();
		this.soLuongUser = soLuongUser;
		this.soLuongSanPham = soLuongSanPham;
		this.soLuongSanPhamConKho = soLuongSanPhamConKho;
		this.soLuongSanPhamBanDuoc = soLuongSanPhamBanDuoc;
		this.soLuongTuyCap = soLuongTuyCap;
		this.soLuongDonDatHang = soLuongDonDatHang;
		this.soLuongBinhLuan = soLuongBinhLuan;
	}
	
	public int getSoLuongSanPhamBanDuoc() {
		return soLuongSanPhamBanDuoc;
	}

	public void setSoLuongSanPhamBanDuoc(int soLuongSanPhamBanDuoc) {
		this.soLuongSanPhamBanDuoc = soLuongSanPhamBanDuoc;
	}

	public int getSoLuongUser() {
		return soLuongUser;
	}
	public void setSoLuongUser(int soLuongUser) {
		this.soLuongUser = soLuongUser;
	}
	public int getSoLuongSanPham() {
		return soLuongSanPham;
	}
	public void setSoLuongSanPham(int soLuongSanPham) {
		this.soLuongSanPham = soLuongSanPham;
	}
	public int getSoLuongSanPhamConKho() {
		return soLuongSanPhamConKho;
	}
	public void setSoLuongSanPhamConKho(int soLuongSanPhamConKho) {
		this.soLuongSanPhamConKho = soLuongSanPhamConKho;
	}
	public int getSoLuongTuyCap() {
		return soLuongTuyCap;
	}
	public void setSoLuongTuyCap(int soLuongTuyCap) {
		this.soLuongTuyCap = soLuongTuyCap;
	}
	public int getSoLuongDonDatHang() {
		return soLuongDonDatHang;
	}
	public void setSoLuongDonDatHang(int soLuongDonDatHang) {
		this.soLuongDonDatHang = soLuongDonDatHang;
	}
	public int getSoLuongBinhLuan() {
		return soLuongBinhLuan;
	}
	public void setSoLuongBinhLuan(int soLuongBinhLuan) {
		this.soLuongBinhLuan = soLuongBinhLuan;
	}
	
}
