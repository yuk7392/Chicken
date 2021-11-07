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


public class OrderDAO {

	private Connection con;
	private ArrayList<orderDto> listOfNotice = new ArrayList<orderDto>();
	private static OrderDAO bDao;
	private PreparedStatement pstmt;
	public OrderDAO() {
	}

	public ArrayList<orderDto> getAllOrder() {
		return listOfNotice;
	}
	public static synchronized OrderDAO getInstance() {
		if (bDao == null) {
			bDao = new OrderDAO();
		}
		return bDao;
	}
	// 내 주문리스트 받아오기
	public OrderDAO(String id) { // pageNum = 보여줄 페이지가 몇페이지인지
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ordertbl where orderer ='"+id+"'order by ordertbl_no desc;";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

				while (rs.next()) {
					orderDto ot = new orderDto( rs.getInt("ordertbl_no"),rs.getInt("orderNumber"),
							rs.getString("ordertbl_status"),rs.getString("ordertbl_products"),rs.getString("ordertbl_addr"),
							rs.getString("orderer"), rs.getString("ordertbl_date"),rs.getInt("ordertbl_amount"),rs.getInt("ordertbl_price"));
					if(!orderNumberCheck( rs.getInt("orderNumber"))) { // 리스트에 같은 주문번호가 없으면 리스트에 추가
						listOfNotice.add(ot);
					}
					
					}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
	}
	
	public boolean orderNumberCheck(int orderNumber) { // 같은 주문 번호가 존재하는지 판별
		
		boolean ck= false;
		for(int i=0; i<listOfNotice.size();i++){  
			if(orderNumber==listOfNotice.get(i).getOrderNumber()){//같은 주문번호가 존재한다면 트루 반환
				ck= true;
		}
		}
		return ck;
	
	}


	// 영수증 받아오기
	public ArrayList<orderDto> read_order(String orderNumber) { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ordertbl where orderNumber ='"+orderNumber+"'";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

				while (rs.next()) {
					orderDto ot = new orderDto( rs.getInt("ordertbl_no"),rs.getInt("orderNumber"),
							rs.getString("ordertbl_status"),rs.getString("ordertbl_products"),rs.getString("ordertbl_addr"),
							rs.getString("orderer"), rs.getString("ordertbl_date"),rs.getInt("ordertbl_amount"),rs.getInt("ordertbl_price"));
						listOfNotice.add(ot);
					}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return listOfNotice;
	}
	
	
	public ArrayList<orderDto> getOrderList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<orderDto> arr = new ArrayList<orderDto>();
		 
		try {
			
			con = ConnectUtil.getConnection();
			String sql = "select * from ordertbl";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			orderDto dto = new orderDto();
			
			dto.setOrdertbl_no(rs.getInt("ordertbl_no"));
			dto.setOrderNumber(rs.getInt("orderNumber"));
			dto.setOrderer(rs.getString("orderer"));
			dto.setProducts(rs.getString("ordertbl_products"));
			dto.setDate(rs.getString("ordertbl_date"));
			dto.setStatus(rs.getString("ordertbl_status"));
			dto.setAddr(rs.getString("ordertbl_addr"));
			dto.setAmount(rs.getInt("ordertbl_amount"));
			dto.setPrice(rs.getInt("ordertbl_price"));
			
			arr.add(dto);
				
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return arr;
	}
	
	
	public boolean updateOrder(String id, String no, String number, String orderer, String products, String date, String status,String addr,String amount,String price) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update ordertbl set ordertbl_no='"+id+"',orderNumber='"+number+"',orderer='"+orderer+"',ordertbl_products='"+products+"',ordertbl_date='"+date+"',ordertbl_status='"+status+"',ordertbl_addr='"+addr+"',ordertbl_amount='"+amount+"',ordertbl_price='"+price+"' where ordertbl_no = '"+id+"'";

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

	public String getOrderInfo(String id, String act) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searching = act;
		String query, str, result;
		result = "null";
		query = "";
		str = "";

		switch (searching) {

		case "no":
			query = "select ordertbl_no from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_no";
			break;

		case "number":
			query = "select orderNumber from ordertbl where ordertbl_no='" + id + "'";
			str = "orderNumber";
			break;

		case "orderer":
			query = "select orderer from ordertbl where ordertbl_no='" + id + "'";
			str = "orderer";
			break;

		case "products":
			query = "select ordertbl_products from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_products";
			break;

		case "date":
			query = "select ordertbl_date from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_date";
			break;

		case "status":
			query = "select ordertbl_status from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_status";
			break;

		case "addr":
			query = "select ordertbl_addr from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_addr";
			break;
			
		case "amount":
			query = "select ordertbl_amount from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_amount";
			break;
			
		case "price":
			query = "select ordertbl_price from ordertbl where ordertbl_no='" + id + "'";
			str = "ordertbl_price";
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
	public boolean cancleOrder(String orderNumber) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from ordertbl where orderNumber='"+orderNumber+"'";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
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
	
	public boolean deleteOrder(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from ordertbl where ordertbl_no='"+id+"'";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
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
