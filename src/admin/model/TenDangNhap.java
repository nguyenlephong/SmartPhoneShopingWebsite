package admin.model;

public class TenDangNhap {
	public static int  maDN;
	public static String name;
	public static String hinhAnh;
	public TenDangNhap(){
		
	}
	public static int getMaDN() {
		return maDN;
	}
	public static void setMaDN(int maDN) {
		TenDangNhap.maDN = maDN;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		TenDangNhap.name = name;
	}
	public static String getHinhAnh() {
		return hinhAnh;
	}
	public static void setHinhAnh(String hinhAnh) {
		TenDangNhap.hinhAnh = hinhAnh;
	}
	
}
