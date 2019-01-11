package admin.model;

public class KhoHang {
	String id;
	String xyz;
	String productID;
	String productName;
	String producerName;
	String soLuongChuaBanDuoc;
	String giaTienChuaBanDuoc;
	String soLuongBanDuoc;
	String giaTienBanDuoc;
	public KhoHang(String id, String xyz, String productID, String productName, String producerName,
			String soLuongChuaBanDuoc, String giaTienChuaBanDuoc, String soLuongBanDuoc, String giaTienBanDuoc) {
		super();
		this.id = id;
		this.xyz = xyz;
		this.productID = productID;
		this.productName = productName;
		this.producerName = producerName;
		this.soLuongChuaBanDuoc = soLuongChuaBanDuoc;
		this.giaTienChuaBanDuoc = giaTienChuaBanDuoc;
		this.soLuongBanDuoc = soLuongBanDuoc;
		this.giaTienBanDuoc = giaTienBanDuoc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXyz() {
		return xyz;
	}
	public void setXyz(String xyz) {
		this.xyz = xyz;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProducerName() {
		return producerName;
	}
	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}
	public String getSoLuongChuaBanDuoc() {
		return soLuongChuaBanDuoc;
	}
	public void setSoLuongChuaBanDuoc(String soLuongChuaBanDuoc) {
		this.soLuongChuaBanDuoc = soLuongChuaBanDuoc;
	}
	public String getGiaTienChuaBanDuoc() {
		return giaTienChuaBanDuoc;
	}
	public void setGiaTienChuaBanDuoc(String giaTienChuaBanDuoc) {
		this.giaTienChuaBanDuoc = giaTienChuaBanDuoc;
	}
	public String getSoLuongBanDuoc() {
		return soLuongBanDuoc;
	}
	public void setSoLuongBanDuoc(String soLuongBanDuoc) {
		this.soLuongBanDuoc = soLuongBanDuoc;
	}
	public String getGiaTienBanDuoc() {
		return giaTienBanDuoc;
	}
	public void setGiaTienBanDuoc(String giaTienBanDuoc) {
		this.giaTienBanDuoc = giaTienBanDuoc;
	}
	@Override
	public String toString() {
		return "KhoHang [id=" + id + ", xyz=" + xyz + ", productID=" + productID + ", productName=" + productName
				+ ", producerName=" + producerName + ", soLuongChuaBanDuoc=" + soLuongChuaBanDuoc
				+ ", giaTienChuaBanDuoc=" + giaTienChuaBanDuoc + ", soLuongBanDuoc=" + soLuongBanDuoc
				+ ", giaTienBanDuoc=" + giaTienBanDuoc + "]";
	}
	
	
}
