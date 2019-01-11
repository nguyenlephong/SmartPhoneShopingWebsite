package dao;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class PoolConnect {
public  static  final int SOLUONG=10; 
private Map<Integer, Connections> dsConnect;
private static PoolConnect instance;
Connections con;
public static PoolConnect getInstance(){
	if(instance == null){
		instance = new PoolConnect();
	}
	return instance;
}
private PoolConnect(){
	dsConnect = new HashMap<>();
	for (int i = 1; i <= SOLUONG; i++) {
		dsConnect.put(i, new Connections(i));
	}
}
public void getConnectionWork(){
	dsConnect.forEach((k,v) -> {
		if(!v.isFree()){
			System.out.println(k);
		}
	});
}
public Connections freeConnection(){
	con= dsConnect.entrySet().stream().filter(map -> map.getValue().isFree()).findFirst().orElse(null).getValue();
	if(con != null){
		con.getConnectSever();
	con.setFree(false);
return con;
	}
	return null;
}

}
