package admin.model;

import java.text.DecimalFormat;

public class BinhLuan {
			String stt;
			String ten;
			String ngay;
			String noiDung;
			
			public BinhLuan() {
				super();
			}
			public BinhLuan(String stt, String ten, String ngay, String noiDung) {
				super();
				this.stt = stt;
				this.ten = ten;
				this.ngay = ngay;
				this.noiDung = noiDung;
			}
			public String getStt() {
				return stt;
			}
			public String getTen() {
				return ten;
			}
			public String getNgay() {
				return ngay;
			}
			public String getNoiDung() {
				return noiDung;
			}

			
}
