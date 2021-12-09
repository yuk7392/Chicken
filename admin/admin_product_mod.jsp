<%@ page import="com.chicken.user.UserDto" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chicken.user.impl.UserDao"%>
<%@ page import="com.chicken.board.impl.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
   
    
    BoardDAO mDao = new BoardDAO();	
    
   String name=mDao.getProductInfo(id,"name");
   String price=mDao.getProductInfo(id,"price");
   String desc=mDao.getProductInfo(id,"desc");
    
   String category=mDao.getProductInfo(id,"category");
   String stock=mDao.getProductInfo(id,"stock");
   String imgsrc=mDao.getProductInfo(id,"imgsrc");
   String like=mDao.getProductInfo(id,"like");
   String dislike=mDao.getProductInfo(id,"dislike");
   String view=mDao.getProductInfo(id,"view");
%>

<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="admin_head.jsp" %>
	</nav>
	<br><br><br><br>
	
<h1>상품 변경</h1>
<form action="/Chicken/updateProduct.do?id=<%=id %>&like=<%=like %>&dislike=<%=dislike %>&view=<%=view %>" method="post">
<table class="type02">

  
  
  <tr>
    <th scope="row">상품코드</th>
    <td><input type="text" id="id" name="id" value="<%=id%>" disabled/></td>
    </tr>
  <tr>
    <th scope="row">제품명</th>
    <td><input type="text" id="name" name="name" value="<%=name%>"/></td>
  </tr>
  
    <tr>
    <th scope="row">가격</th>
    <td><input type="text" id="price" name="price" value="<%=price%>"/></td>
  </tr>
  
  <tr>
    <th scope="row">설명</th>
    <td><input type="text" id="desc" name="desc" value="<%=desc%>"/></td>
  </tr>
    
     <tr>
    <th scope="row">분류</th>
    <td><input type="text" id="category" name="category" value="<%=category %>"/></td>
  </tr>
  
    <tr>
    <th scope="row">재고</th>
    <td><input type="text" id="stock" name="stock" value="<%=stock%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">이미지주소</th>
    <td><input type="text" id="imgsrc" name="imgsrc" value="<%=imgsrc%>"/></td>
  </tr>
  
   <tr>
    <th scope="row">좋아요</th>
    <td><%=like%></td>
  </tr>
  
   <tr>
    <th scope="row">싫어요</th>
    <td><%=dislike%></td>
  </tr>
  
   <tr>
    <th scope="row">조회수</th>
    <td><%=view%></td>
  </tr>
  
</table>
	
	<br>
	

  <input type="submit" style="float: center;" value="수정하기">

	</form>
<form action="/Chicken/deleteProduct.do?id=<%=id%>" method="post">
 <input type="submit" style="float: center;" value="삭제하기"><br>
</form>
	 <a href="admin_products.jsp"><input type="button" value="돌아가기"></a>
	
</body>
</html>