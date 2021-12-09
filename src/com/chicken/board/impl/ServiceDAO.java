package com.chicken.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import com.chicken.board.*;
import com.chicken.common.ConnectUtil;


public class ServiceDAO {

	private Connection con;
	private ArrayList<orderDto> listOfNotice = new ArrayList<orderDto>();
	private static ServiceDAO bDao;
	private PreparedStatement pstmt;
	
	public ArrayList<serviceDto> getServiceList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<serviceDto> arr = new ArrayList<serviceDto>();
		 
		try {
			
			con = ConnectUtil.getConnection();
			String sql = "select * from service";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			serviceDto dto = new serviceDto();
			
			dto.setNo(rs.getString("service_no"));
			dto.setTitle(rs.getString("service_title"));
			dto.setWriter(rs.getString("service_Writer"));
			dto.setDate(rs.getString("service_date"));
			dto.setContent(rs.getString("service_content"));
			dto.setStatus(rs.getString("service_status"));
			dto.setFile(rs.getString("service_file"));
			
			
			arr.add(dto);
				
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return arr;
	}
	
	
	public boolean updateService(String id, String title,String writer,String date,String content,String status,String file) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update service set service_no='"+id+"',service_title='"+title+"',service_Writer='"+writer+"',service_date='"+date+"',service_content='"+content+"',service_status='"+status+"',service_file='"+file+"'  where service_no = '"+id+"'";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;

	}

	public String getServiceInfo(String id, String act) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searching = act;
		String query, str, result;
		result = "null";
		query = "";
		str = "";

		switch (searching) {

		case "no":
			query = "select service_no from service where service_no='" + id + "'";
			str = "service_no";
			break;

		case "title":
			query = "select service_title from service where service_no='" + id + "'";
			str = "service_title";
			break;

		case "writer":
			query = "select service_Writer from service where service_no='" + id + "'";
			str = "service_Writer";
			break;

		case "date":
			query = "select service_date from service where service_no='" + id + "'";
			str = "service_date";
			break;

		case "content":
			query = "select service_content from service where service_no='" + id + "'";
			str = "service_content";
			break;

		case "status":
			query = "select service_status from service where service_no='" + id + "'";
			str = "service_status";
			break;

		case "file":
			query = "select service_file from service where service_no='" + id + "'";
			str = "service_file";
			break;
			
		}

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				result = rs.getString(str);

			}

		} catch (SQLException e) {

			System.out.println("Exception : " + e.getStackTrace());

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return result;

	}

	
	public boolean deleteService(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from service where service_no='"+id+"'";
	  	String query1 = "ALTER TABLE service AUTO_INCREMENT=1;";
		String query2 = "SET @COUNT = 0;";
		String query3 = "UPDATE service SET service_no = @COUNT:=@COUNT+1;";
		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query1);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(query2);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(query3);
			pstmt.executeUpdate();


		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		}

		finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;
	}

	
	
	
	
}
