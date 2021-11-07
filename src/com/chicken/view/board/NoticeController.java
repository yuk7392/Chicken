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
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		session.setAttribute("whatboard",request.getParameter("boardName"));
		
		String boardName = (String)session.getAttribute("whatboard");
		BoardDAO noticeDAO = new BoardDAO();
		noticeCount = 	noticeDAO.NoticeCount(boardName);
		
			// 내 문의를 눌렀을 경우
		if(request.getParameter("myService") != null) {
				//로그인이 되어 있으면 
			if((String)session.getAttribute("idKey") != null) noticeDAO = new BoardDAO(0,5,"service",(String)session.getAttribute("idKey"));
			//로그인이 되어있지 않으면 팝업 띄우기
			else {
				session.setAttribute("popup", "serviceerror");
				return "/loginpopup/serviceerror";
				}
		}
		else {
			noticeDAO = new BoardDAO(noticeCount-4,noticeCount,boardName); 
		}

		
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
					fullsize = listOfNotice.size();}
				session.setAttribute("fullsize", fullsize); 
				 Collections.reverse(listOfNotice);
		 }
		session.setAttribute("buttonCount", buttonCount); 
		session.setAttribute("listOfNotice", listOfNotice); 

		if(request.getParameter("myService") != null) return "/board/my" + boardName + "page";
		
		return "/board/" + boardName + "page";
	}

}