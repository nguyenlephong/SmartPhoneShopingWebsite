package admin.dao;

import java.util.Stack;

import org.eclipse.jdt.internal.compiler.batch.Main;

import admin.model.*;


public class UndoDAO {
	public static Stack<KhachHang> undoCustomer = new Stack<>();
	public static Stack<SanPham> undoProduct = new Stack<>();
	public static Stack<DonHang> undoOrder = new Stack<>();
	public static Stack<BinhLuan> undoBinhLuan = new Stack<>();
	
	public static Stack<KhoHang> undoKhoHang = new Stack<>();
	public static Stack<NhaSanXuat> undoNhaSanXuat = new Stack<>();
	public static Stack<ThanhVien> undoThanhVien = new Stack<>();
	
	public boolean restoreDeletedCustomer(){
		if(!undoCustomer.isEmpty()){
			KhachHang kh = undoCustomer.pop();
			if(kh!=null){
				KhachHangDAO.mapCustomer.put(kh.getId(), kh);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedBinhLuan(){
		if(!undoBinhLuan.isEmpty()){
			BinhLuan kh = undoBinhLuan.pop();
			if(kh!=null){
				BinhLuanDAO.mapComment.put(kh.getStt(), kh);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedProduct(){
		if(!undoProduct.isEmpty()){
			SanPham sp = undoProduct.pop();
			if(sp!=null){
				SanPhamDAO.mapProduct.put(sp.getMaSanPham(), sp);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedOrder(){
		if(!undoOrder.isEmpty()){
			DonHang o = undoOrder.pop();
			if(o!=null){
				DonHangDAO.mapOrder.put(o.getMaDonHang(), o);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedKhoHang(){
		if(!undoKhoHang.isEmpty()){
			KhoHang kh = undoKhoHang.pop();
			if(kh!=null){
				KhoHangDAO.mapKhoHang.put(kh.getId(), kh);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedProducer(){
		if(!undoNhaSanXuat.isEmpty()){
			NhaSanXuat sp = undoNhaSanXuat.pop();
			if(sp!=null){
				NhaSanXuatDAO.mapProducer.put(sp.getMaNSX(), sp);
			}
			return true;
		}else{
			return false;
		}
	}
	public boolean restoreDeletedThanhVien(){
		if(!undoThanhVien.isEmpty()){
			ThanhVien o = undoThanhVien.pop();
			if(o!=null){
				ThanhVienDAO.mapMember.put("", o);
			}
			return true;
		}else{
			return false;
		}
	}
	public static String bamMatKhau(String matKhau){
		long hash = 5;
		for (int i = 0; i < matKhau.length(); i++) {
		    hash = hash*4 + matKhau.charAt(i);
		}
		return hash+"";
	}
	public static void main(String[] args) {
		System.out.println(bamMatKhau("1234567"));
	}
	
}
