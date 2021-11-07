package com.chicken.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.productDto;
import com.chicken.board.impl.ProductDAO;
import com.chicken.view.Controller;


public class menuListController implements Controller {
	ProductDAO ProductDAO = new ProductDAO();
	ProductDAO PopularProductDAO = new ProductDAO("popular");
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		ArrayList<productDto> listOfProduct = new ArrayList<productDto>(); 
		listOfProduct = ProductDAO.getAllProducts();
		session.setAttribute("listOfProduct", listOfProduct); 
		
		//인기 메뉴 읽기 추가
		ArrayList<productDto> listOfPopular = new ArrayList<productDto>(); 
		listOfPopular = PopularProductDAO.getPopularProducts();
		session.setAttribute("listOfPopularProduct", listOfPopular);
		
		return "menu/menu";
	}
	
}