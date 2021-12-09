<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>

<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>

<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
	String cartId = session.getId();
%>
<meta charset="UTF-8">
<style>
h1 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
</style>
<title>장바구니</title>
</head>
<script> function plslog(){ alert('로그인을 해주세요'); }
		function plsorder(){ alert('주문하실 상품을 골라주세요'); }
</script>
<body>
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
		<%
			session.setAttribute("loginWhere", "cart");
		%>
	</nav>
	<br><br><br><br>
	<jspLinclude page="menu.jsp" />
	<div class="jumbotron" style="background-color: white">
	
		<div class="container">
			<h1 class="display-3">장바구니</h1>
			<hr>
		</div>
	</div>
	<div class="container">
	<div style="padding-top:50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
				<th> </th>
			</tr>
			<%
				int sum = 0;
						ArrayList<productDto> cartList = (ArrayList<productDto>) session.getAttribute("cartlist");
						if(cartList==null)
							cartList = new ArrayList<productDto>();
						
						for (int i=0; i<cartList.size(); i++) {
							productDto product = cartList.get(i);
							int total = product.getPrice() * product.getQuantity();
							sum=sum+total;
			%>
			<tr>
				<td><%=product.getName() %></td>
				<td><%=product.getPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
				<th><a href="./removeCart.do?id=<%=product.getId()%>" class="badge badge-danger">삭제</a></th>
			</tr>
			<% } %>
			<hr>
			<tr>
				<td></td>
				<td></td>
				<td>총액</td>
				<td><%=sum%></td>
				<td></td>
			</tr>
		</table>
		</div>
		<div calss="row">
			<table width="100%">
				<tr>
					<!-- <td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td> -->
					<td align="left"><a href="/Chicken/menuList.do" class="btn byn-secondary"> &laquo; 쇼핑 계속하기</a><td>
					<%if(session.getAttribute("cartlist")==null){%>
					 <td align="right"><a href="/Chicken/menu/menu.jsp" class="btn btn-success" role="button" onclick="javascript:plsorder()">주문하기</a></td>
						<%}else{
					if(mem_id == null){
        %>
        <td align="right"><a href="/Chicken/login/login.jsp" class="btn btn-success" role="button" onclick="javascript:plslog()">주문하기</a></td>
        <!-- 로그인이 된 경우 -->
        <% } else{ %>
        <td align="right"><a href="/Chicken/cart.do?mypage_id=<%=mem_id%>" class="btn btn-success">주문하기</a></td>
        <% }} %>
				</tr>
			</table>
		</div>
		<hr>
	</div>
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