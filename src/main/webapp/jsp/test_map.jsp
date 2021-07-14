<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
</head>
<body>
<div id="map" style="width:50%;height:400px;"></div>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(36.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>
</body>
</html>