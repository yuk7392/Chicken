<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.board.boardDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>

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

#read_title{
	font-size:30px;
	font-weight:bold;
}
</style>
</head>

</head>
<body>

<%
boardDto rDto = (boardDto)session.getAttribute("readDto");

int valueNum = Integer.parseInt(rDto.getValue());
String value = "";
for(int i = 0; i<valueNum; i++)	value += "★";
for(int i = valueNum; i<5; i++) value += "☆";
%>
<!-- --------- 상단바 불러오기 ----------- -->
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	<div id = "page_title">
	<h1>
		<span>Review</span>
	</h1>
	<span style="width:850px; height:3px; background-color:gray;"></span>
	</div>
	
	
	<div class="container" style="max-width:830px; margin-top:10px;">
		
			<div class="form-group row" style="margin-bottom:0">
				<label id="read_title" class="col-sm-9"><%=rDto.getTitle() %></label>
				<label class="col-sm-1" style="white-space:pre; color:#495057">글쓴이: <%=rDto.getWriter() %><br>별점: <%=value %></label>
			</div>
			
	<hr style="margin-top:5px; margin-bottom:15px; width:820px">
				
			<%if(!rDto.getFileurl().equals("")) {%>
				<img style="max-width:810px;" src="/Chicken/images_review/<%=rDto.getFileurl()%>"><p/>
			<%}%>
			
			<div class="col-sm-12" style="white-space:pre-line; width:830px; margin-bottom:30px;"><%=rDto.getContent() %></div>
	<hr>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-12">
					<div style="margin:0 auto; width:270px;">
						<a href="/Chicken/list.do?boardName=<%="review"%>"><input type="button" class="btn btn-primary" Value="목록으로"></a>
						<%
						String mem = (String)session.getAttribute("idKey");
						if(mem != null)
							  if(mem.equals(rDto.getWriter()))
							  {	%>
							<a href="/Chicken/board/updatepage/reviewUpdate.jsp"><input type="button" class="btn btn-primary" value="수정하기"></a>
							
							<%} %>
					</div>
				</div>
			</div>
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