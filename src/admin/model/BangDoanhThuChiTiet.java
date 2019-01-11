package admin.model;

public class BangDoanhThuChiTiet {
	String tenSP;
	String giaTriChuaBanDuoc;
	String giaTriBanDuoc;
	String giaTriXuat;
	public BangDoanhThuChiTiet(String tenSP, String giaTriChuaBanDuoc, String giaTriBanDuoc, String giaTriXuat) {
		super();
		this.tenSP = tenSP;
		this.giaTriChuaBanDuoc = giaTriChuaBanDuoc;
		this.giaTriBanDuoc = giaTriBanDuoc;
		this.giaTriXuat = giaTriXuat;
	}
	@Override
	public String toString() {
		return "BangDoanhThuChiTiet [tenSP=" + tenSP + ", giaTriChuaBanDuoc=" + giaTriChuaBanDuoc + ", giaTriBanDuoc="
				+ giaTriBanDuoc + ", giaTriXuat=" + giaTriXuat + "\n";
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public String getGiaTriChuaBanDuoc() {
		return giaTriChuaBanDuoc;
	}
	public void setGiaTriChuaBanDuoc(String giaTriChuaBanDuoc) {
		this.giaTriChuaBanDuoc = giaTriChuaBanDuoc;
	}
	public String getGiaTriBanDuoc() {
		return giaTriBanDuoc;
	}
	public void setGiaTriBanDuoc(String giaTriBanDuoc) {
		this.giaTriBanDuoc = giaTriBanDuoc;
	}
	public String getGiaTriXuat() {
		return giaTriXuat;
	}
	public void setGiaTriXuat(String giaTriXuat) {
		this.giaTriXuat = giaTriXuat;
	}
	
}
