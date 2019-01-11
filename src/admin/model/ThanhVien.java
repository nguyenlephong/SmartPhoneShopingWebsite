package admin.model;

public class ThanhVien {
	String id;
	String name;
	String level;
	String chuyen;
	String address;
	String phone;
	String image;
	String date;
	public ThanhVien(String id, String name, String level, String chuyen, String address, String phone, String image,
			String date) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.chuyen = chuyen;
		this.address = address;
		this.phone = phone;
		this.image = image;
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getChuyen() {
		return chuyen;
	}
	public void setChuyen(String chuyen) {
		this.chuyen = chuyen;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "ThanhVien [id=" + id + ", name=" + name + ", level=" + level + ", chuyen=" + chuyen + ", address="
				+ address + ", phone=" + phone + ", image=" + image + ", date=" + date + "]";
	}
	
}
