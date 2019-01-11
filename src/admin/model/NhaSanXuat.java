package admin.model;

public class NhaSanXuat {
	String id;
	String maNSX;
	String maSP;
	String tenNSX;
	String diaChi;
	String sdt;

	public NhaSanXuat(String id, String maNSX, String maSP, String tenNSX, String diaChi, String sdt) {
		this.id = id;
		this.maNSX = maNSX;
		this.maSP = maSP;
		this.tenNSX = tenNSX;
		this.diaChi = diaChi;
		this.sdt = sdt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMaNSX() {
		return maNSX;
	}

	public void setMaNSX(String maNSX) {
		this.maNSX = maNSX;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTenNSX() {
		return tenNSX;
	}

	public void setTenNSX(String tenNSX) {
		this.tenNSX = tenNSX;
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

	@Override
	public String toString() {
		return "NhaSanXuat [id=" + id + ", maNSX=" + maNSX + ", maSP=" + maSP + ", tenNSX=" + tenNSX + ", diaChi="
				+ diaChi + ", sdt=" + sdt + "\n";
	}
	

}
