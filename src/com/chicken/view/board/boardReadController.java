package com.chicken.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.boardDto;
import com.chicken.board.orderDto;
import com.chicken.board.impl.BoardDAO;
import com.chicken.board.impl.OrderDAO;
import com.chicken.view.Controller;


public class boardReadController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		BoardDAO bDao = new BoardDAO();
		boardDto bDto = new boardDto();
		OrderDAO oDao = new OrderDAO();
		ArrayList<orderDto> oDto = new ArrayList<orderDto>();
		
		//리뷰 게시글 클릭시
		if(request.getParameter("board").equals("review")) {
			bDto = bDao.read_review(request.getParameter("board_no"));
			session.setAttribute("readDto", bDto);
			return "./board/viewpage/reviewView";
		}//문의사항 게시글 클릭시
		else if(request.getParameter("board").equals("service")){
			bDto = bDao.read_service(request.getParameter("board_no"));
			session.setAttribute("readDto", bDto);
			return "./board/viewpage/serviceView";
		}//이벤트 게시글 클릭시
		else if(request.getParameter("board").equals("event")){
			bDto = bDao.read_event(request.getParameter("board_no"));
			session.setAttribute("readDto", bDto);
			return "./board/viewpage/eventView";
		}//공지사항 게시글 클릭시
		else if(request.getParameter("board").equals("notice")){
			bDto = bDao.read_notice(request.getParameter("board_no"));
			session.setAttribute("readDto", bDto);
			return "./board/viewpage/noticeView";
		}//주문목록에서 주문 클릭시
		else if(request.getParameter("board").equals("ordertbl")){
			oDto = oDao.read_order(request.getParameter("board_no"));
			session.setAttribute("readDto", oDto);
			return "./order/orderConfirmation";
		}
		
		return "./board/viewpage/reviewView";
	}
}