package admin.model;

public class User {
	String userid;
	String username;
	String pass;
	String name;
	String email;
	String address;
	String phone;
	String stk;
	String soLuotMuaHang;
	String role;

	public User(String username, String pass) {
		super();
		this.username = username;
		this.pass = pass;
	}

	public User(String userid, String username, String pass, String name, String email, String address, String phone,
			String stk) {
		super();
		this.userid = userid;
		this.username = username;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.stk = stk;
	}

	public User() {
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", pass=" + pass + ", name=" + name + ", email="
				+ email + ", address=" + address + ", phone=" + phone + "\n";
	}

	public String getSoLuotMuaHang() {
		return soLuotMuaHang;
	}

	public void setSoLuotMuaHang(String soLuotMuaHang) {
		this.soLuotMuaHang = soLuotMuaHang;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
