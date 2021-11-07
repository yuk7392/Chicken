package com.chicken.view.board;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.orderDto;
import com.chicken.board.impl.OrderDAO;
import com.chicken.view.Controller;


public class OrderController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		OrderDAO OrderDAO = new OrderDAO();
		int fullSize = 10;
	
		
			//로그인이 되어 있으면 
			if((String)session.getAttribute("idKey") != null)
				{
				OrderDAO = new OrderDAO((String)session.getAttribute("idKey"));
				}
			//로그인이 되어있지 않으면 팝업 띄우기
			else {
				session.setAttribute("popup", "serviceerror");
				return "/loginpopup/serviceerror";
				}
			
		
		ArrayList<orderDto> listOforder = new ArrayList<orderDto>(); 
		listOforder = OrderDAO.getAllOrder();
		 if(10>listOforder.size()){
			 fullSize = listOforder.size();
			}

		 session.setAttribute("fullSize", fullSize); 
		session.setAttribute("listOforder", listOforder); 
		
		
		return "/board/ordertblpage";
	}

}