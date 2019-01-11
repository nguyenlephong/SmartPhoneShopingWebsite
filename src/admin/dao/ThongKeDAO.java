package admin.dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import admin.model.*;

public class ThongKeDAO {
	public ThongKeDAO() {
	
	}
	public ArrayList<String> danhSachNgayTrongTuan(String week,String text){
		int tuan = Integer.parseInt(week);
		String year=text.substring(0,text.indexOf("-"));
		String month=text.substring(text.indexOf("-")+1, text.length());
		ArrayList<String> listDate = new ArrayList<>();
		switch (tuan) {
		case 1:
			listDate.add(year+"-"+month+"-"+1);
			listDate.add(year+"-"+month+"-"+7);
			break;
		case 2:
			listDate.add(year+"-"+month+"-"+8);
			listDate.add(year+"-"+month+"-"+14);
			break;
		case 3:
			listDate.add(year+"-"+month+"-"+15);
			listDate.add(year+"-"+month+"-"+21);
			break;
		case 4:
			listDate.add(year+"-"+month+"-"+22);
			listDate.add(year+"-"+month+"-"+31);
			break;
		default:
			break;
		}
		return listDate;
	}
	//thá»‘ng kÃª theo tuáº§n
	public Map<String,DonHang> getDonHangTheoTuan(String week,String text){
		ArrayList<String> listDate = danhSachNgayTrongTuan(week, text);
		Date startDate =changeDate(listDate.get(0));
		Date endDate =changeDate(listDate.get(1));
		return thongKeSoDonHang(startDate, endDate);
	}
	//thá»‘ng kÃª theo tuáº§n cá»§a há»‡ thá»‘ng
	public Map<String,DonHang> getDonHangTheoTuanHeThong(){
		java.util.Date today=new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat timeFormat= new SimpleDateFormat("yyyy-MM-dd");
		String s=timeFormat.format(today.getTime());
		int date=Integer.parseInt(s.substring(s.lastIndexOf("-")+1,s.length()));
		String week="";
		String text=s.substring(0,s.lastIndexOf("-"));
		if(date>=1 && date<=7){
			week="1";
		}else if(date>=8 && date<=14){
			week="2";
		}else if(date>=15 && date<=21){
			week="3";
		}else{
			week="4";
		}
		return getDonHangTheoTuan(week, text);
	}
	
