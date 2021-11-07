package com.chicken.view.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;


public class MypageViewController implements Controller {


	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//head에서 넘어온 mypage_id를 mem_id에 저장
		String mem_id = request.getParameter("mypage_id");
		
		//DAO 선언
		UserDao mDao = new UserDao();
		//DTO 선언
		UserDto uDto = new UserDto();
		//DTO에 DAO의 Userinfo 함수를 이용해 DB 내용 넣기
		
		uDto = mDao.Userinfo(mem_id);
		
		//requset에 UserDto 객체 저장 
		HttpSession session = request.getSession();

		session.setAttribute("mypageview", uDto);
	
		return "login/myPage";
	}
	
	
	
	
}