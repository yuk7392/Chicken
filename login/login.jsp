<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="../resources/script/script1.js" />
<link rel = "stylesheet" href = "../resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/login.css">

<style>
h1 { text-align: center; }

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}


</style>
</head>

</head>
<body>
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	
	
<form action="/Chicken/login.do" method="get"> 
<div class="input-box"> 
<input id="username" type="text" name="username" placeholder="아이디"> 
<label for="username">아이디</label> 
</div> 
<div class="input-box"> 
<input id="password" type="password" name="password" placeholder="비밀번호"> 
<label for="password">비밀번호</label> 
</div> 
<div id="forgot">비밀번호 찾기</div> 
<div id="register">
<a href="../login/register.jsp" role="button"> 회원가입</a></div> 
<input type="submit" value="로그인"> 
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