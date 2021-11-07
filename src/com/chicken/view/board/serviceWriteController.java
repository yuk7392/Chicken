package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chicken.board.noticeTextVo;
import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;


public class serviceWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); 
		
		//로그인 체크
		if(session.getAttribute("idKey") == null) return "/loginpopup/serviceerror";
		
		String id = (String) session.getAttribute("idKey");
		
		
		//DB 실행
		BoardDAO bDao = new BoardDAO();
		if(bDao.service_write(request,id)) return "./loginpopup/serviceWriteSuccess";//".list.do?boardName=\"review\"";
		else return "./loginpopup/serviceWriteError";
	}
}


//System.out.println("테스트 실행됨");
//String fileName = null;
//try {
//	String uploadDir =this.getClass().getResource("").getPath();
//	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"Chicken/WebContent/images_review";
//	//파일 저장 경로
//	String savePath = request.getServletContext().getRealPath("images_review");
//	// 사이즈 제한 10M
//	int sizeLimit = 1024*1024*10;
//	
//	//멀티파트 객체 생성
//	MultipartRequest multi = new MultipartRequest(request,uploadDir,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
//	
//	fileName = multi.getFilesystemName("write_image");
//	
//}catch(Exception e) {
//	System.out.println("Exception " + e);
//}
//
//System.out.println(fileName + "이 저장됨");



////DTO 생성
//BoardDto bDto = new BoardDto();
//
//bDto.setTitle(request.getParameter("write_title"));
//System.out.println(request.getParameter("write_title"));//asd
//bDto.setWriter((String)session.getAttribute("idKey"));
//System.out.println((String)session.getAttribute("idKey"));//asd
//bDto.setContent(request.getParameter("write_content"));
//System.out.println(request.getParameter("write_content"));//asd
//System.out.println("체크 1");//asd
//System.out.println(request.getParameter("write_value"));//asd
//bDto.setValue(Integer.parseInt(request.getParameter("write_value")));
//System.out.println("체크 2");//asd