	//thá»‘ng kÃª theo thÃ¡ng
	public Map<String,DonHang> getDonHangTheoThang(String date){
		String year=date.substring(0,date.indexOf("-"));
		String month=date.substring(date.indexOf("-")+1, date.length());
		Map<String,DonHang> map = new HashMap<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select MaDonHang from ChiTietDonHang where year(NgayDatHang)='"+year+"' and month(NgayDatHang)='"+month+"'");
			while(rs.next()){
				map.put(rs.getString(1), DonHangDAO.mapOrder.get(rs.getString(1)));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	//thá»‘ng kÃª theo thÃ¡ng cá»§a há»‡ thá»‘ng
		public Map<String,DonHang> getDonHangTheoThangHeThong(){
			Map<String,DonHang> map = new HashMap<>();
			java.util.Date today=new java.util.Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat= new SimpleDateFormat("yyyy-MM-dd");
			String s=timeFormat.format(today.getTime());
			String month=s.substring(s.indexOf("-")+1,s.indexOf("-")+3);
			String year=s.substring(0,s.indexOf("-"));
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select MaDonHang from ChiTietDonHang where year(NgayDatHang)='"+year+"' and month(NgayDatHang)='"+month+"'");
				while(rs.next()){
					map.put(rs.getString(1), DonHangDAO.mapOrder.get(rs.getString(1)));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return map;
		}
	//thá»‘ng kÃª theo ngÃ y
		public Map<String,DonHang> getDonHangTheoNgay(String date){
			Map<String,DonHang> map = new HashMap<>();
			try {
				ResultSet rs = new MyConnectDB().chonDuLieu("select MaDonHang from ChiTietDonHang where NgayDatHang='"+date+"'");
				while(rs.next()){
					map.put(rs.getString(1), DonHangDAO.mapOrder.get(rs.getString(1)));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return map;
		}
	//thá»‘ng kÃª theo ngÃ y cá»§a há»‡ thá»‘ng
	public Map<String,DonHang> getDonHangTheoNgayHeThong(){
		Map<String,DonHang> map = new HashMap<>();
		java.util.Date today=new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat timeFormat= new SimpleDateFormat("yyyy-MM-dd");
		String s=timeFormat.format(today.getTime());
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select MaDonHang from ChiTietDonHang where NgayDatHang='"+s+"'");
			while(rs.next()){
				map.put(rs.getString(1), DonHangDAO.mapOrder.get(rs.getString(1)));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public ThongKeDAO(String date){
		mapDonHangThongKeTheoNgay = getDonHangTheoNgay(date);
		mapDonHangThongKeTheoThang = getDonHangTheoThang(date);
	}
	
	// KHá»Ÿi táº¡o contructor vá»›i 2 phÆ°Æ¡ng thá»©c
	public ThongKeDAO(Date startsDate, Date endDate) {
		// 1 lÃ : láº¥y ra sá»‘ lÆ°á»£ng Ä‘Æ¡n hÃ ng trong khoáº£n ngÃ y nháº­n vÃ o
		soLuongDonHang = thongKeSoDonHang(startsDate, endDate).size();
		// 2 lÃ : láº¥y ra danh sÃ¡ch Ä‘Æ¡n hÃ ng trong khoáº£n ngÃ y nháº­n vÃ o
		mapDonHangThongKe = thongKeSoDonHang(startsDate, endDate);
		
		soLuongBinhLuan = thongKeSoBinhLuan(startsDate, endDate).size();
		mapBinhLuanThongKe = thongKeSoBinhLuan(startsDate, endDate);
		
	}
	public ThongKeDAO ( String week,String text){
		mapDonHangThongKeTheoTuan = getDonHangTheoTuan(week, text);
	}

	public static int soLuongDonHang = 0;
	public static int soLuongBinhLuan = 0;

	public static Map<String, DonHang> mapDonHangThongKeTheoThang = null;
	public static Map<String, DonHang> mapDonHangThongKeTheoTuan = null;
	public static Map<String, DonHang> mapDonHangThongKeTheoTuanHeThong = new ThongKeDAO().getDonHangTheoTuanHeThong();
	public static Map<String, DonHang> mapDonHangThongKeTheoNgay = null;
	public static Map<String, DonHang> mapDonHangThongKeTheoNgayHeThong = new ThongKeDAO().getDonHangTheoNgayHeThong();
	public static Map<String, DonHang> mapDonHangThongKeTheoThangHeThong= new ThongKeDAO().getDonHangTheoThangHeThong();
	
	
	public static Map<String, DonHang> mapDonHangThongKe = null;
	public static Map<String, BinhLuan> mapBinhLuanThongKe = null;

	public static ArrayList<Date> danhSachTatCaCacNgayTrongBangDonHang = layDuLieuDonHang();
	public static ArrayList<Date> danhSachTatCaCacNgayTrongBangBinhLuan = layDuLieuBinhLuan();

	// PhÆ°Æ¡ng thá»©c láº¥y ra mÃ£ Ä‘Æ¡n hÃ ng Ä‘Ã£ thá»‘ng kÃª
	public static Map<String, DonHang> thongKeSoDonHang(Date startsDate, Date endDate) {
		Map<String, DonHang> map = new HashMap<>();
		for (Date x : danhSanhChuaNgayCanThongKe(startsDate, endDate)) {
			for (Date y : layDuLieuDonHang()) {
				// Kiá»ƒm tra náº¿u 2 ngÃ y trong 2 danh sÃ¡ch nÃ y trÃ¹ng nhau thÃ¬ láº¥y
				// ra Ä‘Æ¡n hÃ ng Ä‘Ã³,vÃ  put vÃ o map
				if (new ThongKeDAO().equalDate(x, y)) {
					String ngayMua = x.getYear() + "-" + x.getMonth() + "-" + x.getDay();
					ArrayList<DonHang> listDonHang = new DonHangDAO().layDonHangTheoNgayMua(ngayMua);
					for(DonHang tmp:listDonHang){
						map.put(tmp.getMaDonHang(), tmp);
					}
				}
			}
		}
		return map;
	}
	public static Map<String, BinhLuan> thongKeSoBinhLuan(Date startsDate, Date endDate) {
		Map<String, BinhLuan> map = new HashMap<>();
		for (Date x : danhSanhChuaNgayCanThongKe(startsDate, endDate)) {
			for (Date y : layDuLieuBinhLuan()) {
				// Kiá»ƒm tra náº¿u 2 ngÃ y trong 2 danh sÃ¡ch nÃ y trÃ¹ng nhau thÃ¬ láº¥y
				// ra Ä‘Æ¡n hÃ ng Ä‘Ã³,vÃ  put vÃ o map
				if (new ThongKeDAO().equalDate(x, y)) {
					String ngayMua = x.getYear() + "-" + x.getMonth() + "-" + x.getDay();
					BinhLuan tmp = new BinhLuanDAO().layBinhLuanTheoNgayMua(ngayMua);
					map.put(tmp.getStt(), tmp);
				}
			}
		}
		return map;
	}

	// PhÆ°Æ¡ng thá»©c kiá»ƒm tra 2 Ä‘á»‘i tÆ°á»£ng ngÃ y thÃ¡ng nÄƒm cÃ³ báº±ng nhau khÃ´ng
	public boolean equalDate(Date d1, Date d2) {
		boolean day = d1.getDay().equals(d2.getDay());
		boolean month = d1.getMonth().equals(d2.getMonth());
		boolean year = d1.getYear().equals(d2.getYear());

		if (day && month && year) {
			return true;
		} else
			return false;
	}

	/*
	 * Ä�Ã¢y lÃ  phÆ°Æ¡ng thá»©c tráº£ vá»� danh sÃ¡ch ngÃ y trong khoáº£ng ngÃ y nháº­n vÃ o, Ã½
	 * tÆ°á»Ÿng lÃ  mÃ¬nh sáº½ láº¥y ra danh sÃ¡ch cÃ¡c ngÃ y thÃ¡ng nÄƒm trong khoáº£ng ngÃ y
	 * nháº­n vÃ o vÃ­ dá»¥ ngÃ y nháº­n vÃ o lÃ  : 10/5/2017-10/6/2017 ThÃ¬ danh sÃ¡ch nÃ y
	 * sáº½ tráº£ vá»� : 10/5/2017-11/5/2017-12/5/2017-...-10/6/2017 PhÆ°Æ¡ng thá»©c nÃ y
	 * cÃ³ má»™t nhÆ°á»£c Ä‘iá»ƒm lÃ  mÃ¬nh fix cá»©ng giÃ¡ trá»‹ má»™t thÃ¡ng cÃ³ 31 ngÃ y,vÃ  chá»‰ Ã¡p
	 * dá»¥ng thá»‘ng kÃª chÃ´ má»™t 1 nÄƒm
	 * 
	 */
	public static ArrayList<Date> danhSanhChuaNgayCanThongKe(Date startsDate, Date endDate) {
		ArrayList<Date> tmp = new ArrayList<>();
		if (!startsDate.getYear().equals(endDate.getYear())) {
			System.out.println("Khac nam");
		} else if (Integer.parseInt(startsDate.getMonth()) > Integer.parseInt(endDate.getMonth())) {
			System.out.println("Ngay bat dau lon hon ngay ket thuc");
		} else if (Integer.parseInt(startsDate.getMonth()) <= Integer.parseInt(endDate.getMonth())
				&& startsDate.getYear().equals(endDate.getYear())) {
//			int doLechNgay=0;
//			if(doLechNgay(startsDate, endDate)==0){
//				doLechNgay=1;
//			}
			int doLechThang = doLechThang(startsDate, endDate);
			// Chuyá»ƒn Ä‘á»•i string vá»� sá»‘
			int d1 = Integer.parseInt(startsDate.getDay());
			int d2 = Integer.parseInt(endDate.getDay());
			int month = Integer.parseInt(startsDate.getMonth());
			int year = Integer.parseInt(startsDate.getYear());

			for (int i = 1, t = d1; i <= doLechNgay(startsDate, endDate); i++, t++) {
				if ((t == d2) && (doLechThang == 0)) {
					if (t < 10 && month < 10) {
						tmp.add(new Date("0" + t + "", "0" + month + "", year + ""));
					} else if (t < 10 && month >= 10) {
						tmp.add(new Date("0" + t + "", month + "", year + ""));
					} else if (t >= 10 && month >= 10) {
						tmp.add(new Date(t + "", month + "", year + ""));
					} else if (t >= 10 && month < 10) {
						tmp.add(new Date(t + "", "0" + month + "", year + ""));
					}
					return tmp;
				} else {
					if (t == 31) {
						// VÃ¬ 1 thÃ¡ng 31 ngÃ y,nÃªn xÃ©t Ä‘iá»�u kiá»‡n náº¿u tÄƒng Ä‘áº¿n 31
						// thÃ¬ quay láº¡i tá»« 1,Ä‘á»“ng thá»�i Ä‘á»™ lá»‡ch thÃ¡ng sáº½ giáº£m 1
						doLechThang--;
						if (month < 10) {
							tmp.add(new Date(t + "", "0" + month + "", year + ""));
						} else if (month >= 10) {
							tmp.add(new Date(t + "", month + "", year + ""));
						}
						tmp.add(new Date(t + "", month + "", year + ""));
						month++;
						t = 0;
						continue;
					} else {
						// XÃ©t cÃ¡c Ä‘iá»�u kiá»‡n thÃªm sá»‘ khÃ´ng á»Ÿ Ä‘áº§u nhá»¯ng
						// ngÃ y,thÃ¡ng nhá»� hÆ¡n 10
						if (t < 10 && month < 10) {
							tmp.add(new Date("0" + t + "", "0" + month + "", year + ""));
						} else if (t < 10 && month >= 10) {
							tmp.add(new Date("0" + t + "", month + "", year + ""));
						} else if (t >= 10 && month >= 10) {
							tmp.add(new Date(t + "", month + "", year + ""));
						} else if (t >= 10 && month < 10) {
							tmp.add(new Date(t + "", "0" + month + "", year + ""));
						}
					}
				}
			}
		}
		return tmp;
	}

	public static void main(String[] args) {
		 Date d1 = new Date("8", "5", "2017");
		 Date d2 = new Date("20", "5", "2017");
//		 for(Date d: danhSanhChuaNgayCanThongKe(d1, d2)){
//		 System.out.println(d);
//		 }
		 System.out.println(new ThongKeDAO().getDonHangTheoTuan("1", "2017-5"));
		 
	}
	
	// TÃ­nh Ä‘á»™ lá»‡ch thÃ¡ng,Ä‘á»™ lá»‡ch ngÃ y,phá»¥c vá»¥ cho pháº§n trÃªn
	public static int doLechNgay(Date startsDate, Date endDate) {
		int day1 = Integer.parseInt(startsDate.getDay()) + Integer.parseInt(startsDate.getMonth()) * 31;
		int day2 = Integer.parseInt(endDate.getDay()) + Integer.parseInt(endDate.getMonth()) * 31;
		return (day2 - day1)+1;
	}

	public static int doLechThang(Date startsDate, Date endDate) {
		return Integer.parseInt(endDate.getMonth()) - Integer.parseInt(startsDate.getMonth());
	}

	// PhÆ°Æ¡ng thá»©c nÃ y dÃ¹ng Ä‘á»ƒ láº¥y toÃ n bá»™ ngÃ y mÃ  khÃ¡ch hÃ ng mua cá»§a báº£ng Ä‘Æ¡n
	// hÃ ng
	private static ArrayList<Date> layDuLieuDonHang() {
		ArrayList<Date> list = new ArrayList<>();
		Map<String, DonHang> dh = DonHangDAO.mapOrder;
		for (DonHang date : dh.values()) {
			list.add(changeDate2(date.getNgayGui()));
		}
		return list;
	}
	private static ArrayList<Date> layDuLieuBinhLuan() {
		ArrayList<Date> list = new ArrayList<>();
		Map<String, BinhLuan> dh = BinhLuanDAO.mapComment;
		for (BinhLuan date : dh.values()) {
			list.add(changeDate2(date.getNgay()));
		}
		return list;
	}

	// PhÆ°Æ¡ng thá»©c nÃ y dÃ¹ng Ä‘á»ƒ Ä‘á»•i ngÃ y tá»« jsp-servlet vá»� java
	public static Date changeDate(String date) {
		Date d = null;
		String day = date.substring(0, date.indexOf("-"));
		String month = date.substring(date.indexOf("-") + 1, date.lastIndexOf("-"));
		String year = date.substring(date.lastIndexOf("-") + 1, date.length());
		d = new Date(year, month, day);
		return d;
	}

	// DÃ¹ng Ä‘á»ƒ Ä‘á»•i ngÃ y tá»« database lÃªn
	public static Date changeDate2(String date) {
		Date d = null;
		String day = date.substring(0, date.indexOf("-"));
		String month = date.substring(date.indexOf("-") + 1, date.lastIndexOf("-"));
		String year = date.substring(date.lastIndexOf("-") + 1, date.length());
		d = new Date(year, month, day);
		return d;
	}

	//// Viáº¿t bÄƒng java8
	// public static boolean coTruocNgayChoTruocHayKhong(Date d1,Date d2){
	// return doLechNgay(d1, d2)<0;
	// }
	// public static Map<String,DonHang> danhSachTheoKhoangNgay(Map<String,
	// DonHang> map,Date d1,Date d2){
	// Map<String, DonHang> mapLayNgaySau = map.values().stream()
	// .filter(p->coTruocNgayChoTruocHayKhong(changeDate2(p.getNgayMua()),d1))
	// .collect(Collectors.toMap(p->p.getId(), p->p));
	// Map<String, DonHang> mapLayNgayTruoc = map.values().stream()
	// .filter(p->!coTruocNgayChoTruocHayKhong(changeDate2(p.getNgayMua()),d2))
	// .collect(Collectors.toMap(p->p.getId(), p->p));
	//
	// Collection<DonHang> dsNgayTruoc = mapLayNgayTruoc.values();
	// Collection<DonHang> dsNgaySau = mapLayNgaySau.values();
	//
	// dsNgayTruoc.forEach(System.out::println);
	// System.out.println("----------------------------------------");
	// dsNgaySau.forEach(System.out::println);
	// System.out.println("----------------------------------------");
	// dsNgayTruoc.retainAll(dsNgaySau);
	// return dsNgayTruoc.stream().collect(Collectors.toMap(p->p.getId(),
	// p->p));
	// }

}
