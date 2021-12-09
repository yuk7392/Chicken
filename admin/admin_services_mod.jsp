<%@ page import="com.chicken.user.UserDto" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<%@ page import="com.chicken.board.impl.BoardDAO" %>
<%@ page import="com.chicken.board.impl.ServiceDAO" %>
<%@ page import="com.chicken.board.serviceDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리하기</title>

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

	String id=request.getParameter("id");
   
    
    ServiceDAO mDao = new ServiceDAO();	
    
  String no,title,writer,date,content,status,file;
 
  no = mDao.getServiceInfo(id, "no");
  title = mDao.getServiceInfo(id, "title");
  writer = mDao.getServiceInfo(id, "writer");
  date = mDao.getServiceInfo(id, "date");
  content = mDao.getServiceInfo(id, "content");
  status = mDao.getServiceInfo(id, "status");
  file = mDao.getServiceInfo(id, "file");

	 
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>주문 변경</h1>
<form action="/Chicken/updateService.do?id=<%=id %>" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">번호</th>
    <td><%=id %></td>
    </tr>
  <tr>
    <th scope="row">제목</th>
    <td><%=title %></td>
  </tr>
  
    <tr>
    <th scope="row">작성자</th>
    <td><%=writer %></td>
  </tr>
  
  <tr>
    <th scope="row">날짜</th>
    <td><%=date%></td>
  </tr>
    
     <tr>
    <th scope="row">내용</th>
    <td><%=content %></td>
  </tr>
  
    <tr>
    <th scope="row">상태</th>
    <td><select name="status">
    <option value="처리 중">처리 중</option>
    <option value="처리 완료">처리 완료</option>
    <option value="기각 됨">기각 됨</option>
    </select></td>
  </tr>
  
   <tr>
    <th scope="row">파일명</th>
    <td><%=file%></td>
  </tr>
  
</table>
	
	<br>
	

  <input type="submit" style="float: center;" value="수정하기">

	</form>
<form action="/Chicken/deleteService.do?id=<%=id%>" method="post">
 <input type="submit" style="float: center;" value="삭제하기"><br>
</form>
	 <a href="admin_services.jsp"><input type="button" value="돌아가기"></a>
	
</body>
</html>