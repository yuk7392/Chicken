package com.chicken.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chicken.board.impl.BoardDAO;
import com.chicken.view.Controller;


public class deleteBoardController implements Controller {
	private static final long serialVersionUID = 1L;
	
	// 테스트 전용
	// 사용된 유저 정보는 
	// insert into user(user_name,user_tel,user_addr,user_id,user_pw,user_grade,user_basket,user_nickname) values("테스트","010-1111-1111","주소","test","test","관리자","없음","테스트");
	
	
/*
 * 
 *  삭제 테스트
	public deleteUserController() {
		
		UserDao mDao = new UserDao();	
		if(mDao.deleteUserInfo("test"))
	    System.out.println("삭제 성공");
		else
		System.out.println("삭제 실패");
		
	}
	
	*/
		
	/*
	 * 
	 * 정보 가져오기 테스트

	
	public deleteUserController() {
		
		UserDao mDao = new UserDao();	
		System.out.println("아이디 test의 정보");
		System.out.println("------------------------");
		System.out.println("번호 : "+mDao.getUserInfo("test","no"));
		System.out.println("이름 : "+mDao.getUserInfo("test","name"));
		System.out.println("전화번호 : "+mDao.getUserInfo("test","tel"));
		System.out.println("주소 : "+mDao.getUserInfo("test","addr"));
		System.out.println("비밀번호 : "+mDao.getUserInfo("test","pw"));
		System.out.println("등급 : "+mDao.getUserInfo("test","grade"));
		System.out.println("장바구니 : "+mDao.getUserInfo("test","basket"));
		System.out.println("닉네임 : "+mDao.getUserInfo("test","nickname"));
		System.out.println("잘못 입력시 id 리턴 : "+mDao.getUserInfo("test","테스트"));
		
	}
	 

	
	*/
	
	/*
	 * 
	 * 응용(정보받기,수정,삭제)
	
	public deleteUserController() {
		
		
		UserDao mDao = new UserDao();	
		System.out.println("아이디 test의 전 정보");
		System.out.println("------------------------");
		System.out.println("번호 : "+mDao.getUserInfo("test","no"));
		System.out.println("이름 : "+mDao.getUserInfo("test","name"));
		System.out.println("전화번호 : "+mDao.getUserInfo("test","tel"));
		System.out.println("주소 : "+mDao.getUserInfo("test","addr"));
		System.out.println("비밀번호 : "+mDao.getUserInfo("test","pw"));
		System.out.println("등급 : "+mDao.getUserInfo("test","grade"));
		System.out.println("장바구니 : "+mDao.getUserInfo("test","basket"));
		System.out.println("닉네임 : "+mDao.getUserInfo("test","nickname"));
		System.out.println("잘못 입력시 id 리턴 : "+mDao.getUserInfo("test","테스트"));
		System.out.println("------------------------");
		if(mDao.updateUserInfo("test", "바뀐이름", "바뀐 전화번호", "바뀐 주소", "바뀐 비밀번호", "바뀐 등급", "바뀐 장바구니", "바뀐 닉네임"))
		System.out.println("변경완료");
		else
		System.out.println("변경실패");
		System.out.println("------------------------");
		System.out.println("아이디 test의 현 정보");
		System.out.println("------------------------");
		System.out.println("번호 : "+mDao.getUserInfo("test","no"));
		System.out.println("이름 : "+mDao.getUserInfo("test","name"));
		System.out.println("전화번호 : "+mDao.getUserInfo("test","tel"));
		System.out.println("주소 : "+mDao.getUserInfo("test","addr"));
		System.out.println("비밀번호 : "+mDao.getUserInfo("test","pw"));
		System.out.println("등급 : "+mDao.getUserInfo("test","grade"));
		System.out.println("장바구니 : "+mDao.getUserInfo("test","basket"));
		System.out.println("닉네임 : "+mDao.getUserInfo("test","nickname"));
		System.out.println("잘못 입력시 id 리턴 : "+mDao.getUserInfo("test","테스트"));
		System.out.println("------------------------");
		if(mDao.deleteUserInfo("test"))
		System.out.println("정보 삭제 성공");
		else
		System.out.println("정보 삭제 실패");
		
	}
	
	*/

	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	
		String m1 = request.getParameter("id"); 
		String m2 = request.getParameter("type");
		
		BoardDAO mDao = new BoardDAO();	
		
		if(mDao.deleteBoard(m1,m2)) 
		
			return "./adminPopup/deleteSuccess_board";
		return "./adminPopup/deleteFail_board";
	}

}
