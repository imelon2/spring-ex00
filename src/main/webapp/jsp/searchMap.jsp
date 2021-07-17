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
</head>
<body>


	<div class="container">
		<h1>가게 제목으로 빨래방 찾기</h1>
		<div class="row display-flex">
			<!-- 가게 제목으로 찾기 -->
			<div id="storeName">
				<h4>●가게제목</h4>
			</div>

			<!-- 내집 주소로 주변 찾기 -->
			<div id="myAddress">
				<h4>●내 집 주소</h4>
			</div>
		</div>
	</div>
	
	<!-- 가게 제목으로 검색할때 -->
	<div class="container">
		<div class="row display-flex">
			<input type="text" placeholder="가게 이름">
		</div>
		<div>
			<div id="map1" style="width: 500px; height: 400px;"></div>
		</div>
	</div>
	
	<!-- 우리집 주소로 검색할때 -->
	<div class="container">
		<div class="row display-flex">
			<input type="text" placeholder="우리집 주소">
		</div>
		<div>
			<div id="map2" style="width: 500px; height: 400px;"></div>
		</div>
	</div>



</body>



<script>
	var mapOptions = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	};

	var map = new naver.maps.Map('map1', mapOptions);
</script>

<script>
	var mapOptions = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	};

	var map = new naver.maps.Map('map2', mapOptions);
</script>



</html>






