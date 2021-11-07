package com.chicken.view.board;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.orderDto;
import com.chicken.board.productDto;
import com.chicken.board.impl.OrderDAO;
import com.chicken.board.impl.ProductDAO;
import com.chicken.user.UserDto;
import com.chicken.user.impl.UserDao;
import com.chicken.view.Controller;

public class addCartController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = "";
		HttpSession session = request.getSession(); 
		 id = request.getParameter("productId"); 
		
		productDto productDto = new productDto();
		ProductDAO ProductDAO = new ProductDAO();
		
		productDto = ProductDAO.getProductInfo(id);
		session.setAttribute("productInfo", productDto); 
		
		String mem_id = request.getParameter("mypage_id");
		
		productDto pDto = (productDto)session.getAttribute("productInfo");
		String quantity = request.getParameter("quantity");


		
		ProductDAO dao = ProductDAO.getInstance();
		ArrayList<productDto> goodsList = dao.getAllProducts();
		
		productDto goods = new productDto();
		for(int i=0; i<goodsList.size(); i++){
			goods = goodsList.get(i);
			if(goods.getId().equals(id)){
				//System.out.println("7"+goods.getId());
				break;
			}
		}
		System.out.println("3"+goodsList);
		ArrayList<productDto> list = (ArrayList<productDto>) session.getAttribute("cartlist");
		if(list==null){
			list=new ArrayList<productDto>();
			session.setAttribute("cartlist",list);
			//System.out.println("4"+list);
		}
		
		int cnt=0;
		productDto goodsQnt = new productDto();
		for(int i=0; i<list.size(); i++){
			goodsQnt = list.get(i);
			if (goodsQnt.getId().equals(id)) {
				cnt=Integer.parseInt(quantity);
				int orderQuantity = goodsQnt.getQuantity() +cnt;
				goodsQnt.setQuantity(orderQuantity);
				//System.out.println("5"+list);
			}
		}
		if(cnt==0){
			goods.setQuantity(Integer.parseInt(quantity));
			list.add(goods);
			//session.setAttribute("cartlist",list);
			//System.out.println("6"+list);
		}
		
		return "/cart";
	}

	
	
	
	
	
	
	
}
