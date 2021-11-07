<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글쓰기</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="/Chicken/resources/script/script1.js" />
<link rel = "stylesheet" href = "/Chicken/resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/Chicken/resources/css/introduce.css">

<style>

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}

</style>
</head>

</head>
<body>
<!-- --------- 상단바 불러오기 ----------- -->
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	<div id = "page_title">
	<h1>
		<span>Review Write</span>
	</h1>
	<span style="width:850px; height:3px; background-color:gray;"></span>
	</div>
	<br>
	
	
	<div class="container" style="max-width:830px">
		<form action="/Chicken/reviewWrite.do" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-4">리뷰 제목</label>
				<div class="col-sm-12">
					<input type="text" cols="150" name="write_title" id="write_title" class="form-control" placeholder="제목을 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-4">리뷰</label>
				<div class="col-sm-12">
					<textarea id="write_content" name="write_content" cols="150" rows="10" class="form-control"></textarea>
				</div>
			</div>
			<div>
				<label class="col-sm-1.5">평점</label>
					<select id="write_value" name="write_value" style="height:23px;">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5" selected="selected">5점</option>
					</select>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-1.5" style="margin-left:15px; line-height: 42px;">이미지</label>
				<div class="col-sm-11" style="margin-left:9px">
					<input type="file" id="write_image" name="write_image" class="form-control" accept="image/png, image/jpeg">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-12">
					<input type="submit" class="btn btn-primary" Value="등록">
				</div>
			</div>
		</form>
	</div>
	
	
<!-- --------- 하단 부분 불러오기 ----------- -->
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