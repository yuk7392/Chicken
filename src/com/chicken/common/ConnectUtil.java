package com.chicken.common;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.chicken.user.impl.UserDao;

public class ConnectUtil {

	private static UserDao mDao;
	private static  Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	

	public static synchronized UserDao getInstance() {
		if (mDao == null) {
			mDao = new UserDao();
		}
		return mDao;
	}
	
	// DB 연결
	public static Connection getConnection() {
		String url = "jdbc:mysql://127.0.0.1:3306/polychicken?serverTimezone=UTC&characterEncoding=utf-8&useSSL=false";
		String id = "root", pw = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// DB 종료
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
