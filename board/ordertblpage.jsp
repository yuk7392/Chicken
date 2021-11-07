<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.orderDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 현황</title>

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
span {
	color: white;
	background-color: #FF8C0A;
	font-weight: bold;
}

.mySlides {
	display: none;
}
</style>

</head>
<body>
	<%
		try {
	%>
	<!-- --------- 상단바 불러오기 ----------- -->
	<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp"%>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div id="page_title">
		<h1>
			<span>Order List</span>
		</h1>
		<div style="margin: 0 auto; width: 100%; height: 10px;">
			<div class="title_menu">
				<a href="">공지사항</a> <a href="">회사소개</a> <a href="">제휴</a>
			</div>
		</div>
		<span style="width: 850px; height: 3px; background-color: gray;"></span>
	</div>
	<br>
	<!-- 게시판 -->
	<div style="height: 700px;">
		<table class="poly_table"
			style="border-top: 2px solid #212529; border-bottom: 2px solid #212529;">
			<thead>
				<tr>
					<th style="width: 80px;">주문 번호</th>
					<th style="width: 100px;">주문 날짜</th>
					<th style="width: 100px;">주문 상태</th>
				</tr>
			</thead>
			<tbody>


				<%
					ArrayList<orderDto> listOforder = (ArrayList<orderDto>) session.getAttribute("listOforder");
					int fullSize = (int)session.getAttribute("fullSize");
						//반복문을 통한 공지글 받아오기
						for (int i = fullSize-10; i < fullSize; i++) {
							orderDto orderlist = listOforder.get(i); 
				%> 
				<tr>
				<td><a href="/Chicken/postRead.do?board_no=<%=orderlist.getOrderNumber()%>&board=<%="ordertbl"%>"><%=orderlist.getOrderNumber()%></td>
					<td><%=orderlist.getDate()%></td>
					<td><%=orderlist.getStatus()%></td> 
				</tr>
 		<%
					} //반복문종료
				%>  
			</tbody>
		</table>
	</div>
	
	<%-- <!-- 페이지 버튼 -->
 	<div id="page_button">
		<div class="pagination">
			<a
				href="/Chicken/pagebefore.do?oldNum=<%=oldNum%>&newNum=<%=newNum%>">&laquo;</a>
			<%
				int noticeCount = (Integer) session.getAttribute("noticeCount");
					for (int i = 1; i < (noticeCount / 5) + 2; i++) {
			%>
			<a href="/Chicken/pagenum.do?oldNum=<%=oldNum%>&pageNum=<%=i%>"
				class="active"><%=i%></a>
			<%
				} //반복문 종료
			%>
			주문현황 데이터는 10까지만 저장되므로 한페이지에 10개만 출력되고 나머지는 표시되지 않음
 --%> 


	<%} catch (Exception e) {%>
	<div style="margin: 0 auto; width: 830px; text-align: center; margin-bottom: 30px;">
		<span style="color: black; background-color: transparent; font-size: 30px">
			<%=e + " "%>오류가 발생했습니다. 다시 시도해주세요.
		</span>
	</div> <%}%>
	
	<!-- --------- 하단 부분 불러오기 ----------- -->
	<div class="jumbotron" style="background-color: #FFC81E">
		<%@ include file="/attachments/bottom.jsp"%>
	</div>

	<hr>
	<br>
	<br>

	<div class="jumbotron" style="background-color: black">
		<%@ include file="/attachments/footer.jsp"%>
	</div>


</body>
</html>