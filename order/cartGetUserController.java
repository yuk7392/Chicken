package com.chicken.view.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.orderDto;
import com.chicken.board.impl.OrderDAO;
import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;

//mypageview와 같음
public class cartGetUserController implements Controller {


	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//head에서 넘어온 mypage_id를 mem_id에 저장
		String mem_id = request.getParameter("mypage_id");
		ArrayList<orderDto> listOforder = new ArrayList<orderDto>(); 
		
		//DAO 선언
		UserDao mDao = new UserDao();
		//DTO 선언
		UserDto uDto = new UserDto();
		//DTO에 DAO의 Userinfo 함수를 이용해 DB 내용 넣기
		OrderDAO oDao = new OrderDAO();
		orderDto dto2 = new orderDto();
		uDto = mDao.Userinfo(mem_id);
		
		int num = oDao.getOnum();
		
		//requset에 UserDto 객체 저장 
		HttpSession session = request.getSession();


		oDao = new OrderDAO((String)session.getAttribute("idKey"));
		listOforder = oDao.getAllOrder();
		 Collections.reverse(listOforder);
		session.setAttribute("listOforder", listOforder); 
		
		session.setAttribute("mypageview", uDto);
				
		session.setAttribute("CartNum", num); 
		return "order/payment";
	}
	
}