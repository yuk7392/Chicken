package com.chicken.view.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;


public class UserUpdateController implements Controller {


	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		UserDto uDto = new UserDto();
		uDto.setId(id); uDto.setPw(password); uDto.setName(name);
		uDto.setNickname(nickname); uDto.setPhone(phone); uDto.setAddr(addr);
		
		UserDao mDao = new UserDao();
		mDao.userUpdate(uDto);
		
		return "loginpopup/updatesuccess";
	}
	
}

/*
            pstmt.setString(1, uDto.getName());
            pstmt.setString(2, uDto.getPhone());
            pstmt.setString(3, uDto.getAddr());
            pstmt.setString(4, uDto.getPw());
            pstmt.setString(5, uDto.getNickname());
            pstmt.setString(6, uDto.getId()); 
  */