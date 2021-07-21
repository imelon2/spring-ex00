<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>매장 찾기</title>

<script type="text/javascript">
	function showhidebtn1() {
		$("#searchName").show();
		$("#searchAddress").hide();
	}

	function showhidebtn2() {
		$("#searchAddress").show();
		$("#searchName").hide();
	}
	
	function storeinfo() {
		$("#storeinfo").show()
	}
</script>


</head>
<body>


	<div class="container">
		<h1>가게 제목으로 빨래방 찾기</h1>
		<div class="row display-flex">
			<!-- 가게 제목으로 찾기 -->
			<button id="storeName" onclick="showhidebtn1()">●가게제목</button>

			<!-- 내집 주소로 주변 찾기 -->
			<button id="myAddress" onclick="showhidebtn2()">●우리집 주소로 찾기</button>
		</div>
	</div>

	<!-- 가게 제목으로 검색할때 -->
	<div id="searchName">
		<div class="container">
			<div class="row display-flex">
				<input type="text" placeholder="가게 이름">
			</div>
			<div>
				<div id="map1" style="width: 500px; height: 400px;"></div>
				<!-- 가게정보 -->
				<div id="storeinfo" class="row display-flex" style="display:none">
					<div>
						<img src="${imgRoot}storename/center.jpg">
					</div>
					<div>
						<ul>
							<li>가게 이름:</li>
							<li>주소:</li>
							<li>평점:</li>
							<li><a href="https://www.naver.com/">리뷰보기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 우리집 주소로 검색할때 -->
	<div id="searchAddress" style="display: none">
		<div class="container">
			<div class="row display-flex">
				<input type="text" placeholder="우리집 주소">
			</div>
			<div>
				<div id="map2" style="width: 500px; height: 400px;"></div>
			</div>
		</div>
	</div>


</body>



<script>
	/* 1번 지도 */
	var mapOptions1 = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	};

	var map1 = new naver.maps.Map('map1', mapOptions1);

	/* 1번 유저 마커 */
	var markerOptions = {
		position : new naver.maps.LatLng(37.3595704, 127.105399),
		map : map1,
		icon : {

			content : [ `<div onclick=" storeinfo()"><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>` ]
					.join(''),

		}

	};
	var marker = new naver.maps.Marker(markerOptions);
</script>

<script>
	/* 2번 지도 */
	var mapOptions2 = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	};

	var map2 = new naver.maps.Map('map2', mapOptions2);
</script>



</html>






