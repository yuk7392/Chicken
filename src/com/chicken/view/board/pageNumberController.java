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

public class pageNumberController implements Controller {
	
	
	int startNum = 0;
	int endNum = 5;
	int totalNoticeCount = 0;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO noticeCountOb = new BoardDAO();

		HttpSession session = request.getSession();
		String boardName = (String)session.getAttribute("whatboard");
		int noticeCount = 	noticeCountOb.NoticeCount(boardName);
		int MaxpageNum = 0;
		if(noticeCount%5==0) { // 최대 페이지 계산
			MaxpageNum = noticeCount/5;
			System.out.println("if"+MaxpageNum);
	}
		else {
			MaxpageNum = (noticeCount/5)+1;
			System.out.println("else if"+MaxpageNum);
		}	
		int current_pageNum  = Integer.parseInt(request.getParameter("pageNum")); // 현재 페이지 가져오기
		
			if(current_pageNum==MaxpageNum) {
			startNum = 1;
			if(noticeCount%5==0) {
				endNum =5;  
			}
			else
			endNum =	noticeCount-(noticeCount/5*5);  
			}
			else { 
			if(current_pageNum ==1) {
				startNum=noticeCount-4;
				endNum=noticeCount;
			}
			else if(current_pageNum==2) {
				startNum=noticeCount-9;
				endNum=noticeCount-5;
			}
			else if(current_pageNum==3) {
				startNum=noticeCount-14;
				endNum=noticeCount-10;
				
			}
			else if(current_pageNum==4) {
				startNum=noticeCount-19;
				endNum=noticeCount-15;
			}
			else if(current_pageNum==5) {
				startNum=noticeCount-24;
				endNum=noticeCount-20;
			}
			else if(current_pageNum==6) {
				startNum=noticeCount-29;
				endNum=noticeCount-25;
			}
	
			
			//공지페이지의 페이지수는 최대 6
			}

     
		BoardDAO noticeDAO = new BoardDAO(startNum,endNum,boardName);

		ArrayList<noticeTextVo> listOfNotice = new ArrayList<noticeTextVo>();
		listOfNotice = noticeDAO.getAllNotice();
		 Collections.reverse(listOfNotice);
		session.setAttribute("listOfNotice", listOfNotice);

		return "/board/" + boardName + "page";
	}

}