package admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import admin.model.*;

public class ImportExcelFileDAO {
	String text;

	public ImportExcelFileDAO(String text) {
		super();
		this.text = text;
	}

	public String getStringArray() {
		String res = "";
		String[] str = this.text.split("[\n]");
		for (String string : str) {
			res += string;
		}

		String sf = "";
		int batDau = 0;
		int ketThuc = 0;
		for (int i = 0; i < res.length(); i++) {
			if (res.charAt(i) != ' ') {
				sf += res.charAt(i) + "";
			}
		}
		for (int i = 0; i < sf.length(); i++) {
			if (sf.charAt(i) == '[') {
				batDau = i;
				break;
			}
		}
		for (int i = 0; i < sf.length(); i++) {
			if (sf.charAt(i) == ']') {
				ketThuc = i;
				break;
			}
		}
		res = sf.substring(batDau, ketThuc);
		res = res.substring(1, res.length());

		return res;
	}

	public Map<String, KhachHang> getCustomer(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, KhachHang> mapOBJ = new HashMap<String, KhachHang>();
		// lấy ra từng hàng của file excel
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
			// Lấy ra từng giá trị của hàng,tạo ra object tương ứng,truyền giá
			// trị của hàng vào thuộc tính
			for (int j = 0; j < listBig.size(); j++) {
				list = getStringDoubleDot(listBig.get(j));
				// Kiểm tra xem danh sách nhận từ excel có hợp lệ hay không,nếu có thì
				// import,ngược lại là return null
				if(list.size()==9){
				mapOBJ.put(list.get(0).substring(1, list.get(0).length() - 1), new KhachHang(list.get(0).substring(1, list.get(0).length() - 1),
						list.get(1).substring(1, list.get(1).length() - 1),
						list.get(2).substring(1, list.get(2).length() - 1),
						list.get(3).substring(1, list.get(3).length() - 1),
						list.get(4).substring(1, list.get(4).length() - 1),
						list.get(5).substring(1, list.get(5).length() - 1),
						list.get(6).substring(1, list.get(6).length() - 1),
						list.get(7).substring(1, list.get(7).length() - 1),
						list.get(8).substring(1, list.get(8).length() - 1)));
			}else{
				continue;
			}
				
		}
		return mapOBJ;
	}

	public Map<String, SanPham> getSanPham(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, SanPham> mapSanPham = new HashMap<>();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
			for (int j = 0; j < listBig.size(); j++) {
				list = getStringDoubleDot(listBig.get(j));
				if(list.size()==26){
				mapSanPham.put(list.get(1).substring(1, list.get(1).length() - 1),
						new SanPham(list.get(0).substring(1, list.get(0).length() - 1),
								list.get(1).substring(1, list.get(1).length() - 1),
								list.get(2).substring(1, list.get(2).length() - 1),
								list.get(3).substring(1, list.get(3).length() - 1),
								list.get(4).substring(1, list.get(4).length() - 1),
								list.get(5).substring(1, list.get(5).length() - 1),
								list.get(6).substring(1, list.get(6).length() - 1),
								list.get(7).substring(1, list.get(7).length() - 1),
								list.get(8).substring(1, list.get(8).length() - 1),
								list.get(9).substring(1, list.get(9).length() - 1),
								list.get(10).substring(1, list.get(10).length() - 1),
								list.get(11).substring(1, list.get(11).length() - 1),
								list.get(12).substring(1, list.get(12).length() - 1),
								list.get(13).substring(1, list.get(13).length() - 1),
								list.get(14).substring(1, list.get(14).length() - 1),
								list.get(15).substring(1, list.get(15).length() - 1),
								list.get(16).substring(1, list.get(16).length() - 1),
								list.get(17).substring(1, list.get(17).length() - 1),
								list.get(18).substring(1, list.get(18).length() - 1),
								list.get(19).substring(1, list.get(19).length() - 1),
								list.get(20).substring(1, list.get(20).length() - 1),
								list.get(21).substring(1, list.get(21).length() - 1),
								list.get(22).substring(1, list.get(22).length() - 1),
								list.get(23).substring(1, list.get(23).length() - 1),
								list.get(24).substring(1, list.get(24).length() - 1),
								list.get(25).substring(1, list.get(25).length() - 1)));
			}else{
				continue;
			}
		}
		return mapSanPham;
	}

