<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="/Chicken/resources/script/script1.js" />
<link rel = "stylesheet" href = "/Chicken/resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<meta charset="UTF-8">
<title>Welcome</title>

<style>
h1 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
			<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>


<!-- 치킨 -->
<div class="w3-container w3-center w3-animate-zoom">

<div class="jumbotron" style="background-color: white">
		
		<div class="container">
			<h1 class="display-3"><strong>Poly</strong><span>chicken</span></h1>
			<hr>
		</div>
	</div>
	
<div class="w3-content w3-display-container">

</div>



	<div class="container" align="center">
	
		<div class="section" align="center">
			<ul>
			 <h2>관리자 메뉴입니다.</h2>
			  <h2>원하시는 작업을 선택하세요.</h2>
			</ul>
			
		</div>
		
		</div>


</body>
</html>