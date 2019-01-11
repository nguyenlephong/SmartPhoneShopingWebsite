package dao;

import java.util.ArrayList;

import model.ThongTinDienThoai;

public class TatCa {
	public static ArrayList<ThongTinDienThoai>tatCaDT=new ArrayList<>();

	public TatCa() {
		super();
	}
	public void tatCaSP(){
		TatCaSPDao.tatCa.removeAll(TatCaSPDao.tatCa);
		if(tatCaDT.size()==0){
			TatCaSPDao tatca=new TatCaSPDao();
			for (int i = 0; i < tatca.tatCa.size(); i++) {
				tatCaDT.add(tatca.tatCa.get(i));
			}
		}
	}
	

}
