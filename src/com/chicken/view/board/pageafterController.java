package com.chicken.view.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.pageNumVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;

public class pageafterController implements Controller {
	
	int startNum = 0;
	int endNum = 5;
	int totalNoticeCount = 0;
	
	
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO noticeCountOb = new BoardDAO();
		
		HttpSession session = request.getSession();
		int current_newNum  = Integer.parseInt(request.getParameter("newNum")); 
		int current_oldNum =Integer.parseInt( request.getParameter("oldNum")); 
		
		String boardName = (String)session.getAttribute("whatboard");
		
		int noticeCount = 	noticeCountOb.NoticeCount(boardName);
	
		if(current_oldNum<5) { 
				startNum = 1;
				if(noticeCount%5==0) {
					endNum =5;  
				}
				else
				endNum =	noticeCount-(noticeCount/5*5);  
				}
		else {
			startNum=current_oldNum-5;
			endNum=current_newNum-5; 
		}
	
		BoardDAO noticeDAO = new BoardDAO(startNum,endNum,boardName);

		ArrayList<noticeTextVo> listOfNotice = new ArrayList<noticeTextVo>();
		listOfNotice = noticeDAO.getAllNotice();
		 Collections.reverse(listOfNotice);
		session.setAttribute("listOfNotice", listOfNotice);

		return "/board/" + boardName + "page";
	}

}