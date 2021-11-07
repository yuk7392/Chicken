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
<%@ page import="com.chicken.board.impl.OrderDAO" %>
<%@ page import="com.chicken.board.orderDto" %>

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
<title>준비 관리</title>

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
OrderDAO u = new OrderDAO();

ArrayList<orderDto> b = u.getOrderList();

%>
	<table width="75%" align="center"">
	<tr> 
	<td align="center" >
        <h2>주문 목록</h2>
		<table width="95%" align="center"border="1">
		<td align="center"><strong>번호</strong></td>
	    <td align="center"><strong>주문번호</strong></td>
		<td align="center"><strong>주문자</strong></td>
		<td align="center"><strong>주문내용</strong></td>
		<td align="center"><strong>날짜</strong></td> 
		<td align="center"><strong>배달상태</strong></td>
		<td align="center"><strong>주소</strong></td>
		<td align="center"><strong>수량</strong></td>
		<td align="center"><strong>가격</strong></td>
		</tr>
		<%
		for(int i=0; i<b.size(); i++){
		orderDto d = b.get(i);
		%>
		<tr> 
		<td align="center"><%=d.getOrdertbl_no()%></a></td>
		<td align="center"><%=d.getOrderNumber()%></td>
		<td align="center"><%=d.getOrderer()%></td>
		<td align="center"><%=d.getProducts()%></td>
		<td align="center"><%=d.getDate()%></td>
		<td align="center"><%=d.getStatus()%></td>
		<td align="center"><%=d.getAddr()%></td>
		<td align="center"><%=d.getAmount()%></td>
		<td align="center"><%=d.getPrice()%></td>
		<td align="center"><a href="/Chicken/admin/admin_order_mod.jsp?id=<%=d.getOrdertbl_no()%>&type=event"><strong>수정하기</strong></a></td>
		</tr>

		<%}%>
	
		
		</table>
	</td>
	</tr>
	</table>


			
</body>
</html>