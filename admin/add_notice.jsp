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
<link rel="stylesheet"	href="../resources/script/script1.js" />
<link rel = "stylesheet" href = "../resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<meta charset="UTF-8">
<title>공지 등록</title>

<style>
h3 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br><br><br>
	

	
<div class="w3-content w3-display-container">

</div>

<div class="container">
		<form action="/Chicken/addBoard.do" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-4">제목</label>
				<div class="col-sm-10">
					<input type="text" cols="150" id="title" name="title" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-4">상세 정보</label>
				<div class="col-sm-10">
					<textarea id="content" name="content" cols="150" rows="10" class="form-control"></textarea>
				</div>
				</div>
			
			<div class="form-group row">
				<label class="col-sm-1.5">형식</label>
				<div class="col-sm-5">
					<input type="radio" id = "rdo" name="rdo" value="공지" checked>공지     
					<input type="radio" id = "rdo" name="rdo" value="이벤트">이벤트
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-1.5">이미지 이름</label>
				<div class="col-sm-8">
					<input type="text" cols="150" name="imgsrc" class="form-control" disabled="disabled">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-12">
					<input type="submit" class="btn btn-primary" Value="등록">
				</div>
			</div>
		</form>
	</div>




	<div class="container">
	
		<div class="row" align="center">
			
			
			
		</div>
		
		<br><br><br>
	<div class = "container">
		<div class = "text-center">
		</div>
	</div>
</div>
	
	
	


</body>
</html>