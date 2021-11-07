<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <li class="w3-button"><a href="/Chicken/admin/add_notice.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">공지 / 이벤트 등록</a>
  
  </li>
  </div>
  
   <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_menu.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">공지 관리</a></li>
  </div>
  
     <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_menu_event.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">이벤트 관리</a></li>
  </div>
  
  <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_users.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">유저 관리</a></li>
  </div>
  
  <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_products.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">메뉴 관리</a></li>
  </div>
  
    <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_order.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">주문 관리</a></li>
  </div>
  
      <div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
  <li class="w3-button"><a href="/Chicken/admin/admin_services.jsp" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">문의 관리</a></li>
  </div>
  
  </div>
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
        <a href=""><img src="/Chicken/images/adminpage.png" style="width: 30%" align="right"; /></a>
        <%} %>
        <a href="/Chicken/mypage.do?mypage_id=<%=mem_id%>"><img src="/Chicken/images/mypg.png" style="width: 30%" align="right"; /></a>
        <% } %>
        
        </nav>