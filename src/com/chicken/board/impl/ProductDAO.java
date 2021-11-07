package com.chicken.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chicken.board.noticeTextVo;
import com.chicken.board.orderDto;
import com.chicken.board.productDto;
import com.chicken.common.ConnectUtil;


public class ProductDAO {

	private Connection con;
	private ArrayList<productDto> listOfProducts = new ArrayList<productDto>();
	private ArrayList<productDto> listOfPopulars = new ArrayList<productDto>();
	private static ProductDAO pDao;
	private PreparedStatement pstmt;
	ResultSet rs = null;
	
	public ArrayList<productDto> getAllProducts() {
		return listOfProducts;
	}
	public ArrayList<productDto> getPopularProducts() {
		return listOfPopulars;
	}
	public static synchronized ProductDAO getInstance() {
		if (pDao == null) {
			pDao = new ProductDAO();
		}
		return pDao;
	}

	//제품 상세 정보
	public productDto getProductInfo(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from product where p_id= '"+id+"';";
		productDto pt = new productDto();
	
		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				pt.setCategory(rs.getString("p_id"));
				pt.setDesc(rs.getString("p_desc"));;
				pt.setStock(Integer.parseInt(rs.getString("p_stock")));
				pt.setImgsrc(rs.getString("p_imgsrc"));
				pt.setLike(Integer.parseInt(rs.getString("p_like")));
				pt.setDislike(Integer.parseInt(rs.getString("p_Dislike")));
				pt.setView(Integer.parseInt(rs.getString("p_view")));
				pt.setId(rs.getString("p_id"));
				pt.setName(rs.getString("p_name"));
				pt.setPrice(Integer.parseInt(rs.getString("p_price")));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return pt;
		
	}
	
	
	public int thumbsUpdate(String productId,String thumbs) {

	
		String query = "";
		int likeCount = 0;
		if(thumbs.equals("up")) {
			query = "update product set p_like=p_like+1 where p_id='"+productId+"';";
		}
		else if(thumbs.equals("down")) {
			query = "update product set p_dislike=p_dislike+1 where p_id='"+productId+"';";
		}
		

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();
			query = "select * from product where p_id= '"+productId+"';";
			rs = pstmt.executeQuery(query);
			rs.next();
			likeCount = rs.getInt("p_like");
			System.out.println("좋아요수 불러오기"+likeCount);
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
			return likeCount;
	}
	
	  public ProductDAO() {
		   
		    con = ConnectUtil.getConnection();
		    
		    try {
		    	
		    String query = "select * from product";
		    
		    pstmt = con.prepareStatement(query);
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		    	
		    productDto p = new productDto(rs.getString("p_id"),rs.getString("p_name"),Integer.parseInt(rs.getString("p_price")));
		    p.setDesc(rs.getString("p_desc"));
		    p.setCategory(rs.getString("p_category"));
		   p.setStock(Integer.parseInt(rs.getString("p_stock")));
		   p.setImgsrc(rs.getString("p_imgsrc"));
		    p.setLike(Integer.parseInt(rs.getString("p_like")));
		   p.setDislike(Integer.parseInt(rs.getString("p_dislike")));
		   p.setView(Integer.parseInt(rs.getString("p_view")));
		    
		    listOfProducts.add(p);
		    
		    }
		    	
		    	
		    }catch(SQLException e) {
		    	e.printStackTrace();
		    }
	   }
	  //인기 메뉴 읽기
	  public ProductDAO(String popular) {
		   
		    con = ConnectUtil.getConnection();
		    
		    try {
		    	
		    String query = "select * from product order by p_view desc limit 3";
		    
		    pstmt = con.prepareStatement(query);
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		    	
		    productDto p = new productDto(rs.getString("p_id"),rs.getString("p_name"),Integer.parseInt(rs.getString("p_price")));
		    p.setDesc(rs.getString("p_desc"));
		    p.setCategory(rs.getString("p_category"));
		   p.setStock(Integer.parseInt(rs.getString("p_stock")));
		   p.setImgsrc(rs.getString("p_imgsrc"));
		    p.setLike(Integer.parseInt(rs.getString("p_like")));
		   p.setDislike(Integer.parseInt(rs.getString("p_Dislike")));
		   p.setView(Integer.parseInt(rs.getString("p_view")));
		    
		    listOfPopulars.add(p);
		    
		    }
		    	
		    	
		    }catch(SQLException e) {
		    	e.printStackTrace();
		    }
	   }
	 
	  
	  public productDto getProductById(String productId) {
		  productDto productById = null;
	      
	      for (int i=0; i<listOfProducts.size(); i++) {
	    	  productDto product = listOfProducts.get(i);
	         if (product != null && product.getId() != null && product.getId().equals(productId)) {
	            productById = product;
	            break;
	         }
	      }
	      return productById;
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


	//조회수 추가 함수
		public boolean viewAdd(String id) {

			System.out.println("DAO실행");
			Connection con = null;
			PreparedStatement pstmt = null;
			String query = "update product set p_view = p_view + 1 where p_id = '" + id + "';";

			try {

				con = ConnectUtil.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.executeUpdate();

			} catch (SQLException e) {
				System.out.println("Exception " + e);
				e.printStackTrace();
				return false;
			} finally {
				ConnectUtil.close(con, pstmt, null);
			}
			return true;
		}
	
	
	
	
	
	
}
