package admin.model;

public class KhachHang {
	String id;
	String user;
	String pass;
	String name;
	String email;
	String address;
	String phone;
	String stk;
	String soLuotMuaHang;
	public KhachHang(String id, String user, String pass, String name, String email, String address, String phone,
			String stk) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.stk = stk;
	}

	
	public KhachHang(String id, String user, String pass, String name, String email, String address, String phone,
			String stk, String soLuotMuaHang) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.stk = stk;
		this.soLuotMuaHang = soLuotMuaHang;
	}


	public String getSoLuotMuaHang() {
		return soLuotMuaHang;
	}

	public void setSoLuotMuaHang(String soLuotMuaHang) {
		this.soLuotMuaHang = soLuotMuaHang;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStk() {
		return stk;
	}
	public void setStk(String stk) {
		this.stk = stk;
	}
	
}
