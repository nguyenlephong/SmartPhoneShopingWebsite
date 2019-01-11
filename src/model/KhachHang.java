package model;

public class KhachHang {
	private String tenTaiKhoan;
	private String matKhau;
	private String tenKhachHang;
	private String email;
	private String diaChi;
	private String sdt;
	private String soTaiKhoan;
	private int soSanPhamDaMua;
	private String role="admin";
	public KhachHang(String tenTaiKhoan, String matKhau, String tenKhachHang, String email, String diaChi, String sdt,String soTaiKhoan,int soSanPhamDaMua) {
		super();
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.tenKhachHang = tenKhachHang;
		this.email = email;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.soTaiKhoan=soTaiKhoan;
		this.soSanPhamDaMua=soSanPhamDaMua;
	}
	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}
	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getTenKhachHang() {
		return tenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getSoTaiKhoan() {
		return soTaiKhoan;
	}
	public void setSoTaiKhoan(String soTaiKhoan) {
		this.soTaiKhoan = soTaiKhoan;
	}
	public int getSoSanPhamDaMua() {
		return soSanPhamDaMua;
	}
	public void setSoSanPhamDaMua(int soSanPhamDaMua) {
		this.soSanPhamDaMua = soSanPhamDaMua;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String toString(){
		return matKhau;
	}
}
