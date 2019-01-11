package dao;
import java.util.ArrayList;
import model.ThongTinDienThoai;
public class ChonSanPhamDao {
	public static ArrayList<ThongTinDienThoai>chonTheoNhaSX=new ArrayList<>();
	public ChonSanPhamDao() {
		super();
	}
	public void chonSanPham(String s){
		String sub;
		if(s.equals("Iphone")){
			for(int i=0;i<TatCaSPDao.tatCa.size();i++){
				sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
				if(sub.equals("I0")){
					chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
				}
			}
		}else
		 if(s.equals("Samsung")){
			 for(int i=0;i<TatCaSPDao.tatCa.size();i++){
					sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
					if(sub.equals("SS")){
						chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
					}
				}
		}else if(s.equals("Sony")){
			for(int i=0;i<TatCaSPDao.tatCa.size();i++){
				sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
				if(sub.equals("SN")){
					chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
				}
			}
		}else
		 if(s.equals("LG")){
			 for(int i=0;i<TatCaSPDao.tatCa.size();i++){
					sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
					if(sub.equals("LG")){
						chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
					}
				}
		}else
		 if(s.equals("Oppo")){
			 for(int i=0;i<TatCaSPDao.tatCa.size();i++){
					sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
					if(sub.equals("OP")){
						chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
					}
				}
		}else
		 if(s.equals("HTC")){
			 for(int i=0;i<TatCaSPDao.tatCa.size();i++){
					sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
					if(sub.equals("HT")){
						chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
					}
				}
		}else
		 if(s.equals("Huawei")){
			 for(int i=0;i<TatCaSPDao.tatCa.size();i++){
					sub=TatCaSPDao.tatCa.get(i).getMaSP().substring(0, 2);
					if(sub.equals("HU")){
						chonTheoNhaSX.add(new ThongTinDienThoai(TatCaSPDao.tatCa.get(i).getMaSP(), TatCaSPDao.tatCa.get(i).getTen(), TatCaSPDao.tatCa.get(i).getGia(), TatCaSPDao.tatCa.get(i).getManhinhRong(), TatCaSPDao.tatCa.get(i).getCnManHinh(), TatCaSPDao.tatCa.get(i).getHdh(), TatCaSPDao.tatCa.get(i).getCpu(), TatCaSPDao.tatCa.get(i).getRam(), TatCaSPDao.tatCa.get(i).getRom(), TatCaSPDao.tatCa.get(i).getCamera(), TatCaSPDao.tatCa.get(i).getSelfie(), TatCaSPDao.tatCa.get(i).getPin(), TatCaSPDao.tatCa.get(i).getSim(), TatCaSPDao.tatCa.get(i).getHinhAnh()));
					}
				}
		}else
		 if(s.equals("Tatca")){
			 for (int i = 0; i < TatCaSPDao.tatCa.size(); i++) {
				chonTheoNhaSX.add(TatCaSPDao.tatCa.get(i));
			}
		 }
	}


}
