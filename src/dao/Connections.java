package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Connections {
private  Connection connect;
private int id;
private boolean free;
public Connections( int id) {
	super();
	this.free = true;
	this.id = id;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public boolean isFree() {
	return free;
}

public void setFree(boolean free) {
	this.free = free;
}

public Connection getConnect() {
	return connect;
}

public void setConnect(Connection connect) {
	this.connect = connect;
}
public void closeConnect(){
	connect = null;
	free= true;
	System.out.println("Close Connect Thanh Cong");
}
public  Connection getConnectSever() {
	if(free){
			try {
//				Class.forName("com.mysql.jdbc.Driver");
//				connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopphonechuan","root","abcdabcd");
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				connect = DriverManager.getConnection("jdbc:sqlserver://shopphoneltw.database.windows.net:1433;database=Shopphone;user=shopphone@shopphoneltw;password=Admin1234;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30");
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println("Có Lỗi Xảy Ra "+e.getMessage());
			}
			return connect;
		}
	return null;
}
}
