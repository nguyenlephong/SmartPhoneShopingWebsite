package model;

public class ThongTinDienThoai {
	String maSP;
	private String ten;
	private String gia;

	private String manhinhRong;
	private String cnManHinh;
	private String hdh;
	private String cpu;
	private String ram;
	private String rom;
	private String selfie;
	private String camera;
	private String pin;
	private String sim;
	private String hinhAnh;

	public ThongTinDienThoai() {

	}

	public ThongTinDienThoai(String maSP, String ten, String gia, String manhinhRong, String cnManHinh, String hdh,
			String cpu, String ram, String rom, String selfie, String camera, String pin, String sim, String hinhAnh) {
		super();
		this.maSP = maSP;
		this.ten = ten;
		this.gia = gia;
		this.manhinhRong = manhinhRong;
		this.cnManHinh = cnManHinh;
		this.hdh = hdh;
		this.cpu = cpu;
		this.ram = ram;
		this.rom = rom;
		this.selfie = selfie;
		this.camera = camera;
		this.pin = pin;
		this.sim = sim;
		this.hinhAnh = hinhAnh;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getGia() {
		return gia;
	}

	public void setGia(String gia) {
		this.gia = gia;
	}

	public String getManhinhRong() {
		return manhinhRong;
	}

	public void setManhinhRong(String manhinhRong) {
		this.manhinhRong = manhinhRong;
	}

	public String getCnManHinh() {
		return cnManHinh;
	}

	public void setCnManHinh(String cnManHinh) {
		this.cnManHinh = cnManHinh;
	}

	public String getHdh() {
		return hdh;
	}

	public void setHdh(String hdh) {
		this.hdh = hdh;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getRom() {
		return rom;
	}

	public void setRom(String rom) {
		this.rom = rom;
	}

	public String getSelfie() {
		return selfie;
	}

	public void setSelfie(String selfie) {
		this.selfie = selfie;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getSim() {
		return sim;
	}

	public void setSim(String sim) {
		this.sim = sim;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public String toString() {
		return "ThongTinDienThoai [maSP=" + maSP + ", ten=" + ten + ", gia=" + gia + ", manhinhRong=" + manhinhRong
				+ ", cnManHinh=" + cnManHinh + ", hdh=" + hdh + ", cpu=" + cpu + ", ram=" + ram + ", rom=" + rom
				+ ", camera=" + camera + ", selfie=" + selfie + ", pin=" + pin + ", sim=" + sim + ", hinhAnh=" + hinhAnh
				+ "]";
	}

}