<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.view.user.getUserInfoController"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>
<%@ page import="com.chicken.user.impl.UserDao" %>
<%@ page import="com.chicken.user.Admin_userDto" %>
<%@ page import="com.chicken.board.impl.BoardDAO" %>
<%@ page import="com.chicken.board.eventDto" %>
<%@ page import="com.chicken.board.noticeDto" %>
<%@ page import="com.chicken.board.impl.ServiceDAO" %>
<%@ page import="com.chicken.board.serviceDto" %>

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
<title>문의 관리</title>

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
ServiceDAO u = new ServiceDAO();

ArrayList<serviceDto> b = u.getServiceList();

%>
	<table width="75%" align="center"">
	<tr> 
	<td align="center" >
        <h2>문의 목록</h2>
		<table width="95%" align="center"border="1">
		<td align="center"><strong>번호</strong></td>
	    <td align="center"><strong>제목</strong></td>
		<td align="center"><strong>작성자</strong></td>
		<td align="center"><strong>날짜</strong></td>
		<td align="center"><strong>내용</strong></td> 
		<td align="center"><strong>상태</strong></td>
		<td align="center"><strong>파일명</strong></td>

		</tr>
		<%
		for(int i=0; i<b.size(); i++){
		serviceDto d = b.get(i);
		%>
		<tr> 
		<td align="center"><%=d.getNo()%></a></td>
		<td align="center"><%=d.getTitle()%></td>
		<td align="center"><%=d.getWriter()%></td>
		<td align="center"><%=d.getDate()%></td>
		<td align="center"><%=d.getContent()%></td>
		<td align="center"><%=d.getStatus()%></td>
		<td align="center"><%=d.getFile()%></td>
		<td align="center"><a href="/Chicken/admin/admin_services_mod.jsp?id=<%=d.getNo()%>&type=event"><strong>수정하기</strong></a></td>
		</tr>

		<%}%>
	
		
		</table>
	</td>
	</tr>
	</table>


			
</body>
</html>