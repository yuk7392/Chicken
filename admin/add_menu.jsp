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
<title>추가</title>

<style>
h1 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br><br><br>

<div class="container">
		<form name="newproduct" action="/Chicken/addProduct.do" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-5">
					<input type="text" id="id" name="id" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-4">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-10">
					<textarea id="desc" name="desc" cols="50" rows="3" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고</label>
				<div class="col-sm-3">
					<input type="text" id="stock" name="stock" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이미지주소</label>
				<div class="col-sm-8">
					<input type="text" id="imgsrc" name="imgsrc" cols="150" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
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