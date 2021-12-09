<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%String login="notLogged"; %>
 <style>
span {color : white; background-color: #FF8C0A; font-weight: bold;}
</style>
   <link rel = "stylesheet" href = "/Chicken/resources/css/w3_CSS.css"> 
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">

            <div class="container">
            	<img style="border-radius: 20px" src="/Chicken/images/icon_pro.png" width="40px" height="40px" />
                <a class="navbar-brand js-scroll-trigger" href="/Chicken/main/Main.jsp"><strong>Poly</strong><span>chicken</span></a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>        

 <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
 <div  class="w3-dropdown-hover">
  <li class="w3-button"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">Notice</a>
  <ul class="w3-dropdown-content w3-bar-block w3-card-4">
  
 <a href="/Chicken/list.do?boardName=<%="notice"%>" class="w3-bar-item w3-button">공지사항</a>
  <a href="/Chicken/board/Introduce.jsp" class="w3-bar-item w3-button" >회사소개</a>
  <a href="/Chicken/board/polyMap.jsp" class="w3-bar-item w3-button" >매장소개</a>
 
        </ul>   
  </li>
  </div>
  
  <div class="w3-dropdown-hover">
  <li class="w3-bar-item w3-button"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">Event</a></li>
  <ul class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="/Chicken/list.do?boardName=<%="event"%>" class="w3-bar-item w3-button">진행중인 이벤트</a>
        </ul> </li>
        </div>
  
  
  <div class="w3-dropdown-hover">
  <li class="w3-bar-item w3-button"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">Review</a></li>
  <ul class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="/Chicken/list.do?boardName=<%="review"%>" class="w3-bar-item w3-button">후기</a>
        </ul> </li>
        </div>
  
   <div class="w3-dropdown-hover">
   <li class="w3-button"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">Menu</a>
    <ul class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="/Chicken/menuList.do" class="w3-bar-item w3-button">메뉴 소개</a>
            <a href="/Chicken/order/cart.jsp" class="w3-bar-item w3-button">장바구니</a>
              <%if((String)session.getAttribute("idKey") != null) {%>
            	<a href="/Chicken/order.do" class="w3-bar-item w3-button">주문 현황</a>
            <%} %>
        </ul> </li>
        </div>
        
        
     <div  class="w3-dropdown-hover">
    <li class="w3-button"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">Service</a>
   <ul class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="/Chicken/list.do?boardName=<%="service"%>" class="w3-bar-item w3-button">문의 사항</a>
            <%if((String)session.getAttribute("idKey") != null) {%>
            	<a href="/Chicken/myService.do" class="w3-bar-item w3-button">내 문의 보기</a>
            <%} %>
        </ul></li>
    </div>
  
</ul>
</div>
</div>

<% 
		//로그인 유무 확인
		String mem_id = (String)session.getAttribute("idKey");

		// 로그인이 되어있지 않은 경우 로그인 버튼 출력
        if(mem_id == null){%>
        <a href="/Chicken/login/login.jsp"><img src="/Chicken/images/login.png"/></a>
        
        <!-- 로그인이 된 경우 -->
        <% } else { 
        	// 등급이 관리자이면 사이트관리 버튼 출력
        	if(session.getAttribute("gradeKey").equals("관리자")) {	
        %>
        <a href="/Chicken/admin/admin_main.jsp"><img src="/Chicken/images/adminpage.png" style="width: 30%" align="right"; /></a>
        <%} %>
        <a href="/Chicken/mypage.do?mypage_id=<%=mem_id%>"><img src="/Chicken/images/mypg.png" style="max-height: 250px ;width: 30%" align="right"; /></a>
        <% } %>
        
        </nav>
        
        <%-- 
        if( login.equals("notLogged")){%>
        <a href="/Chicken/login/login.jsp"><img src="/Chicken/images/login.JPG"/></a>
        <% } else { %>
        <a href="/Chicken/login/myPage.jsp"><img src="/Chicken/images/mypg.png" style="width: 30%" align="right"; /></a>
        <% } %> 
        --%>