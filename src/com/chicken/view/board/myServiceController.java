package com.chicken.view.board;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.orderDto;
import com.chicken.board.impl.BoardDAO;
import com.chicken.board.impl.OrderDAO;
import com.chicken.view.Controller;


public class myServiceController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		BoardDAO noticeDAO = new BoardDAO();
		int fullSize = 10;
		int checkSize = 10;

			//로그인이 되어 있으면 
			if((String)session.getAttribute("idKey") != null)
				{
				noticeDAO = new BoardDAO((String)session.getAttribute("idKey"));
				}
			//로그인이 되어있지 않으면 팝업 띄우기
			else {
				session.setAttribute("popup", "serviceerror");
				return "/loginpopup/serviceerror";
				}
			
		
		ArrayList<noticeTextVo> listOforder = new ArrayList<noticeTextVo>(); 
		listOforder = noticeDAO.getAllNotice();
		 if(10>listOforder.size()){
			 fullSize = listOforder.size();
			 checkSize = fullSize;
			}

		 session.setAttribute("checkSize", checkSize); 
		 session.setAttribute("fullSize", fullSize); 
		session.setAttribute("listOfNotice", listOforder); 
		
		
		return "/board/myservicepage";
	}

}