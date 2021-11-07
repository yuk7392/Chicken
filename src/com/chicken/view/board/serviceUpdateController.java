package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;


public class serviceUpdateController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		
		
		//로그인 체크
		if(session.getAttribute("idKey") == null) return "/loginpopup/serviceerror";
		
		BoardDAO bDao = new BoardDAO();
		if(bDao.service_update(request,request.getParameter("writeNo"))) { return "loginpopup/serviceUpdateSuccess";}
		
		return "./loginpopup/error";
	}
}