<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
    <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
	
<script type="text/javascript">

	$(function() {
		$("#btn1").click(function(e) {
			e.preventDefault();
			var postcode = $("#sample6_postcode").val();
			var address = $("#sample6_address").val();
			var detailAddress = $("#sample6_detailAddress").val();
			var extraAddress = $("#sample6_extraAddress").val();
			
			naver.maps.Service.geocode({
		        query: address // String 타입의 주소값
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            // 실행이 되지 않을 경우 
                    return alert('Something wrong!');
                    
		        }
		        var result = response.v2,
		        items = result.addresses;

		        var lat = parseFloat(items[0].x);
		        var lag = parseFloat(items[0].y);
		        
		        console.log(lat);
		        console.log(lag);
			
				var data = {
					postcode : postcode,
					address : address,
					detailAddress : detailAddress,
					extraAddress : extraAddress,
					lat : lat,
					lag : lag
					
				}
				$.ajax({
					type : "post",
					url : "${appRoot}/subs/register",
					data : JSON.stringify(data),
					contentType : "application/json",
					success : function() {
						console.log("성공");
					},
					error : function() {
						console.log("실패");
					}
				})
				
				
		    });	
		})
	})
</script>

<!-- 주소록 검색 카카오api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
						
						console.log(addr);
						
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */						
/* addr을 위경도로 전환 후 주변 빨래방 정보 갖고오기 */
					
						/* 주소 위경도 전환 코드 */
						naver.maps.Service.geocode({
						        query: addr // String 타입의 주소값
						   		 }, function(status, response) {
							        if (status !== naver.maps.Service.Status.OK) {
							            // 실행이 되지 않을 경우 
					                    return alert('Something wrong!');
				                    
						         }
							        
						        var result = response.v2,
						        items = result.addresses;
				
						        var lat = parseFloat(items[0].x);
						        var lag = parseFloat(items[0].y);
						        
						        console.log(lat);
						        console.log(lag);
						        
						
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */							
/* 고객 주변 빨래방(b2b) 보여주기 (2개) */
						
					/* 지도 1번 */
					var map = [];
						map.push(new naver.maps.Map('map1', {
							center : new naver.maps.LatLng(lag, lat),
							zoom : 15
						}));
									
					 /* 지도2번 */
						map.push(new naver.maps.Map('map2', {
							center : new naver.maps.LatLng(lag, lat),
							zoom : 15
						}));
						
					/* 1번 유저 마커 */
					var markerOptions = {
						position: new naver.maps.LatLng(lag, lat),
					    map: map[0],
					    icon: {
				    	
				    	
				    	
				        content: [	
					        		`<div onmouseover="$(this).find('.ad1').show();" onmouseout="$(this).find('.ad1').hide();">` +
						        		`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
						        		`<div class="ad1" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
						        		background-color:#88C9F2; color:white; text-align:center; border:1px;
						        		border-radius:14px; opacity:75%; display:none">평점:4.0 <br> 주소: \${addr}</div>`+
					        		`</div>`
				        	
				        	].join(''),
				        	
				        size: new naver.maps.Size(22, 35),
				        anchor: new naver.maps.Point(15, 35)
				    }
				   
				};
				var marker = new naver.maps.Marker(markerOptions);

				
					/* 2번 유저마커*/
					var markerOptions = {
						position: new naver.maps.LatLng(lag, lat),
					    map: map[1],
					    icon: {
					    	
					    	
					    	
					        content: [	
						        		`<div onmouseover="$(this).find('.ad2').show();" onmouseout="$(this).find('.ad2').hide();">` +
							        		`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
							        		`<div class="ad2" style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
							        		background-color:#88C9F2; color:white; text-align:center; border:1px;
							        		border-radius:14px; opacity:75%; display:none">평점:4.0 <br> 주소: \${addr}</div>`+
						        		`</div>`
					        	
					        	].join(''),
					        	
					        size: new naver.maps.Size(22, 35),
					        anchor: new naver.maps.Point(15, 35)
					    }
					    
					};
					var marker = new naver.maps.Marker(markerOptions);
								
						      /* 집 주변 빨래방 정보 갖고오기 */  
					        var data = {
									lat : lat,
									lag : lag,
									address : addr
										}
									
						       $.ajax({
						        	type : 'post',
						        	url : '${appRoot}/test/test3',
									data : JSON.stringify(data),
									contentType : "application/json",
									success : function(list) {
										console.log(list[0].address);
										
										
										var i;
										for(i = 0; i < list.length; i++) {
											
										
										/* 1번 추천 빨래방 마커 */
										let laundrymarker = {
												position: new naver.maps.LatLng(list[i].lag, list[i].lat),
											    map: map[i],
											    icon: {
											        content: [	
												        		`<div onmouseover="$(this).find('.ad2').show();" onmouseout="$(this).find('.ad2').hide();">` +
													        		`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
													        		`<div class="ad2"  style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
																			        		  background-color:#88C9F2; color:white; text-align:center; border:1px;
																			        	  	  border-radius:14px; opacity:75%; display:none">평점:4.0<br> 주소: \${list[i].address} </div>`+                   
												        		`</div>`
															 ].join('')		
															 /*  size: new naver.maps.Size(22, 35),
														        anchor: new naver.maps.Point(15, 35)  */
														    },
														    animation: naver.maps.Animation.BOUNCE
													};
														 let marker = new naver.maps.Marker(laundrymarker);
										}
													 
										/* 2번 추천 빨래방 마커 */
										/* let laundrymarker2 = {
												position: new naver.maps.LatLng(list[1].lag, list[1].lat),
												map: map2,
												icon: {
													content: [	
																`<div onmouseover="$(this).find('.ad2').show();" onmouseout="$(this).find('.ad2').hide();">` +
																	`<div><img src="${imgRoot}icon/blue_re-pict-house-base.png_32.png"></div>`+
																	`<div class="ad2"  style="padding-top:5px; padding-bottom:5px; padding-left:5px; padding-right:5px;
																							  background-color:#88C9F2; color:white; text-align:center; border:1px;
																							  border-radius:14px; opacity:75%; display:none">평점:4.0<br> 주소: \${list[1].address} </div>`+                   
																`</div>`
															 ].join('')
															        	
															       /*  size: new naver.maps.Size(22, 35),
															        anchor: new naver.maps.Point(15, 35)  */
															  /*   },
															    animation: naver.maps.Animation.BOUNCE
															};
														 let marker2 = new naver.maps.Marker(laundrymarker2);  */
					       	}
								
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */	
										
						/* addr의 %ㅁㅁ시% or %ㅁㅁ군% 본사 정보 한개 갖고오기 */
						
						/* 정보 없으면 "고객님 도시에는 본사가 없습니다" 멘트 */
						
						/* 그외 위경도 반경 5km 이내 빨래방 정보 갖고와 보여주기 (가게 이름+주소+평점)*/
						
									
							 })
						})
					}
				}).open();
	}
				
</script>
</head>

<body>




	<!-- 주소 input창 -->
	<div style="margin: 0 auto">
		<h>구독할때 자기 집<h>
		<form>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()"
				value="우편번호 찾기"><br> <input type="text"
				id="sample6_address" placeholder="주소"><br> <input
				type="text" id="sample6_detailAddress" placeholder="상세주소"> <input
				type="text" id="sample6_extraAddress" placeholder="참고항목">

			<button type="submit" id="btn1">구독</button>
		</form>
	</div>



	<div id="map1" style="width: 50%; height: 400px;"></div>
	<div id="map2" style="width: 50%; height: 400px;"></div>
	<div id="map3" style="width: 50%; height: 400px;"></div>

</body>
</html>