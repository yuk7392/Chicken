<%@ page import="com.chicken.user.UserDto" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<%@ page import="com.chicken.board.impl.BoardDAO" %>
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
    String type=request.getParameter("type");
    String no,title,writer,date,content;
    
    BoardDAO mDao = new BoardDAO();	
    
    if(type.equals("notice")){
    	
  no =  mDao.getNoticeInfo(id, "no");
  title =  mDao.getNoticeInfo(id, "title");
  writer =  mDao.getNoticeInfo(id, "writer");
  date =  mDao.getNoticeInfo(id, "date");
  content =  mDao.getNoticeInfo(id, "content");
   
    }
    
    else{
    	
    	  no =  mDao.getEventInfo(id, "no");
    	  title =  mDao.getEventInfo(id, "title");
    	  writer =  mDao.getEventInfo(id, "writer");
    	  date =  mDao.getEventInfo(id, "date");
    	  content =  mDao.getEventInfo(id, "content");
    	
    }
	 
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>공지/이벤트 변경</h1>
<form action="/Chicken/updateBoard.do?id=<%=id %>&type=<%=type%>" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">글번호</th>
    <td><%=id%></td>
    </tr>
  <tr>
    <th scope="row">제목</th>
    <td><input type="text" id="title" name="title" value="<%=title%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">작성자</th>
    <td><input type="text" id="writer" name="writer" value="<%=writer%>"/></td>
  </tr>
    
     <tr>
    <th scope="row">날짜</th>
    <td><%=date %></td>
  </tr>
  
    <tr>
    <th scope="row">내용</th>
    <td><input type="text" id="content" name="content" value="<%=content%>"/></td>
  </tr>
  
</table>
	
	<br>
	

  <input type="submit" style="float: center;" value="수정하기">

	</form>
<form action="/Chicken/deleteBoard.do?id=<%=id%>&type=<%=type %>" method="post">
 <input type="submit" style="float: center;" value="삭제하기"><br>
</form>
	 <a href="admin_menu_event.jsp"><input type="button" value="돌아가기"></a>
	
</body>
</html>