	public Map<String, BinhLuan> getBinhLuan(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, BinhLuan> mapBinhLuan = new HashMap<>();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		for (int j = 0; j < listBig.size(); j++) {
			list = getStringDoubleDot(listBig.get(j));
			if (list.size() == 4) {
				mapBinhLuan.put(list.get(0).substring(1, list.get(0).length() - 1),
						new BinhLuan(list.get(0).substring(1, list.get(0).length() - 1),
								list.get(1).substring(1, list.get(1).length() - 1),
								list.get(2).substring(1, list.get(2).length() - 1),
								list.get(3).substring(1, list.get(3).length() - 1)));
			} else
				continue;
		}
		return mapBinhLuan;
	}

	public Map<String, NhaSanXuat> getNhaSanXuat(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, NhaSanXuat> mapNhaSanXuat = new HashMap<>();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		for (int j = 0; j < listBig.size(); j++) {
			list = getStringDoubleDot(listBig.get(j));
			// ham substring dùng để cắt chuổi "abc" thành abc
			if (list.size() == 6) {
				mapNhaSanXuat.put(list.get(1).substring(1, list.get(1).length() - 1),
						new NhaSanXuat(list.get(0).substring(1, list.get(0).length() - 1),
								list.get(1).substring(1, list.get(1).length() - 1),
								list.get(2).substring(1, list.get(2).length() - 1),
								list.get(3).substring(1, list.get(3).length() - 1),
								list.get(4).substring(1, list.get(4).length() - 1),
								list.get(5).substring(1, list.get(5).length() - 1)));
			} else {
				continue;
			}
		}
		return mapNhaSanXuat;
	}

	public Map<String, DonHang> getDonHang(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, DonHang> mapDonHang = new HashMap<>();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		for (int j = 0; j < listBig.size(); j++) {
			list = getStringDoubleDot(listBig.get(j));
			if (list.size() == 12) {
				mapDonHang.put(list.get(1).substring(1, list.get(1).length() - 1),
						new DonHang(list.get(0).substring(1, list.get(0).length() - 1),
								list.get(1).substring(1, list.get(1).length() - 1),
								list.get(2).substring(1, list.get(2).length() - 1),
								list.get(3).substring(1, list.get(3).length() - 1),
								list.get(4).substring(1, list.get(4).length() - 1),
								list.get(5).substring(1, list.get(5).length() - 1),
								list.get(6).substring(1, list.get(6).length() - 1),
								list.get(7).substring(1, list.get(7).length() - 1),
								list.get(8).substring(1, list.get(8).length() - 1),
								list.get(9).substring(1, list.get(9).length() - 1),
								list.get(10).substring(1, list.get(10).length() - 1),
								list.get(11).substring(1, list.get(11).length() - 1)));
			} else {
				continue;
			}
		}
		return mapDonHang;
	}

	public ArrayList<String> getStringDoubleDot(String s) {
		ArrayList<String> list = new ArrayList<>();
		String[] arr = s.split(",");
		for (int i = 0; i < arr.length; i++) {
			list.add(arr[i].split(":")[1]);
		}
		return list;
	}

	public static void main(String[] args) {
		String text = "{  abcd.xlsx: {    Sheet1: [      {        stt: 1,      ten: Nguy?n V?n A 1,   ngay: 12/12/17,noidung: I love you 1 }, {   stt: 2,ten: Nguy?n V?n A 2,        ngay: 12/13/17,       noidung: I love you 2      },],    Sheet2: [],    Sheet3: []  }}";
		// System.out.println(new ImportExcelFileDAO(text).getStringArray());
		System.out.println(new ImportExcelFileDAO(text).getBinhLuan(new ImportExcelFileDAO(text).getStringArray()));
	}
}
