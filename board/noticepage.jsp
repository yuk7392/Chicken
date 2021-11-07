<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chicken.board.noticeTextVo"%>
<%@ page import="com.chicken.board.pageNumVo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

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
			<span>Notice</span>
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
					<th style="width: 60px;">글번호</th>
					<th>제목</th>
					<th style="width: 100px;">작성자</th>
					<th style="width: 110px;">작성일</th>
				</tr>
			</thead>
			<tbody>


				<%
					ArrayList<noticeTextVo> listOfNotice = (ArrayList<noticeTextVo>) session.getAttribute("listOfNotice");
						noticeTextVo noticeText1 = listOfNotice.get(0); // 현재리스트중 가장 최신공지의 번호
						noticeTextVo noticeText2 = listOfNotice.get(listOfNotice.size() - 1); // 현재 리스트중 가장 오래된 공지의 번호
						int newNum = noticeText1.getNumber(); // 현재리스트중 가장 최신공지의 번호
						int oldNum = noticeText2.getNumber(); // 현재 리스트중 가장 오래된 공지의 번호

						//반복문을 통한 공지글 받아오기
						for (int i = 0; i < listOfNotice.size(); i++) {
							noticeTextVo noticeText = listOfNotice.get(i);
				%>
				<tr>
					<td><%=noticeText.getNumber()%></td>
					<td><a href="/Chicken/postRead.do?board_no=<%=noticeText.getNumber()%>&board=<%="notice"%>"><%=noticeText.getTitle()%></a></td>
					<td><%=noticeText.getWriter()%></td>
					<td><%=noticeText.getDate()%></td>

				</tr>
				<%
					} //반복문종료
				%>

			</tbody>
		</table>
	</div>
	<!-- 페이지 버튼 -->
	<div id="page_button">
		<div class="pagination">
			<a
				href="/Chicken/pagebefore.do?oldNum=<%=oldNum%>&newNum=<%=newNum%>">&laquo;</a>
			<%
				int buttonCount = (Integer) session.getAttribute("buttonCount");
					for (int i = 1; i < buttonCount; i++) {
			%>
			<a href="/Chicken/pagenum.do?oldNum=<%=oldNum%>&pageNum=<%=i%>"
				class="active"><%=i%></a>
			<%
				} //반복문 종료
			%>



			<a href="/Chicken/pageafter.do?oldNum=<%=oldNum%>&newNum=<%=newNum%>">&raquo;</a>

		</div>
	</div>



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