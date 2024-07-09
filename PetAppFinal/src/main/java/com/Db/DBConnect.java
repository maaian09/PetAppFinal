package com.Db;

import java.sql.Connection;

import java.sql.DriverManager;

public class DBConnect {

	
private static Connection conn;
public static Connection getConn() {
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");  // Încărcarea driverului JDBC specific pentru MySQL
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/petapp","root","Maaian09!!"); // Stabilirea conexiunii la baza de date MySQL
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return conn;
	
	
}
}





