<%@ page import="com.chicken.user.UserDto" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="../resources/script/script1.js" />
<link rel = "stylesheet" href = "../resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/myPage.css">

<style>
h1 { text-align: left; }

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}


</style>
</head>

</head>
<body>
<%
	//request에서 UserDto 받기
	UserDto uDto = (UserDto)session.getAttribute("mypageview");
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>개인정보 변경</h1>
<form action="/Chicken/userupdate.do" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">ID</th>
    <td><%=uDto.getId()%></td>
    </tr>
  <tr>
    <th scope="row">PW</th>
    <td><input type="text" id="password" name="password" value="<%=uDto.getPw()%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">이름</th>
    <td><input type="text" id="name" name="name" value="<%=uDto.getName()%>"/></td>
  </tr>
    
     <tr>
    <th scope="row">닉네임</th>
    <td><input type="text" id="nickname" name="nickname" value="<%=uDto.getNickname()%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">전화번호</th>
    <td><input type="text" id="phone" name="phone" value="<%=uDto.getPhone()%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">이메일</th>
    <td><input type="text" id="email" name="email" value="Polychicken@gmail.com(테이블에없음)"/></td>
  </tr>
  
   <tr>
   <th scope="row">주소</th>
    <td><textarea id="addr" name="addr" rows="5" cols="25"><%=uDto.getAddr()%></textarea> <br></td>
  </tr>
    
</table>
	
	<br>
	
	<h1>수신설정</h1>
	
	<table class="type02">
  <tr>
    <th scope="row">SNS 및 Email 수신 동의 </th>
    <td><input type="checkbox" name="letter" checked>polychicken의 다양한 혜택을 만나보세요</td>
  </tr>
  </table>
  <a href="/Chicken/logout.do"><input type="button" id="btn_logout" value="로그아웃"></a>
  <a href="/Chicken/userManager_delete.do?id=<%=(String)session.getAttribute("idKey")%>&self=<%="self"%>"><input type="button" id="btn_expire" value="회원탈퇴"></a>
  <br>
  <br>
  <br>
  
  <input type="submit" style="float: center;" value="수정하기">
  <a href="../main/Main.jsp"><input type="button" value="돌아가기"></a>
	</form>
	
<div class = "jumbotron" style="background-color:#FFC81E">
	<%@ include file="/attachments/bottom.jsp" %>
	</div>
	
	<hr>
	<br>
	<br> 
	
	<div class = "jumbotron" style="background-color: black" >
	<%@ include file="/attachments/footer.jsp" %>
	</div>
	
	
</body>
</html>