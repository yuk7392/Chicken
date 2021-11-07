package com.chicken.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;

public class addProductController implements Controller{
	int noticeCount;
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

	BoardDAO bd = new BoardDAO();
	
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String price=request.getParameter("price");
	String desc=request.getParameter("desc");
	String category=request.getParameter("category");
	String stock=request.getParameter("stock");
	String imgsrc=request.getParameter("imgsrc");
	
	
    if(bd.addProduct(id, name, price, desc, category, stock, imgsrc))
	
	return "./adminPopup/addSuccess_product";
	
	return "./adminPopup/addFail_product";
	
	}
}