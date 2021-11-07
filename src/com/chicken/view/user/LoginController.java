package com.chicken.view.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;


public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("username");
		String pw = request.getParameter("password");

		UserDao mDao = new UserDao();		
		boolean loginCheck = mDao.loginCheck(id, pw);
	    if(loginCheck){
	    	request.setAttribute("loginResult", loginCheck);
			HttpSession session = request.getSession();
			session.setAttribute("idKey", id);
			session.setAttribute("gradeKey", mDao.CheckGrade(id));
			
			return "./loginpopup/loginsuccess";

		}else{
			return "./loginpopup/loginerror";
		} 
		
	}
}