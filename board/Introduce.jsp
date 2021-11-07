<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="../resources/script/script1.js" />
<link rel = "stylesheet" href = "../resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/introduce.css">

<style>

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}


</style>
</head>

</head>
<body>
<!-- --------- 상단바 불러오기 ----------- -->
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	<div id = "page_title">
	<h1>
		<span>Introduce</span>
	</h1>
	<div style="margin:0 auto; width:100%; height:10px;">
		<div class="title_menu">
			<a href="">공지사항</a>
			<a href="">회사소개</a>
			<a href="">제휴</a>
		</div>
	</div>
	<span style="width:850px; height:3px; background-color:gray;"></span>
	</div>
	<br>
	<!-- 회사 소개 -->
	<div id="introduce" style="margin:0 auto; width:100%; height:930px;
  				display: flex; justify-content: center; position:static;">
  		<div style="width:830px height:840px;">
		<div class="introduce_box1" style="margin-top:30px;">
			<div class="introduce_box2">
				<span class="introduce_titles">Polychicken?</span>
				<span class="introduce_contents">
				Polychicken은 신뢰, 건강, 친화를 중심으로한 기업으로,<br>
				2013년 독자경영을 시작 한 Poly치킨은 놀라운 성장을 보이며 국내 프랜차이즈 대표 기업으로 성장하였습니다.
				<br>
				투명 경영 ,상생 경영, 나눔 경영을 기반으로 하는 Polychicken 는 소비자와의 약속을 지키며,<br>
				'더 깨끗한, 더 친절한, 더 맛있는' 치킨을 제공하자는 슬로건을 내세워<br>
				신뢰도 높은 기업으로 성장하기위해 항상 노력하고있습니다.<br>
				<br>
				쌍방향 커뮤니케이션으로 성공을 이끄는 Win-Win System, 창업부터 성공까지 확실하게 책임지는 경영전문가의 관리 시스템,
				높은 투자 효율성으로 가맹점의 만족을 극대화하고 있습니다.
				</span>
			</div>
			<div class="introduce_test"></div>
			<span class="introduce_picture"> <img src="../images/cheeseball.jpg"></span>
		</div><!-- 하나 끝 -->
		
		<div class="introduce_box1">
			<span class="introduce_picture2"> <img src="../images/map.png"></span>
			<div class="introduce_test"></div>
			<div class="introduce_box2" style="position: absolute;top: 0;left: 280px;">
				<span class="introduce_titles">찾아오는 길</span>
				<span class="introduce_contents">
				인천광역시 부평구 무네미로 448번길 56 한국폴리텍II대학 인천캠퍼스
				</span>
			</div>
		</div><!-- 하나 끝 -->
		
		<div class="introduce_box1">
			<div class="introduce_box2">
				<span class="introduce_titles">대표 | 홍길동</span>
				<span class="introduce_contents">
				고객 여러분, 안녕하십니까.<br>
				항상 Polychicken에 많은 관심과 응원을 보내주시는 고객 여러분께 깊은 감사의 말씀을 드립니다.
				<br><br>
				저희 Polychicken은 투명경영, 상생경영을 바탕으로 고객에게 신뢰받는 브랜드로 성장하기 위해 끊임없이 노력하여 빛나는 성장을 기록하고 있습니다.
				<br><br>
				Polychicken은 더 맛있고! 더 깨끗한! 더 친절한! 브랜드로 모든 고객의 감성을 만족시켜 사랑받는 브랜드가 되기 위해 전국 Polychicken 가맹점과 본사 임직원 모두가 최선을 다할 것입니다.
				</span>
			</div>
			<div class="introduce_test"></div>
			<span class="introduce_picture"> <img src="../images/ryan.png"></span>
		</div><!-- 하나 끝 -->
		
		
		</div>
	</div>
<!-- --------- 하단 부분 불러오기 ----------- -->
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