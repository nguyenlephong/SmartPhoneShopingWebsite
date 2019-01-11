package dao;

public class PhanTrangDao {
	private int sizeDisplay;
	private int sizeArray;

	public PhanTrangDao(int sizeDisplay, int sizeArray) {
		super();
		this.sizeDisplay = sizeDisplay;
		this.sizeArray = sizeArray;
	}

	public int totalPage() {
		int totalPage = sizeArray / sizeDisplay;
		for (int i = 1; i <= totalPage; i++) {
			sizeArray = sizeArray % 20;
		}
		if (sizeArray > 1) {
			totalPage += 1;
		}
		if(totalPage==0){
			return 1;
		}
		return totalPage;
	}


	public static void main(String[] args) {
		System.out.println(new PhanTrangDao(12, 1).totalPage());
	}
}
