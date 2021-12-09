package com.chicken.view.board;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.orderDto;
import com.chicken.board.impl.OrderDAO;
import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;

public class addOrderController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		UserDao mDao = new UserDao();
		UserDto uDto = new UserDto();
		OrderDAO oDao = new OrderDAO();
		ArrayList<orderDto> oDto = new ArrayList<orderDto>();
		
		
			HttpSession session = request.getSession();
			String orderer = String.valueOf(session.getAttribute("orderer"));
			String orderDate = String.valueOf(session.getAttribute("orderDate"));
			String orderStatus = String.valueOf(session.getAttribute("orderStatus"));
			String orderAddr = String.valueOf(session.getAttribute("orderAddr"));
			int orderNum = (int) session.getAttribute("orderNum");
			int list = (int) session.getAttribute("list");
			
			ArrayList<String> Opdt = (ArrayList)session.getAttribute("orderProducts");
			ArrayList<Integer> Oamt = (ArrayList) session.getAttribute("orderAmounts");
			ArrayList<Integer> Oprc = (ArrayList) session.getAttribute("orderPrice");
			
			
			
			for(int i=0; i<list;i++) {
				String orderProducts = Opdt.get(i);
				int orderAmounts = Oamt.get(i);
				int orderPrice = Oprc.get(i);
				
			/*System.out.println(orderer);
			System.out.println(orderDate);
			System.out.println(orderStatus);
			System.out.println(orderAddr);
			System.out.println(orderProducts);
			System.out.println(orderNum);
			System.out.println(orderAmounts);
			System.out.println(orderPrice);*/
			mDao.setOrder(orderer, orderProducts, orderDate, orderStatus, orderAddr, orderNum, orderAmounts, orderPrice);
			}
			session.removeAttribute("cartlist");
			String num = Integer.toString(orderNum);
			oDto = oDao.read_order(num);
			session.setAttribute("readDto", oDto);
			return "orderConfirmation";
    }
}
