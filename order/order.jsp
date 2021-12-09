<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>

<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>주문</title>
<script type="text/javascript">
function addToCart(){
	if(confirm("상품을 추가하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}

</script>
<style>
h1 { text-align: center; font-weight: bold;}
h4 { text-align: left; }
p { text-align: left; }
h2{font-weight: bold;}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	
	<br><br><br><br><br><br>
	
	<div class="jumbotron" style="background-color: white">
	
		<div class="container">
			<h1 class="display-3">Order</h1>
			<hr>
		</div>
	</div>
	
		<%
				request.setCharacterEncoding("utf-8");
				String username = request.getParameter("username");
				session.setAttribute("username",username);
				String id = request.getParameter("id");
				productDto pDto = (productDto)session.getAttribute("productInfo");
				
		%>
	
	   <form name="addForm" action="./addCart.do?mypage_id=<%=mem_id%>&productId=<%=pDto.getId() %>" method="post">
	<div class="container" align="center">
			<div class="col-md-5">
				<img src="<%=pDto.getImgsrc()%>" style="width: 100%">
			</div>
			<div class="container" align="center">
			<div class="col-md-6">
				<h2><% out.println(pDto.getName());%></h2>
				<p> <%out.println(pDto.getDesc()); %>
					<h4>가격 : <%out.println(pDto.getPrice()); %>원</h4>
				<div class="updown">
                    <p><input type="number" min="1" name="quantity" size ="3" value="1"> 
                </div>
					<p>
					<a href="../order/cart.jsp" class="btn btn-info">장바구니</a>
					<a href="#" onclick="addToCart()" type="submit" class="btn btn-info"> 주문하기</a>
					<a href="../menu/menu.jsp" class="btn btn-info"> 상품 목록</a>
				  </form>
				 
				<a href="/Chicken/thumbsButton.do?productId=<%=pDto.getId() %>&thumbs=up" class="w3-bar-item w3-button">
				<img style="border-radius: 20px" src="/Chicken/images/like.png" width="40px" height="40px" />
				<pre> <%=pDto.getLike() %></pre>
				</a>
				
				<a href="/Chicken/thumbsButton.do?productId=<%=pDto.getId() %>&thumbs=down" class="w3-bar-item w3-button">
				<img style="border-radius: 20px" src="/Chicken/images/dislike.png" width="40px" height="40px" />
				<pre> <%=pDto.getDislike() %></pre>
				</a>
			</div>
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

