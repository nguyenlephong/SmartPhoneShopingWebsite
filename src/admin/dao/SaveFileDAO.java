package admin.dao;

import java.util.HashMap;
import java.util.Map;

import admin.model.*;

public class SaveFileDAO {

	public static Map<String,admin.model.FileImage> mapUrlFile = new HashMap<>();
	
	public SaveFileDAO(){
	}
	
	public String getImageUrl(String name){
		return mapUrlFile.get(name).getUrl();
	}
	
}
