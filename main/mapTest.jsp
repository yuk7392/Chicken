<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PolyChicken 찾아보기</title>

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<link rel="stylesheet"	href="../resources/script/script1.js" />
<link rel = "stylesheet" href = "../resources/css/NewFile.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../resources/css/login.css">

<style>
h1 { text-align: center; }

span {color : white; background-color: #FF8C0A; font-weight: bold;}
.mySlides {display:none;}


</style>
</head>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:600px;height:400px;}
#menu_wrap {position:absolute;top:0;left:630px;bottom:0;width:250px;height:380px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#menu_wrap span{background-color:transparent; color:#6c757d}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body onload="searchPlaces('서울 bhc')">
<nav class = "navbar navbar-expand  navbar-dark bg-dark">
		<%@ include file="/attachments/head.jsp" %>
	</nav>
	<br><br><br><br>
	<div id = "page_title">
	<h1>
		<span style="background-color:transparent; color:black">POLY</span>
		<span style="margin-left:-10px">CHICKEN</span>
		<span style="background-color:transparent; color:black">찾아보기</span>
		
	</h1>
	<span style="width:850px; height:3px; background-color:gray;"></span>
	</div>
	
	<!-- ===========================맵 표시하는 부분========================= -->
	<div style="margin:30px 0 10px 100px; height:550px">
		<div style="position:absolute; left:50%; transform: translateX(-540px);">
			<img src="/Chicken/images/polyMap.png" usemap="#image-map">
			<map name="image-map">
			    <area onclick="searchPlaces('서울 BHC')" alt="서울" title="서울" coords="86,107,71,111,68,119,82,135,98,129,101,125" shape="poly">
			    <area onclick="searchPlaces('경기도 BHC')" alt="경기도" title="경기도" coords="84,54,45,106,80,187,111,187,144,157,125,74,84,54,87,105,104,125,98,131,81,136,67,120,70,110,86,106" shape="poly">
			    <area onclick="searchPlaces('강원도 BHC')" alt="강원도" title="강원도" coords="87,53,110,42,166,43,187,38,199,16,279,158,217,171,146,156,127,73" shape="poly">
			    <area onclick="searchPlaces('충청남도 BHC')" alt="충청남도" title="충청남도" coords="31,178,18,215,35,218,54,279,72,276,133,275,111,189,79,189" shape="poly">
			    <area onclick="searchPlaces('충청북도 BHC')" alt="충청북도" title="충청북도" coords="152,279,134,274,112,188,145,159,214,172" shape="poly">
			    <area onclick="searchPlaces('전라북도 BHC')" alt="전라북도" title="전라북도" coords="74,277,40,341,63,336,134,345,154,294,151,281,134,277" shape="poly">
			    <area onclick="searchPlaces('전라남도 BHC')" alt="전라남도" title="전라남도" coords="40,345,26,413,49,459,151,386,134,348,62,338" shape="poly">
			    <area onclick="searchPlaces('경상북도 BHC')" alt="경상북도" title="경상북도" coords="185,318,156,293,153,280,217,173,277,162,285,270,294,272,286,310" shape="poly">
			    <area onclick="searchPlaces('경상남도 BHC')" alt="경상남도" title="경상남도" coords="152,384,136,347,156,297,182,322,285,314,272,371,222,378,207,399" shape="poly">
			    <area onclick="searchPlaces('제주도 BHC')" alt="제주도" title="제주도" coords="32,491,70,489,79,502,77,512,54,521,27,522,16,517,12,501" shape="poly">
			</map>
		</div>
		<div style="margin-bottom:10px; position: absolute; left: 50%; transform: translateX(-200px); ">
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div style="background-color:white">
			                        선택된 장소 : <input type="text" value="서울 BHC" id="keyword" size="15" style="background-color:transparent; border:none"> 
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		</div>
		<div style="position: absolute; left: 50%; transform: translateX(-200px); top:600px">
			<input class="btn btn-secondary disabled" type="button" value="서울" onclick="searchPlaces('서울 BHC')">
			<input class="btn btn-secondary disabled" type="button" value="인천" onclick="searchPlaces('인천 BHC')">
			<input class="btn btn-secondary disabled" type="button" value="대전" onclick="searchPlaces('대전 BHC')">
			<input class="btn btn-secondary disabled" type="button" value="부산" onclick="searchPlaces('부산 BHC')">
			<input class="btn btn-secondary disabled" type="button" value="울산" onclick="searchPlaces('울산 BHC')">
			<input class="btn btn-secondary disabled" type="button" value="세종" onclick="searchPlaces('세종 BHC')">
		</div>
	</div>

<!-- 맵 표시 끝 -->
	
<div class = "jumbotron" style="background-color:#FFC81E">
	<%@ include file="/attachments/bottom.jsp" %>
	</div>
	
	<hr>
	<br>
	<br> 
	
	<div class = "jumbotron" style="background-color: black" >
	<%@ include file="/attachments/footer.jsp" %>
	</div>
	
	<!-- ====================맵 표시 스크립트================= -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2e60eb2fe90e51308b265b4888cd464&libraries=services"></script>
<script>
function testF(map_Value){
	alert(map_Value);
}

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

function searchPlaces(click_value) {
	document.getElementById('keyword').value = click_value;
    ps.keywordSearch( click_value, placesSearchCB); 
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title, pY, pX) {
        	var moveLatLon = new kakao.maps.LatLng(pY, pX);
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            kakao.maps.event.addListener(marker, 'click', function() {
            	map.setLevel(3);
            	map.setCenter(moveLatLon);
            });
            
            itemEl.onclick =  function () {
            	map.setLevel(5);
            	map.setCenter(moveLatLon);
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name,places[i].y, places[i].x);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</body>
</html>