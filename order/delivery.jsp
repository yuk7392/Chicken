<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>
<%@ page import="com.chicken.user.UserDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
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
span{color : skyblue;}
ord{color : blue; background-color: blue;}
ordN{color : white; background-color: white;}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>

		<div class="jumbotron" style="background-color: white">
	
		<div class="container">
			<h1 class="display-3">주문현황</h1>
			<p><a href="../main/Main.jsp">홈으로</a>.<a href="../menu/menu.jsp">메뉴</a>.<a href="cart.jsp">장바구니</a>
			<hr>
		</div>
	</div>
	<%
				int sum = 0;
				ArrayList<productDto> cartList = (ArrayList<productDto>) session.getAttribute("cartlist");
				if(cartList==null)
					cartList = new ArrayList<productDto>();
				
				for (int i=0; i<cartList.size(); i++) {
					productDto product = cartList.get(i);
					int total = product.getPrice() * product.getQuantity();
					sum=sum+total;}
				int listminus = cartList.size()-1;
				productDto p =cartList.get(0);
			%>
	<div class="jumbotron">
	<div class = "container">
	<p><span>준비중></span>  <%=p.getName() %> 외 <%=listminus%>
	<p>  <ord>ㅇㅇㅇㅇㅇ</ord>  <ordN>ㅇㅇㅇㅇㅇ</ordN>  <ordN>ㅇㅇㅇㅇㅇ</ordN>
	<%
	//request에서 UserDto 받기
	UserDto uDto = (UserDto)session.getAttribute("mypageview");
	
%>
	<P>배송지 : <%=uDto.getAddr()%>
	</div>
	</div>
	
	<div class="container" align="center">
	<p> <form name="addForm" method="post">
	<a href="payment.jsp" class="btn btn-info">뒤로가기</a>
	</form>
	</div>
	
	<br><br>
	
	
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