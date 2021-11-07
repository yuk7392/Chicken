package com.chicken.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.productDto;
import com.chicken.board.impl.ProductDAO;
import com.chicken.view.Controller;

public class removeCartController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub\
		productDto productDto = new productDto();
		ProductDAO ProductDAO = new ProductDAO();
		HttpSession session = request.getSession(); 
		String id = request.getParameter("id");
		
		ArrayList<productDto> cartList = (ArrayList<productDto>) session.getAttribute("cartlist");
		productDto goodsQnt = new productDto();
		for(int i=0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		return "/cart";
	}

}
