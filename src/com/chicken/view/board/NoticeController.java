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


public class NoticeController implements Controller{
	int noticeCount;
	int buttonCount;
	int fullsize = 10;
	int checkSize = 10;
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		session.setAttribute("whatboard",request.getParameter("boardName"));
		
		String boardName = (String)session.getAttribute("whatboard");
		BoardDAO noticeDAO = new BoardDAO();
		noticeCount = 	noticeDAO.NoticeCount(boardName);
		
		
			noticeDAO = new BoardDAO(noticeCount-4,noticeCount,boardName); 


		
		ArrayList<noticeTextVo> listOfNotice = new ArrayList<noticeTextVo>(); 
		listOfNotice = noticeDAO.getAllNotice();
		 Collections.reverse(listOfNotice);
		 if(noticeCount%5==0) {
			 buttonCount= noticeCount / 5 + 1;
		 }
		 else {
			 buttonCount=noticeCount / 5 + 2;
		 }
		 if(request.getParameter("myService") != null) {
				if(10>listOfNotice.size()){
					fullsize = noticeCount;
					checkSize = fullsize;}
				session.setAttribute("fullsize", fullsize);
				 session.setAttribute("checkSize", checkSize); 
		 }
		
		session.setAttribute("buttonCount", buttonCount); 
		session.setAttribute("listOfNotice", listOfNotice); 

		if(request.getParameter("myService") != null) return "/board/my" + boardName + "page";
		
		return "/board/" + boardName + "page";
	}
	private int myServiceCount(String attribute) {
		// TODO Auto-generated method stub
		return 0;
	}

}