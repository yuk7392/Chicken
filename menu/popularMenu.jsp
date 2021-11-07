<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popular Menu</title>

<link rel="stylesheet" href="/Chicken/resources/css/popularMenu.css">
</head>
<body>

	<%
		ArrayList<productDto> listOfProduct = (ArrayList<productDto>) session.getAttribute("listOfPopularProduct");
		System.out.println("asdf");
	%>
	<div class="div1">
		<div class="div2">
			<img src="/Chicken/images/popularMenuTitle.png">
		</div>
		<div class="div2" style="top: 113px">
			<div class="div3">
				<div class="div4">
					<img src="<%=listOfProduct.get(0).getImgsrc()%>">
				</div>
				<div class="div5">
					<div class="div6">
						<!--  <img src="/Chicken/images/test4.png" class="rankLabel">-->
						<span class="rankLabel">1</span> 
						<span class="menucontent">
							<p><%=listOfProduct.get(0).getName()%></p></span>
					</div>
				</div>
			</div>
		</div>

		<div class="div2" style="top: 226px">
			<div class="div3">
				<div class="div4">
					<img src="<%=listOfProduct.get(1).getImgsrc()%>">
				</div>
				<div class="div5">
					<div class="div6">
						<span class="rankLabel">2</span> <span class="menucontent">
							<p><%=listOfProduct.get(1).getName()%></p></span>
					</div>
				</div>
			</div>
		</div>

		<div class="div2" style="top: 339px">
			<div class="div3">
				<div class="div4">
					<img src="<%=listOfProduct.get(2).getImgsrc()%>">
				</div>
				<div class="div5">
					<div class="div6">
						<span class="rankLabel">3</span> <span class="menucontent">
							<p><%=listOfProduct.get(2).getName()%></p></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>