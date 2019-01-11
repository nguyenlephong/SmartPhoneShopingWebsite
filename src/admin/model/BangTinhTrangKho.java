package admin.model;

public class BangTinhTrangKho {
	String tenNSX;
	String soLuongChuaBanDuoc;
	String giaTriChuaBanDuoc;
	String soLuongBanDuoc;
	String giaTriBanDuoc;
	String soLuongXuat;
	String giaTriXuat;
	public BangTinhTrangKho(String tenNSX, String soLuongChuaBanDuoc, String giaTriChuaBanDuoc, String soLuongBanDuoc,
			String giaTriBanDuoc, String soLuongXuat, String giaTriXuat) {
		super();
		this.tenNSX = tenNSX;
		this.soLuongChuaBanDuoc = soLuongChuaBanDuoc;
		this.giaTriChuaBanDuoc = giaTriChuaBanDuoc;
		this.soLuongBanDuoc = soLuongBanDuoc;
		this.giaTriBanDuoc = giaTriBanDuoc;
		this.soLuongXuat = soLuongXuat;
		this.giaTriXuat = giaTriXuat;
	}
	public String getTenNSX() {
		return tenNSX;
	}
	public void setTenNSX(String tenNSX) {
		this.tenNSX = tenNSX;
	}
	public String getSoLuongChuaBanDuoc() {
		return soLuongChuaBanDuoc;
	}
	public void setSoLuongChuaBanDuoc(String soLuongChuaBanDuoc) {
		this.soLuongChuaBanDuoc = soLuongChuaBanDuoc;
	}
	public String getGiaTriChuaBanDuoc() {
		return giaTriChuaBanDuoc;
	}
	public void setGiaTriChuaBanDuoc(String giaTriChuaBanDuoc) {
		this.giaTriChuaBanDuoc = giaTriChuaBanDuoc;
	}
	public String getSoLuongBanDuoc() {
		return soLuongBanDuoc;
	}
	public void setSoLuongBanDuoc(String soLuongBanDuoc) {
		this.soLuongBanDuoc = soLuongBanDuoc;
	}
	public String getGiaTriBanDuoc() {
		return giaTriBanDuoc;
	}
	public void setGiaTriBanDuoc(String giaTriBanDuoc) {
		this.giaTriBanDuoc = giaTriBanDuoc;
	}
	public String getSoLuongXuat() {
		return soLuongXuat;
	}
	public void setSoLuongXuat(String soLuongXuat) {
		this.soLuongXuat = soLuongXuat;
	}
	public String getGiaTriXuat() {
		return giaTriXuat;
	}
	public void setGiaTriXuat(String giaTriXuat) {
		this.giaTriXuat = giaTriXuat;
	}
	@Override
	public String toString() {
		return "BangTinhTrangKho [tenNSX=" + tenNSX + ", soLuongChuaBanDuoc=" + soLuongChuaBanDuoc
				+ ", giaTriChuaBanDuoc=" + giaTriChuaBanDuoc + ", soLuongBanDuoc=" + soLuongBanDuoc + ", giaTriBanDuoc="
				+ giaTriBanDuoc + ", soLuongXuat=" + soLuongXuat + ", giaTriXuat=" + giaTriXuat + "\n";
	}
	
	
}
