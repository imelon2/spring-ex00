<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>중앙지점 주변 마커 호출</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
</head>
<body>
	<div id="map" style="width: 50%; height: 400px;"></div>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : 'post',
				url : '${appRoot}/test/test2',
				datatype : 'json',
				success : function(data) {
					console.log(data);

					var lat = data.lat;
					var lag = data.lag;
					console.log(lat);
					console.log(lag);

					/* 지도 */
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(lag, lat),
						zoom : 15
					});

					/* 유저 마커 */
					var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng(lag, lat),
						map : map
					});

					var data = {
						lat : lat,
						lag : lag
					}

					$.ajax({

						type : 'post',
						url : '${appRoot}/test/test3',
						data : JSON.stringify(data),
						contentType : "application/json",
						success : function(list) {
							console.log(list);
							
							/* 집주변 빨래방 마커 */
						for(var address of list ){
							
							 var marker = new naver.maps.Marker({
								position : new naver.maps.LatLng(address.lag, address.lat),
								map : map  
							});
						}

						}
					})

				},
				error : function() {
					console.log("실패");
				}
			})
		})
	</script>
</body>
</html>