package com.chicken.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;

public class addBoardController implements Controller{
	int noticeCount;
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

	BoardDAO bd = new BoardDAO();
	
	boolean res = false;
		
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String type = request.getParameter("rdo");

	switch(type) {
	
	case "공지":
	if(bd.addNotice(title, content))
	res = true;
	else	
	res = false;	
	break;

	case "이벤트":
		
	if(bd.addEvent(title, content))
	res = true;	
	else			
	res = false;
	break;
	
	}
	
	if(res)
	return "./adminPopup/addSuccess";
	
	return "./adminPopup/addFail";
	
	}
}