package com.chicken.user.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.chicken.common.ConnectUtil;
import com.chicken.user.Admin_userDto;
import com.chicken.user.UserDto;





public class UserDao {
	private static UserDao mDao;
	private  Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	

	public static synchronized UserDao getInstance() {
		if (mDao == null) {
			mDao = new UserDao();
		}
		return mDao;
	}
	// 로그인 체크
    public boolean loginCheck(String id, String password) {
    	
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
        	con = ConnectUtil.getConnection();
            String strQuery = "select user_id, user_pw from user where user_id = ? and user_pw = ?";
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	ConnectUtil.close(con, pstmt, null);
        }
        return loginCon;
    }	
	
    //회원가입 / DB insert
    public int sign_up(UserDto user) {
    	Connection con = null;
    	PreparedStatement pstmt = null;
        int signupCon = -1;
        
        //입력 잘못되어있으면 취소
        if(user.getId()==null || user.getPw()==null || user.getName() == null || user.getPhone()==null || user.getAddr()==null || user.getNickname()==null) {
        	return signupCon;       
        	}
        
        // ======== 아이디 중복 체크 ============ 
        ResultSet rs = null;
        boolean idCon = false;
        boolean telCon = false;
        try {
        	con = ConnectUtil.getConnection();
            String strQuery = "select user_id from user where user_id = ?";
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, user.getId());
            rs = pstmt.executeQuery();
            idCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        }
        // 중복이면 1 리턴
        if(idCon) {
        	ConnectUtil.close(con, pstmt, null);
        	return 1;
        	}
       // ======== 전화번호 중복 체크 ============ 
        try {
            String strQuery = "select user_tel from user where user_tel = ?";
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, user.getPhone());
            rs = pstmt.executeQuery();
            telCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        }
        // 중복이면 2 리턴
        if(telCon) {
        	ConnectUtil.close(con, pstmt, null);
        	System.out.println("asdf");
        	return 2;
        	}
        
        
        // insert
        try {
        	//con = ConnectUtil.getConnection(); 
            String strQuery = "insert into user (user_name, user_tel, user_addr, user_id, user_pw, user_grade, user_nickname) VALUES (?,?,?,?,?,?,?)";
            //"insert into user (user_name, user_tel, user_addr, user_id, user_pw, user_grade) VALUES (?,?,?,?,?,'일반');"
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPhone());
            pstmt.setString(3, user.getAddr());
            pstmt.setString(4, user.getId());
            pstmt.setString(5, user.getPw());
            pstmt.setString(6, "일반");
            pstmt.setString(7, user.getNickname());
            int count = pstmt.executeUpdate();

            if(count == 1) signupCon = 0;
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	ConnectUtil.close(con, pstmt, null);
        }
    	
    	return signupCon;
    }
	
	// 등급 체크
    public String CheckGrade(String id) {
    	
    	Statement stmt=null;
        ResultSet rs = null;
    	String usergrade = "";
        
        boolean Con = false;
        
        try {
        	con = ConnectUtil.getConnection();
        	
        	stmt = con.createStatement();
        	
            String strQuery = "select * from user where user_id = '" + id + "'";
            rs = stmt.executeQuery(strQuery);
            rs.next();
            
            usergrade = rs.getString("user_grade");
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	ConnectUtil.close(con, pstmt, null);
        }
        return usergrade;
    }	
	
    //ID 받아서 해당 ID의 정보 DTO로 리턴
    //마이페이지에 사용
    public UserDto Userinfo(String id) {
    	
    	Statement stmt=null;
        ResultSet rs = null;
    	UserDto users = new UserDto();
        
        try {
        	con = ConnectUtil.getConnection();
        	
        	stmt = con.createStatement();
        	
            String strQuery = "select * from user where user_id = '" + id + "'";
            rs = stmt.executeQuery(strQuery);
            rs.next();
            users.setId(rs.getString("user_id"));
            users.setPw(rs.getString("user_pw"));
            users.setName(rs.getString("user_name"));
            users.setPhone(rs.getString("user_tel"));
            users.setAddr(rs.getString("user_addr"));
            users.setNickname(rs.getString("user_nickname"));
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	ConnectUtil.close(con, pstmt, null);
        }
    	
    	return users;
    }
    
    //uDto를 받아 해당하는 아이디 통채로 변경
    public boolean userUpdate(UserDto uDto) {
    	
    	PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
        	con = ConnectUtil.getConnection();
            String strQuery = "update user set user_name=?, user_tel=?,user_addr=?,user_pw=?, user_nickname=? where user_id=?";
            /*
             update user set user_name=?, user_tel=?,user_addr=?,user_id=?,user_pw=?, user_nickname=? where user_id=?;
             */
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, uDto.getName());
            pstmt.setString(2, uDto.getPhone());
            pstmt.setString(3, uDto.getAddr());
            pstmt.setString(4, uDto.getPw());
            pstmt.setString(5, uDto.getNickname());
            pstmt.setString(6, uDto.getId());
            
            pstmt.executeUpdate();
            //rs = pstmt.executeQuery();
            //loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            return false;
        } finally {
        	ConnectUtil.close(con, pstmt, null);
        }
    	
    	return true;
    }
    
    
    //==================================
    //ID 유저의 원하는 정보(act)를 리턴하는 함수
    public String getUserInfo(String id,String act) {
    	
   	 PreparedStatement pstmt = null;
        ResultSet rs = null;
        String searching = act;
        String query,str,result;
        result = "null";
       		 
        switch(searching) {
        
        case "no":
        query = "select user_no from user where user_id='"+id+"'";
        str = "user_no";
        break;
        
        case "name":
        query = "select user_name from user where user_id='"+id+"'";
        str = "user_name";
        break;
        
        case "tel":
        query = "select user_tel from user where user_id='"+id+"'";
        str = "user_tel";
        break;
        
        case "addr":
        query = "select user_addr from user where user_id='"+id+"'";
        str = "user_addr";
        break;
        
        case "id":
        query = "select user_id from user where user_id='"+id+"'";
        str = "user_id";
        
        case "pw":
        query = "select user_pw from user where user_id='"+id+"'";
        str = "user_pw";
        break;
        
        case "grade":
        query = "select user_grade from user where user_id='"+id+"'";
        str = "user_grade";
        break;
        
        case "basket":
        query = "select user_basket from user where user_id='"+id+"'";
        str = "user_basket";
        break;
        
        case "nickname":
        query = "select user_nickname from user where user_id='"+id+"'";
        str = "user_nickname";
        break;
        
        default:
       	 
        query = "select user_id from user where user_id='"+id+"'";
        str = "user_id";
        break;
        
        }
        
        try {
       	 
       	con = ConnectUtil.getConnection(); 
       	pstmt = con.prepareStatement(query);
       	rs = pstmt.executeQuery();
       	
       	
       	while(rs.next()) {
       		
       		result = rs.getString(str);
       		
       	}
       	
        }catch(SQLException e) {
       	 
       	System.out.println("Exception : "+e.getStackTrace());
       	
        }
    finally {
   	ConnectUtil.close(con, pstmt, null);
      
   }
        return result;
   	
   }
    
    // 유저 정보 모두 받아들이기
    public ArrayList<Admin_userDto> getUserList() {
    	
      	 PreparedStatement pstmt = null;
           ResultSet rs = null;
           ArrayList<Admin_userDto> l = new ArrayList<Admin_userDto>();
           
           try {
          	String query = "select * from user";
          	con = ConnectUtil.getConnection(); 
          	pstmt = con.prepareStatement(query);
          	rs = pstmt.executeQuery();
          	
          	
          	while(rs.next()) {
          		
          		Admin_userDto a = new Admin_userDto();
          		a.setNo(rs.getString("user_no"));
          		a.setName(rs.getString("user_name"));
          		a.setTel(rs.getString("user_tel"));
          		a.setAddr(rs.getString("user_addr"));
          		a.setId(rs.getString("user_id"));
          		a.setPw(rs.getString("user_pw"));
          		a.setGrade(rs.getString("user_grade"));
          		a.setBasket(rs.getString("user_basket"));
          		a.setNickname(rs.getString("user_nickname"));
          		
          		l.add(a);
          		
          	}
          	
           }catch(SQLException e) {
          	 
          	System.out.println("Exception : "+e.getStackTrace());
          	
           }
       finally {
      	ConnectUtil.close(con, pstmt, null);
         
      }
           return l;
      	
      }
    
   
   //유저의 정보 변경. userUpdate(UserDto uDto)와 겹침
   public boolean updateUserInfo(String id,String user_name,String user_tel,String user_addr, String user_pw,String user_grade,String user_basket,String user_nickname) {
   Connection con = null;
   PreparedStatement pstmt = null;
   String query = "update user set user_name = '"+user_name+"',user_tel='"+user_tel+"', user_addr='"+user_addr+"', user_pw='"+user_pw+"', user_grade='"+user_grade+"', user_basket='"+user_basket+"', user_nickname='"+user_nickname+"' where user_id ='"+id+"'";
   
   try {
   	
   	con = ConnectUtil.getConnection();
   	pstmt = con.prepareStatement(query);
   	pstmt.executeUpdate();
   	
   	
   } catch(SQLException e) {
   	
       e.printStackTrace();
		  return false;
   	
   } finally {
   	ConnectUtil.close(con, pstmt, null);
	       
   }
 return true;
   	
   	
   }
   
   public boolean deleteUserInfo(String id) {
   	
   	  Connection con = null;
   	  PreparedStatement pstmt = null;
   	  String query = "delete from user where user_id ='"+id+"'";
  	String query1 = "ALTER TABLE notice AUTO_INCREMENT=1;";
	String query2 = "SET @COUNT = 0;";
	String query3 = "UPDATE notice SET notice_no = @COUNT:=@COUNT+1;";
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
   		  
   		  
   	  }catch(SQLException e) {
   		  
   		  e.printStackTrace();
   		  return false;
   		  
   	  }
   	  
   	  finally {
   	    	ConnectUtil.close(con, pstmt, null);
   	       
   	    }
   	  return true;
   }
   
   
   public String setOrder (String orderer, String orderProducts, String orderDate, String orderStatus, String orderAddr) {
   	Connection con = null;
   	PreparedStatement pstmt = null;
   	con = ConnectUtil.getConnection();
       // insert
       try {
           String orderQuery = "insert into ordertbl (orderer, ordertbl_products, ordertbl_date, ordertbl_status, ordertbl_addr) VALUES (?,?,?,?,?)";
           //"insert into user (user_name, user_tel, user_addr, user_id, user_pw, user_grade) VALUES (?,?,?,?,?,'일반');"
           pstmt = con.prepareStatement(orderQuery);
           pstmt.setString(1, orderer);
           pstmt.setString(2, orderProducts);
           pstmt.setString(3, orderDate);
           pstmt.setString(4, orderStatus);
           pstmt.setString(5, orderAddr);
           pstmt.executeUpdate();

       } catch (Exception ex) {
           System.out.println("Exception" + ex);
       } finally {
       	ConnectUtil.close(con, pstmt, null);
       }
   	
   	return null;
   }
    
   public void setOrder(String orderer, String orderProducts, String orderDate, String orderStatus, String orderAddr,
			int orderNum, int orderAmounts, int orderPrice) {
		Connection con = null;
	   	PreparedStatement pstmt = null;
	   	con = ConnectUtil.getConnection();
	       // insert
	       try {
	           String orderQuery = "insert into ordertbl (orderer, ordertbl_products, ordertbl_date, ordertbl_status, ordertbl_addr, orderNumber, ordertbl_amount, ordertbl_price) VALUES (?,?,?,?,?,?,?,?)";
	           //"insert into user (user_name, user_tel, user_addr, user_id, user_pw, user_grade) VALUES (?,?,?,?,?,'일반');"
	           pstmt = con.prepareStatement(orderQuery);
	           pstmt.setString(1, orderer);
	           pstmt.setString(2, orderProducts);
	           pstmt.setString(3, orderDate);
	           pstmt.setString(4, orderStatus);
	           pstmt.setString(5, orderAddr);
	           pstmt.setInt(6,orderNum);
	           pstmt.setInt(7,orderAmounts);
	           pstmt.setInt(8,orderPrice);
	           pstmt.executeUpdate();

	       } catch (Exception ex) {
	           System.out.println("Exception" + ex);
	       } finally {
	       	ConnectUtil.close(con, pstmt, null);
	       }
	   	
	   	return;
		
	}
   
   
   
}


