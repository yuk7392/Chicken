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
	String id=request.getParameter("id");

    UserDao mDao = new UserDao();	
    
    String pw = mDao.getUserInfo(id, "pw");
    String name = mDao.getUserInfo(id, "name");
    String nickname = mDao.getUserInfo(id, "nickname");
    String tel = mDao.getUserInfo(id, "tel");
    String grade = mDao.getUserInfo(id, "grade");
    String addr = mDao.getUserInfo(id, "addr");
	 
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>유저정보 변경</h1>
<form action="/Chicken/userManager_getInfo.do?id=<%=id %>" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">ID</th>
    <td><%=id%></td>
    </tr>
  <tr>
    <th scope="row">PW</th>
    <td><input type="text" id="password" name="password" value="<%=pw%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">이름</th>
    <td><input type="text" id="name" name="name" value="<%=name%>"/></td>
  </tr>
    
     <tr>
    <th scope="row">닉네임</th>
    <td><input type="text" id="nickname" name="nickname" value="<%=nickname%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">전화번호</th>
    <td><input type="text" id="tel" name="tel" value="<%=tel%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">등급</th>
    <td><select name="grade">
    <option value="일반">일반</option>
     <option value="관리자">관리자</option>
    </select></td>
  </tr>
  
   <tr>
   <th scope="row">주소</th>
    <td><textarea id="addr" name="addr" rows="5" cols="25"><%=addr%></textarea> <br></td>
  </tr>
    
</table>
	
	<br>
	

  <input type="submit" style="float: center;" value="수정하기">

	</form>
<form action="/Chicken/userManager_delete.do?id=<%=id%>" method="post">
 <input type="submit" style="float: center;" value="삭제하기"><br>
</form>
	 <a href="admin_users.jsp"><input type="button" value="돌아가기"></a>
	
</body>
</html>