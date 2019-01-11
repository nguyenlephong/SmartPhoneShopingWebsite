package admin.model;

public class BangDiem {
	String ma;
	String mon;
	String diem;
	public BangDiem(String ma, String on, String diem) {
		super();
		this.ma = ma;
		this.mon = mon;
		this.diem = diem;
	}
	public String getMa() {
		return ma;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getDiem() {
		return diem;
	}
	public void setDiem(String diem) {
		this.diem = diem;
	}
	@Override
	public String toString() {
		return "BangDiem [ma=" + ma + ", mon=" + mon + ", diem=" + diem + "]";
	}
	
}
