package admin.model;

public class CauTraLoi {
private String noidung,hinhanh;
private int maHD,stt;
public CauTraLoi( int maHD,String noidung, String hinhanh) {
	super();
	this.noidung = noidung;
	this.hinhanh = hinhanh;
	this.maHD = maHD;
}

public CauTraLoi(String noidung, String hinhanh, int maHD, int stt) {
	super();
	this.noidung = noidung;
	this.hinhanh = hinhanh;
	this.maHD = maHD;
	this.stt = stt;
}

public int getStt() {
	return stt;
}

public void setStt(int stt) {
	this.stt = stt;
}

public String getNoidung() {
	return noidung;
}
public void setNoidung(String noidung) {
	this.noidung = noidung;
}
public String getHinhanh() {
	return hinhanh;
}
public void setHinhanh(String hinhanh) {
	this.hinhanh = hinhanh;
}
public int getMaHD() {
	return maHD;
}
public void setMaHD(int maHD) {
	this.maHD = maHD;
}

}
