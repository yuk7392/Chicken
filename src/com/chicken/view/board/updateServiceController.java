package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chicken.board.impl.ServiceDAO;
import com.chicken.view.Controller;


public class updateServiceController implements Controller {
	private static final long serialVersionUID = 1L;
       



	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	
	     	String id = request.getParameter("id"); 
	 
	     	ServiceDAO mDao = new ServiceDAO();	
	        
	        
			
			
		    String title=mDao.getServiceInfo(id, "title");
		    String writer=mDao.getServiceInfo(id, "writer");
		    String date=mDao.getServiceInfo(id, "date");
		    String content=mDao.getServiceInfo(id, "content");
		    String status=request.getParameter("status");
		    String file=mDao.getServiceInfo(id, "file");
		    
			if(mDao.updateService(id,title,writer,date,content,status,file)) 
			{

				return"./adminPopup/updateSuccess_service";

			}else{
				
				return"./adminPopup/updateFail_service"; 
			}
			
			
	
			
	
		
		
		/*
		 * System.out.println("아이디 test의 전 정보");
		 * System.out.println("------------------------");
		 * System.out.println("번호 : "+mDao.getUserInfo(m1,"no"));
		 * System.out.println("이름 : "+mDao.getUserInfo(m1,"name"));
		 * System.out.println("전화번호 : "+mDao.getUserInfo(m1,"tel"));
		 * System.out.println("주소 : "+mDao.getUserInfo(m1,"addr"));
		 * System.out.println("아이디 : "+mDao.getUserInfo(m1,"id"));
		 * System.out.println("비밀번호 : "+mDao.getUserInfo(m1,"pw"));
		 * System.out.println("등급 : "+mDao.getUserInfo(m1,"grade"));
		 * System.out.println("장바구니 : "+mDao.getUserInfo(m1,"basket"));
		 * System.out.println("닉네임 : "+mDao.getUserInfo(m1,"nickname"));
		 * System.out.println("잘못 입력시 id 리턴 : "+mDao.getUserInfo(m1,"테스트"));
		 * request.setAttribute("Uid", mDao.getUserInfo(m1,"id"));
		 * request.setAttribute("Uno", mDao.getUserInfo(m1,"no"));;
		 * Uname=mDao.getUserInfo(m1,"name"); Utel=mDao.getUserInfo(m1,"tel");
		 * Uaddr=mDao.getUserInfo(m1,"addr"); Upw=mDao.getUserInfo(m1,"pw");
		 * Ugrade=mDao.getUserInfo(m1,"grade"); Ubasket=mDao.getUserInfo(m1,"basket");
		 * Unickname=mDao.getUserInfo(m1,"nickname");
		 */
		
	}
	

}
