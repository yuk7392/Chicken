package com.chicken.view.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;


public class updateUserController implements Controller {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		
		String m1 = request.getParameter("id"); // 알맞게 수정
		String m2 = request.getParameter("name"); // 해주세요.
		String m3 = request.getParameter("tel");
		String m4 = request.getParameter("addr");
		String m5 = request.getParameter("pw");
		String m6 = request.getParameter("grade");
		String m7 = request.getParameter("basket");
		String m8 = request.getParameter("nickname");
		
		UserDao mDao = new UserDao();
		
		if(mDao.updateUserInfo(m1, m2, m3, m4, m5, m6, m7, m8)) // 매개변수 : id, user_name, user_tel, user_addr, user_pw, user_grade, user_basket, user_nickname
		{
			request.setAttribute("queryResult", true); // 업데이트 성공시 queryResult값을 true로 설정함	
			
			HttpSession session = request.getSession();
			
			// 아래 dispatcher부분이나 sendRedirect 부분은 임의로 수정가능. 팝업으로 표시해도 상관없음.
			return"./adminPopup/updateSuccess";

		}else{
			return"./adminPopup/updateFail"; 
		}
		
		}
}

