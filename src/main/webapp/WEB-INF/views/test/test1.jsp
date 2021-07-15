<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title> 주소 갖고와서 위경도 변환</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>

</head>

<body>

<div id="map" style="width:100%;height:400px;"></div>


<script type="text/javascript">

$(function() {
		/* 데이터(주소) 갖고오기 */
		$.ajax({
			type : 'post',
			url : '${appRoot}/test/test1',
			datatype : 'json',
			success : function(data) {
				var address = data;
				console.log(address)
				

				naver.maps.Service.geocode({
			        query: address // String 타입의 주소값
			    }, function(status, response) {
			        if (status !== naver.maps.Service.Status.OK) {
			            // 실행이 되지 않을 경우 
	                    return alert('Something wrong!');
	                    
			        }
			        var result = response.v2,
			        items = result.addresses;
	
			        var x = parseFloat(items[0].x);
			        var y = parseFloat(items[0].y);
			        
			        console.log(x);
			        console.log(y);
			        
			        /* 지도 */
			        var map = new naver.maps.Map('map', {
			    	    center: new naver.maps.LatLng(y, x),
			    	    zoom: 19
			    	});
					/* 본인 집 마크 */
			        var marker = new naver.maps.Marker({
			            position: new naver.maps.LatLng(y, x),
			            map: map
			            
			       
			            
			        });
			        
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