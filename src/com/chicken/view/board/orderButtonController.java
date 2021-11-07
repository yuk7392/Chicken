package com.chicken.view.board;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.productDto;
import com.chicken.board.impl.ProductDAO;
import com.chicken.view.Controller;


public class orderButtonController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = "";
		HttpSession session = request.getSession(); 
		 id = request.getParameter("ProductId"); 
		
		productDto productDto = new productDto();
		ProductDAO ProductDAO = new ProductDAO();
		
		//조회수 증가
		ProductDAO.viewAdd(id);
		
		productDto = ProductDAO.getProductInfo(id);
		session.setAttribute("productInfo", productDto); 
		
		
		return "/order/order";
	}

}