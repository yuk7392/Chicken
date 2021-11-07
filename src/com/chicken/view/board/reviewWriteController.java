package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;


public class reviewWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		
		
		//로그인 체크
		if(session.getAttribute("idKey") == null) return "/loginpopup/serviceerror";
		
		String id = (String) session.getAttribute("idKey");
		
		
		//DB 실행
		BoardDAO bDao = new BoardDAO();
		if(bDao.review_write(request,id)) return "./loginpopup/reviewWriteSuccess";//".list.do?boardName=\"review\"";
		else return "./loginpopup/reviewWriteError";
		
	}
}