<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.view.user.getUserInfoController"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>
<%@ page import="com.chicken.user.impl.UserDao" %>
<%@ page import="com.chicken.user.Admin_userDto" %>

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
<title>사용자 관리</title>

<style>
h3 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}


      table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
      }
      th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }

</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br><br><br><br><br>

<%
UserDao u = new UserDao();

ArrayList<Admin_userDto> a = u.getUserList();

%>


<table width="75%" align="center"">
	<tr> 
	<td align="center" >
    <h2>유저 목록</h2>
		<table width="95%" align="center"border="1">
		<td align="center"><strong>사용자번호</strong></td>
		<td align="center"><strong>이름</strong></td>
		<td align="center"><strong>전화번호</strong></td>
		<td align="center"><strong>주소</strong></td> 
		<td align="center"><strong>아이디</strong></td>
		<td align="center"><strong>비밀번호</strong></td>
		<td align="center"><strong>회원등급</strong></td>
		<td align="center"><strong>장바구니</strong></td>
		<td align="center"><strong>닉네임</strong></td>
		</tr>
		<%
		for(int i=0; i<a.size(); i++){
		Admin_userDto d = a.get(i);
		%>
		<tr> 
		<td align="center"><%=d.getNo()%></a></td>
		<td align="center"><%=d.getName()%></td>
		<td align="center"><%=d.getTel()%></td>
		<td align="center"><%=d.getAddr()%></td>
		<td align="center"><%=d.getId()%></td>
		<td align="center"><%=d.getPw()%></td>
		<td align="center"><%=d.getGrade()%></td>
		<td align="center"><%=d.getBasket()%></td>
		<td align="center"><%=d.getNickname()%></td>
		<td align="center"><a href="/Chicken/admin/admin_modUser.jsp?id=<%=d.getId()%>"><strong>수정하기</strong></a></td>
		</tr>
		

		
		<%}%>
		

		
		</table>
	</td>
	</tr>
	</table>


			
</body>
</html>