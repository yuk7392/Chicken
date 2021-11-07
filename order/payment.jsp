<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.user.UserDto"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<%@ page import="com.chicken.board.orderDto"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); //yyyy년 MM월 dd일 a hh:mm:ss
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>

<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>결제</title>
<style>
h1 { text-align: center; font-weight: bold;}
h3 { text-align: center; font-weight: bold;}
p { text-align: left; }
</style>
</head>
<body>
<%
	//request에서 UserDto 받기
	UserDto uDto = (UserDto)session.getAttribute("mypageview");
%>

	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>

		<div class="jumbotron" style="background-color: white">
	
		<div class="container">
			<h1 class="display-3">Payment</h1>
			<p><a href="../main/Main.jsp">홈으로</a>.<a href="../menu/menu.jsp">메뉴</a>.<a href="cart.jsp">장바구니</a>
			<hr>
		</div>
	</div>
	
	<div class="jumbotron">
	<div class = "container">
	<h3>주문 할 내용</h3>
	<p>주소 : <%=uDto.getAddr()%>
	<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<String> Oproducts = new ArrayList<>();
				ArrayList<Integer> OAmounts = new ArrayList<>();
				ArrayList<Integer> OPrice = new ArrayList<>();
				
				ArrayList<productDto> cartList = (ArrayList<productDto>) session.getAttribute("cartlist");
				ArrayList<orderDto> listOforder = (ArrayList<orderDto>) session.getAttribute("listOforder");
				if(cartList==null)
					cartList = new ArrayList<productDto>();
				
				int oNum=listOforder.size();
				int fullsize = listOforder.size()-1;
				orderDto orderlist = listOforder.get(fullsize);
				orderlist.setOrderNumber(oNum);
				
				
				for (int i=0; i<cartList.size(); i++) {
					productDto product = cartList.get(i);
					Oproducts.add(product.getName());
					OAmounts.add(product.getQuantity());
					OPrice.add(product.getPrice());
					int total = product.getPrice() * product.getQuantity();
					sum=sum+total;
			%>
			<tr>
				<td><%=product.getName() %></td>
				<td><%=product.getPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
			</tr>
			<% }
					session.setAttribute("list",cartList.size());
					session.setAttribute("orderNum",oNum);
					session.setAttribute("orderer",uDto.getId());
					session.setAttribute("orderDate",sf.format(nowTime));
					session.setAttribute("orderStatus","준비 중");
					session.setAttribute("orderAddr",uDto.getAddr());
					
					session.setAttribute("orderProducts",Oproducts);
					session.setAttribute("orderAmounts",OAmounts);
					session.setAttribute("orderPrice",OPrice);%>
			<hr>
			<tr>
				<td></td>
				<td></td>
				<td>총액</td>
				<td><%=sum%></td>
			</tr>
		</table>
	<p> <form name="addForm" method="post">
	<a href="cart.jsp" class="btn btn-info">뒤로가기</a>
	<a href="payment.do" class="btn btn-info">결제하기</a>
	</form>
	</div>
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