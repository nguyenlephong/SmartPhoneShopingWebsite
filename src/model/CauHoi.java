package model;

import java.util.Date;

public class CauHoi {
private int stt,luotXem,soCauTraLoi;
private String trangThai,tenCauHoi,noiDung,hinhAnh,maSanPham,nguoiDang;
private String ngayDang;
public CauHoi(int stt, String trangThai, String tenCauHoi, String noiDung, String hinhAnh,
		String maSanPham, String nguoiDang, String ngayDang) {
	super();
	this.stt = stt;
	this.trangThai = trangThai;
	this.tenCauHoi = tenCauHoi;
	this.noiDung = noiDung;
	this.hinhAnh = hinhAnh;
	this.maSanPham = maSanPham;
	this.nguoiDang = nguoiDang;
	this.ngayDang = ngayDang;
}
public int getStt() {
	return stt;
}
public void setStt(int stt) {
	this.stt = stt;
}
public int getLuotXem() {
	return luotXem;
}
public void setLuotXem(int luotXem) {
	this.luotXem = luotXem;
}
public int getSoCauTraLoi() {
	return soCauTraLoi;
}
public void setSoCauTraLoi(int soCauTraLoi) {
	this.soCauTraLoi = soCauTraLoi;
}
public String getTrangThai() {
	return trangThai;
}
public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
}
public String getTenCauHoi() {
	return tenCauHoi;
}
public void setTenCauHoi(String tenCauHoi) {
	this.tenCauHoi = tenCauHoi;
}
public String getNoiDung() {
	return noiDung;
}
public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
}
public String getHinhAnh() {
	return hinhAnh;
}
public void setHinhAnh(String hinhAnh) {
	this.hinhAnh = hinhAnh;
}
public String getMaSanPham() {
	return maSanPham;
}
public void setMaSanPham(String maSanPham) {
	this.maSanPham = maSanPham;
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
