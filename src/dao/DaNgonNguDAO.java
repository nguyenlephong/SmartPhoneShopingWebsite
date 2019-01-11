package dao;

import java.util.HashMap;
import java.util.Map;

public class DaNgonNguDAO {
	public static Map<String, String> vietNam(){
		Map<String, String> vietNam = new HashMap<>();
		vietNam.put("login", "Đăng nhập");
		vietNam.put("username", "Tên tài khoản");
		vietNam.put("password", "Mật khẩu");
		vietNam.put("forget", "Quên mật khẩu ?");
		vietNam.put("create", "Tạo tài khoản ?");
		vietNam.put("answer", "Bạn có muốn tạo tài khoản ?");
		return vietNam;
	}
	
	public static Map<String, String> english(){
		Map<String, String> english = new HashMap<>();
		english.put("login", "Login");
		english.put("username", "Username");
		english.put("password", "Password");
		english.put("forget", "Forget pass ?");
		english.put("create", "Create account ?");
		english.put("answer", "Do you how create account ?");
		return english;
	}
}
