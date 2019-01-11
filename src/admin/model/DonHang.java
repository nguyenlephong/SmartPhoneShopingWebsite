package admin.model;

public class DonHang {
	 String stt;
	 String maDonHang;
	 String ngayGui;
	 String trangThai;
	 String tenKhachHang;
	 String tenSanPham;
	 String tongSoTien;
	 String diaChi;
	 String sdt;
	 String moTa;
	 String username;
	 String soLuong;
	
	

	public DonHang(String stt, String maDonHang, String ngayGui, String trangThai, String tenKhachHang,
			String tenSanPham, String tongSoTien, String diaChi, String sdt, String moTa, String username,
			String soLuong) {
		super();
		this.stt = stt;
		this.maDonHang = maDonHang;
		this.ngayGui = ngayGui;
		this.trangThai = trangThai;
		this.tenKhachHang = tenKhachHang;
		this.tenSanPham = tenSanPham;
		this.tongSoTien = tongSoTien;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.moTa = moTa;
		this.username = username;
		this.soLuong = soLuong;
	}



	public String getStt() {
		return stt;
	}



	public void setStt(String stt) {
		this.stt = stt;
	}



	public String getMaDonHang() {
		return maDonHang;
	}



	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}



	public String getNgayGui() {
		return ngayGui;
	}



	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}



	public String getTrangThai() {
		return trangThai;
	}



	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}



	public String getTenKhachHang() {
		return tenKhachHang;
	}



	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}



	public String getTenSanPham() {
		return tenSanPham;
	}



	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}



	public String getTongSoTien() {
		return tongSoTien;
	}



	public void setTongSoTien(String tongSoTien) {
		this.tongSoTien = tongSoTien;
	}



	public String getDiaChi() {
		return diaChi;
	}



	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}



	public String getSdt() {
		return sdt;
	}



	public void setSdt(String sdt) {
		this.sdt = sdt;
	}



	public String getMoTa() {
		return moTa;
	}



	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getSoLuong() {
		return soLuong;
	}



	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}



	@Override
	public String toString() {
		return "DonHang [stt=" + stt + ", maDonHang=" + maDonHang + ", ngayGui=" + ngayGui + ", trangThai=" + trangThai
				+ ", tenKhachHang=" + tenKhachHang + ", tenSanPham=" + tenSanPham + ", tongSoTien=" + tongSoTien
				+ ", diaChi=" + diaChi + ", sdt=" + sdt + ", moTa=" + moTa + "\n";
	}
	
}
