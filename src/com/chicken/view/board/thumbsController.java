package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.impl.ProductDAO;
import com.chicken.view.Controller;

public class thumbsController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO pDao = new ProductDAO();
		String productId;
		String thumbs ;
	HttpSession session = request.getSession();
	thumbs = request.getParameter("thumbs"); 
	productId= request.getParameter("productId"); 
	
	
	int a = pDao.thumbsUpdate(productId,thumbs);
	session.setAttribute("likeCount", productId);
	session.setAttribute("likeCount", a); 
	//"./order/order"
	return "/Chicken/orderButton.do?ProductId="+productId;
	
	
	}
}