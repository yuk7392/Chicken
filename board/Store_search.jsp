<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet" href="../resources/script/script1.js" />
<link rel="stylesheet" href="../resources/css/NewFile.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/review.css">

</head>
<body>
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
			<span>Store</span>
		</h1>
		<div style="margin: 0 auto; width: 100%; height: 10px;"></div>
		<span style="width: 850px; height: 3px; background-color: gray;"></span>
	</div>
	<br>
	<div class="container" align="center">
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1635934466133" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1635934466133",
		"key" : "27wfv",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>
</div>

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