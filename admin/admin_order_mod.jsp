<%@ page import="com.chicken.user.UserDto" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<%@ page import="com.chicken.board.impl.BoardDAO" %>
<%@ page import="com.chicken.board.impl.OrderDAO" %>
<%@ page import="com.chicken.board.orderDto" %>
<!DOCTYPE html>
<html>
<head>
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
   
    
    OrderDAO mDao = new OrderDAO();	
    
  String no,number,orderer,products,date,status,addr,amount,price;
  no = mDao.getOrderInfo(id, "no");
  number = mDao.getOrderInfo(id, "number");
  orderer = mDao.getOrderInfo(id, "orderer");
  products = mDao.getOrderInfo(id, "products");
  date = mDao.getOrderInfo(id, "date");
  status = mDao.getOrderInfo(id, "status");
  addr = mDao.getOrderInfo(id, "addr");
  amount = mDao.getOrderInfo(id, "amount");
  price = mDao.getOrderInfo(id, "price");

	 
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>주문 변경</h1>
<form action="/Chicken/updateOrder.do?id=<%=id %>" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">번호</th>
    <td><%=id %></td>
    </tr>
  <tr>
    <th scope="row">주문번호</th>
    <td><%=number %></td>
  </tr>
  
    <tr>
    <th scope="row">주문자</th>
    <td><%=orderer %></td>
  </tr>
  
  <tr>
    <th scope="row">주문내용</th>
    <td><input type="text" id="products" name="products" value="<%=products%>"/></td>
  </tr>
    
     <tr>
    <th scope="row">날짜</th>
    <td><%=date %></td>
  </tr>
  
    <tr>
    <th scope="row">배달상태</th>
    <td><select name="status">
    <option value="준비 중">준비 중</option>
    <option value="배달 중">배달 중</option>
    <option value="배달 완료">배달 완료</option>
    </select></td>
  </tr>
  
   <tr>
    <th scope="row">주소</th>
    <td><input type="text" id="addr" name="addr" value="<%=addr%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">수량</th>
    <td><input type="text" id="amount" name="amount" value="<%=amount%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">가격</th>
    <td><input type="text" id="price" name="price" value="<%=price%>"/></td>
  </tr>
  
</table>
	
	<br>
	

  <input type="submit" style="float: center;" value="수정하기">

	</form>
<form action="/Chicken/deleteOrder.do?id=<%=id%>" method="post">
 <input type="submit" style="float: center;" value="삭제하기"><br>
</form>
	 <a href="admin_order.jsp"><input type="button" value="돌아가기"></a>
	
</body>
</html>