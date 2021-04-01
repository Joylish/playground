package com.ssagibang.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/ssafyweb?serverTimezone=UTC";
	private static final String DB_USER = "ssafy";
	private static final String DB_PASSWORD = "ssafy";
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	}
	
	public static void close(ResultSet rs) throws SQLException {
		if (rs != null) rs.close();
	}
	public static void close(Statement stmt) throws SQLException {
		if (stmt != null) stmt.close();
	}
	public static void close(Connection conn) throws SQLException {
		if (conn != null) conn.close();
	}
}
