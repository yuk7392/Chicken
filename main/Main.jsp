<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.productDto"%>
<%@ page import="com.chicken.board.impl.ProductDAO"%>

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
<title>Welcome</title>

<style>
h1 { text-align: center; }
span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}
</style>
</head>
<body  onload="window.open('Popup.html','','width=400px, height=600px, left=300px, top=200px, toolbar=0, status=yes, menubars=0, scrollbars=0, resizable=0, location=0, directories=0')">
	<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>


<!-- 치킨 -->
<div class="w3-container w3-center w3-animate-zoom">


<div class="jumbotron" style="background-color: white">
		
		<div class="container">
			<h1 class="display-3"><strong>Poly</strong><span>chicken</span></h1>
			<hr>
		</div>
	</div>
	
<div class="w3-content w3-display-container">
<center>
  <img class="mySlides" src="../images/chicken_seasoned.jpg" height = "550" width = "900">
  <img class="mySlides" src="../images/chicken_fried.png" height = "550" width = "900">
  <img class="mySlides" src="../images/cheeseball.jpg" height = "550" width = "900">
</center>
  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<br><br><br><br>

	<%
		ProductDAO pDao = new ProductDAO();
		ArrayList<productDto> listOfProducts = pDao.getAllProducts();
	%>

	<div class="container">
	
		<div class="row" align="center">
			<%
				for (int i = listOfProducts.size()-1; i >  listOfProducts.size()-5; i--) {
							productDto product = listOfProducts.get(i);
			%>
			<p>
			  <div class="col-md-12">
			<img src="<%=product.getImgsrc()%>" class="w3-circle"  style="width: 100%">
			<br><br><br>
				<b><h1><%=product.getName()%></h1></b>
				<b><p><%=product.getDesc()%></b>
				<br><br><br>
				<p> <a href="/Chicken/orderButton.do?ProductId=<%=product.getId()%>" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				
			<br><br><br>
			</div>
			
			</p>
			<%
				}
			%>
		</div>
		
		<br><br><br>
	<div class = "container">
		<div class = "text-center">
		</div>
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
	
	
<script>

function myFunction() {
	  var x = document.getElementById("Demo");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>



</body>
</html>