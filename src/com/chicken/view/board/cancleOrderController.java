package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.impl.OrderDAO;
import com.chicken.view.Controller;


public class cancleOrderController implements Controller {
	private static final long serialVersionUID = 1L;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String orderStatus = request.getParameter("orderStatus"); 
		String orderNumber = request.getParameter("orderNumber"); 
		OrderDAO oDAO = new OrderDAO();
		HttpSession session = request.getSession(); 
		
		if(orderStatus.equals("준비 중")) {
			oDAO.cancleOrder(orderNumber);
		}
		else {
			session.setAttribute("popup", "serviceerror");
			return "/orderPopup/cancleorderfail";
			}
		
			return "./orderPopup/cancleordersuccess";
	}

}
