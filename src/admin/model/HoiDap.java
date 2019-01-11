package admin.model;

public class HoiDap {
private String tenHD,hinhAnh,noiDung,trangthai,maSP,nguoiDang,ngayDang;
private int maHD;

public HoiDap( String tenHD, String hinhAnh, String noiDung,String trangThai, String maSP, String nguoiDang,
		String ngayDang) {
	super();
	this.tenHD = tenHD;
	this.hinhAnh = hinhAnh;
	this.noiDung = noiDung;
	this.maSP = maSP;
	this.nguoiDang = nguoiDang;
	this.ngayDang = ngayDang;
	this.trangthai = trangThai;
}

public String getTrangthai() {
	return trangthai;
}

public void setTrangthai(String trangthai) {
	this.trangthai = trangthai;
}

public HoiDap() {
	// TODO Auto-generated constructor stub
}
public int getMaHD() {
	return maHD;
}

public void setMaHD(int maHD) {
	this.maHD = maHD;
}

public String getTenHD() {
	return tenHD;
}

public void setTenHD(String tenHD) {
	this.tenHD = tenHD;
}

public String getHinhAnh() {
	return hinhAnh;
}

public void setHinhAnh(String hinhAnh) {
	this.hinhAnh = hinhAnh;
}

public String getNoiDung() {
	return noiDung;
}

public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
}

public String getMaSP() {
	return maSP;
}

public void setMaSP(String maSP) {
	this.maSP = maSP;
}

public String getNguoiDang() {
	return nguoiDang;
}

public void setNguoiDang(String nguoiDang) {
	this.nguoiDang = nguoiDang;
}

public String getNgayDang() {
	return ngayDang;
}

public void setNgayDang(String ngayDang) {
	this.ngayDang = ngayDang;
}

}
