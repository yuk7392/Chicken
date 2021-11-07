package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;


public class rsDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		
		//로그인 체크
		if(session.getAttribute("idKey") == null) return "/loginpopup/serviceerror";
		
		String id = (String) session.getAttribute("idKey");
		String board = request.getParameter("boardT");
		String num = request.getParameter("boardN");
		
		BoardDAO bDao = new BoardDAO();
		
		if(bDao.deleteBoard(num, board)) return "loginpopup/" + board + "DeleteSuccess";
		return "./loginpopup/reviewWriteError";
	}
}