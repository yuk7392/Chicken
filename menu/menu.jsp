<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>

<html>
<script> function plslog(){ alert('로그인을 해주세요'); } </script>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<title>상품 목록</title>
<style>
h1 { text-align: center; }
</style>
</head>
<body onload="window.open('popularMenu.jsp','','width=400px, height=455px, left=300px, top=200px, toolbar=0, resizeable=0,status=no, menubars=0, scrollbars=0, resizable=0, location=0, directories=0')">
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	
	
	<br><br><br><br><br><br>
	
	<div class="jumbotron" style="background-color: white">
	
		<div class="container">
			<h1 class="display-3">MENU</h1>
			<hr>
		</div>
	</div>
	
	<%
			String logWhere = "orderPage";
				session.setAttribute("loginWhere", logWhere);
				ProductDAO pDao = new ProductDAO();
				ArrayList<productDto> listOfProduct = pDao.getAllProducts();
				//ProductDAO dao = ProductDAO.getInstance();
				//ArrayList<productDto> listOfProduct = (ArrayList<productDto>)session.getAttribute("listOfProduct");
		
	%>

	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProduct.size(); i++) {
							productDto product = listOfProduct.get(i);
			%>
			<div class="col-md-4">
			<a href="/Chicken/orderButton.do?ProductId=<%=product.getId()%>" ><img src="<%=product.getImgsrc() %>" style="width: 100%"></a>
				<h3><%=product.getName()%></h3>
				<p><%=product.getDesc()%>
				<p><%=product.getPrice()%>원
				<p> 
				
				<%if(mem_id == null){
					logWhere="orderLogin";
					session.setAttribute("loginWhere", logWhere);
					session.setAttribute("pdId", product.getId());
        %>
        <a href="/Chicken/login/login.jsp" class="btn btn-secondary" role="button" onclick="javascript:plslog()">주문</a>
        <!-- 로그인이 된 경우 -->
        <% } else{ %>
        <a href="/Chicken/orderButton.do?ProductId=<%=product.getId()%>" class="btn btn-secondary" role="button"> 주문</a>
        <% } %>
				
			</div>
			<%
				}
			%>
		</div>
		<hr>
		<div class = "container">
		<div class = "text-center">
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
