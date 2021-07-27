<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>구독페이지</title>
</head>
<style>
.col {
	width: 100%;
	margin-bottom: 30px;
	text-align: center;
	margin-top: 40px;
	display: inline-block;
}

.box1 {
	width: 15%;
	display: inline-block;
	border: 1px solid #bbb;
	height: 500px;
	margin: 2.5%;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-color: rgba(223, 225, 229, 0);
}

.box1:hover {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.box {
	width: 20%;
	display: inline-block;
	border: 1px solid #bbb;
	height: 700px;
	margin: 2.5%;
	box-shadow: 0px 0px 6px 10px rgb(32 33 36/ 28%);
	border-color: rgba(223, 225, 229, 0);
}

.text1 {
	margin-top: 30px;
	font-size: 32px;
}

.box:hover {
	box-shadow: 0px 0px 6px 10px #B4DDF5;
}

.box_sub1 {
	display: block;
	height: 33.33%;
	width: 100%;
	border: 1px solid #bbb;
}

.box_sub2 {
	display: block;
	height: 33.33%;
	width: 100%;
	border: 1px solid #bbb;
	text-align: left;
}

.box_sub3 {
	display: block;
	height: 33.33%;
	width: 100%;
	border: 1px solid #bbb;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".box1").click(function() {
			let oneFamily = $("#ex1").text();
			console.log(oneFamily);

		})
	})
</script>
<body>
	<div class="wrapper">
		<div class="col">
			<div class="title" style="text-align: center;">구독 종류 선택</div>
			<div class="box1" id="ex2" style="">
				<div id="ex1" class="text1">1인 가구</div>
			</div>
			<div class="box1">
				<div class="text1">2인 가구</div>
			</div>
			<div class="box1">
				<div class="text1">4인 가구</div>
			</div>
		</div>
		<div class="col">
			<div class="title" style="text-align: center;">빨래방 선택</div>
		</div>
		<div class="col">
			<div class="box">
				<div class="box_sub1">사진</div>
				<div class="box_sub2">
					가게이름: <br> 주소: <br> 번호: <br> 평점: <br>
				</div>
				<div class="box_sub3">지도</div>
			</div>
			<div class="box">
				<div class="box_sub1">사진</div>
				<div class="box_sub2">
					가게이름: <br> 주소: <br> 번호: <br> 평점: <br>
				</div>
				<div class="box_sub3">지도</div>
			</div>
			<div class="box">
				<div class="box_sub1">사진</div>
				<div class="box_sub2">
					가게이름: <br> 주소: <br> 번호: <br> 평점: <br>
				</div>
				<div class="box_sub3">지도</div>
			</div>
			<div class="title" style="text-align: center;">원하는 빨래방 검색</div>
		</div>

		<div class="col">
			<div class="title" style="text-align: center;">결제하기</div>
		</div>

	</div>


</body>
</html>