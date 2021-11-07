<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<script src="../resources/script/signupCheck.js"></script>
<link rel="stylesheet"	href="/resources/script/script1.js" />
<link rel = "stylesheet" href = "/resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/login.css">

<script>
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.addr.value = roadFullAddr;
}

</script>

<style>
h1 { text-align: center; }

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}


</style>
</head>

</head>
<body>
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	
	<h1>Sign up</h1>
	<hr>
	<br><br>
	
	
<form action="/Chicken/signup.do" id="form" name="form" method="get"> 
<div class="input-box"> 
<input id="username" type="text" name="username" placeholder="아이디"> 
<label for="username">아이디</label>
</div> 
<div class="input-box"> 
<input id="password" type="password" name="password" placeholder="비밀번호"> 
<label for="password">비밀번호</label> 
</div>

<div class="input-box"> 
<input id="password_confirm" type="password" name="password_confirm" placeholder="비밀번호 확인"> 
<label for="password_confirm">비밀번호 확인</label> 
</div>
<input type="button" value="비밀번호확인" onclick="pw_ck()">

<div class="input-box"> 
<input id="name" type="text" name="name" placeholder="이름"> 
<label for="name">이름</label> 
</div>

<div class="input-box"> 
<input id="phone" type="text" name="phone" placeholder="전화번호"> 
<label for="name">전화번호</label> 
</div>

<div class="input-box"> 
<input id="addr" type="text" name="addr" placeholder="주소" value="주소 확인 버튼을 눌러 진행하세요." disabled> 
<label for="name">주소</label> 
</div>
<input type="button" value="주소 확인" onclick="goPopup();">

<div class="input-box"> 
<input id="nickname" type="text" name="nickname" placeholder="닉네임"> 
<label for="name">닉네임</label> 
</div>



<input id="register_btn" type="submit" value="회원가입" disabled="disabled">
</form>


	
	
	
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