package com.chicken.view.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;


public class signupController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//읽어오기
		UserDto user = new UserDto();
		
		String id = request.getParameter("username");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String nickname = request.getParameter("nickname");
		
		user.setId(id);  user.setPw(pw);  user.setName(name);
		user.setPhone(phone); user.setAddr(addr); user.setNickname(nickname);
		
		
		//DB연결
		UserDao mDao = new UserDao();		
		//DB INSERT
		int signupCheck = mDao.sign_up(user);
		
		//기타오류실패 -1 , 성공 0 , 아이디 중복 1
		if(signupCheck == 0) {
			//RequestDispatcher dispatcher = request.getRequestDispatcher("login/signupsuccess.jsp");
			return "loginpopup/signupsuccess";
		}
		else if(signupCheck == 1) {
			return "loginpopup/signupiderror";
		}
		else {
			return "loginpopup/signuperror";
		}
		
	}
}
