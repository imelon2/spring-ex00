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
<title>고객주변 빨래방 찾기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
</head>
<style>
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
<body>
	<div id="map" style="width: 50%; height: 400px;"></div>

	<script type="text/javascript" ">
		$(function() {
			$.ajax({
				type : 'post',
				url : '${appRoot}/test/test2',
				datatype : 'json',
				success : function(data) {
					console.log(data);

					var lat = data.lat;
					var lag = data.lag;
					var address = data.address;
					
					console.log(lat);
					console.log(lag);

					/* 지도 */
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(lag, lat),
						zoom : 16
					});

					/* 유저 마커 */
					var markerOptions = {
						position: new naver.maps.LatLng(lag, lat),
					    map: map,
					    icon: {
					    	

					    	
					        content: [	
						        		`<div onmouseover="$('#ad1').show();" onmouseout="$('#ad1').hide();" >` +
							        		`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
							        		`<div id="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
							        		background-color:#88C9F2; color:white; text-align:center; border:1px;
							        		border-radius:14px; opacity:75%; display:none;">평점:4.0 <br> 주소: 수내3동</div>`+
						        		`</div>`
					        	
					        	].join(''),
					        	
					        size: new naver.maps.Size(22, 35),
					        anchor: new naver.maps.Point(15, 35)
					    },
					    animation: naver.maps.Animation.BOUNCE
					};
					var marker = new naver.maps.Marker(markerOptions);


					var data = {
						lat : lat,
						lag : lag,
						address : address
					}

					$.ajax({

						type : 'post',
						url : '${appRoot}/test/test3',
						data : JSON.stringify(data),
						contentType : "application/json",
						success : function(list) {
							console.log(list);
							
							/* 집주변 빨래방 마커 */
						for(let address of list ){
							
							let laundrymarker = {
									position: new naver.maps.LatLng(address.lag, address.lat),
								    map: map,
								    icon: {
								        content: [	
									        		`<div onmouseover="$(this).find('.ad2').show();" onmouseout="$(this).find('.ad2').hide();">` +
										        		`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
										        		`<div class="ad2"  style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
																        		  background-color:#88C9F2; color:white; text-align:center; border:1px;
																        	  	  border-radius:14px; opacity:75%; display:none">평점:4.0<br> 주소: \${address.address} </div>`+                   
									        		`</div>`
												 ].join('')
								        	
								       /*  size: new naver.maps.Size(22, 35),
								        anchor: new naver.maps.Point(15, 35)  */
								    }
								};
								 let marker = new naver.maps.Marker(laundrymarker);
						
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
<p style="font-family: 'GongGothicMedium';">안녕하세요 반가워용 </p>
</body>
</html>