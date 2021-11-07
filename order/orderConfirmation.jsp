<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.orderDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet" href="../resources/script/script1.js" />
<link rel="stylesheet" href="../resources/css/NewFile.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/noticepage.css">


<style>
h1 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}
</style>
</head>

<body>
<%
ArrayList<orderDto> oList = (ArrayList<orderDto>)session.getAttribute("readDto");
orderDto oDto = oList.get(0);

%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	
	<div id="page_title">
		<h1>
			<span>Order</span>
		</h1>
		<div style="margin: 0 auto; width: 100%; height: 10px;">
		</div>
		<span style="width: 850px; height: 3px; background-color: gray;"></span>
	</div>
	<br>

<div class = "container col-8 alert alert-info">
	<div class = "text-center">
		<h1>영수증</h1>
	</div>
	<div class = "row justify-content-between">
	<div class = "col-4" align = "left">

				
		<strong>배달 주소 : <%=oDto.getAddr() %></strong>
		<br>
		주문자ID : <%=oDto.getOrderer() %>
		<br>
		주문 상태 : <%=oDto.getStatus() %>
		<br>
		주문 번호 : <%=oDto.getOrderNumber() %>
		<br>
		</div>
		<div class = "col-4" align = "right">
		 	<p> <em>주문일 : <%=oDto.getDate() %></em>
		</div>
	</div>
	<div>
		<table class = "table table-hover">
		<tr>
			<th class = "text-center">제품 명</th>
			<th class = "text-center">가격</th>
			<th class = "text-center">수량</th>
			<th class = "text-center">합계</th>
		</tr>
		 <%
			int sum = 0;

			for(int i=0; i<oList.size(); i++){
			 oDto = oList.get(i);
			 int total = oDto.getPrice()*oDto.getAmount();
			sum=sum+total; 
			
			%> 
			<tr>
				<td class = "text-center"><%=oDto.getProducts() %></td>
				<td class = "text-center"> <%=oDto.getPrice() %> </td>
				<td class = "text-center"><%=oDto.getAmount() %></td>
				<td class = "text-center"><%=total %></td>
			</tr>
		 	<%} %> 
			<tr>
				<td></td>
				<td></td>
				<td class = "text-right"><strong>총 지불금액 : <%=sum %></strong></td>
				<td class = "text-center text-danger"><strong></strong></td>
			</tr>
		</table>
		 <%if((String)session.getAttribute("idKey") != null) {%>
            	<a href="/Chicken/order.do" class="w3-bar-item w3-button">이전</a>
            <%} %>
            <%if((String)session.getAttribute("idKey") != null) {%>
            	<a href="/Chicken/cancleOrder.do?orderNumber=<%=oDto.getOrderNumber() %>&orderStatus=<%=oDto.getStatus() %>" class="w3-bar-item w3-button">주문 취소</a>
            <%} %>
            
	
		<!-- <a href = "./thankCustomer.jsp" class = "btn btn-success" role = "button">주문 완료</a>
		<a href = "./checkOutCancelled.jsp" class = "btn btn-secondary" role = "button">취소</a> -->
		<!-- 주문현황 조회에선 필요없는 버튼 --> 
		</div>
		</div>

</body>
</html>