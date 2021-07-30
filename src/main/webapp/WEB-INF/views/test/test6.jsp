<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>홍보 사이트 테스트1</title>
</head>
<script type="text/javascript">
$(function() {
	$("#testbtn").click(function() {
		
	
	let data = {
			bno : 2
	}
	$.ajax({
		type: "POST",
		url: "${appRoot}/test/test6",
		data: data,
		success : function(data) {
			console.log(data);
			let url = "${appRoot}/test/test7/" + data.bno
			console.log(url);
			 var name = "결제시스템 테스트";
			 var option = "width = 800, height = 700, top = 100, left = 200, location = no";
			window.open(url, name, option); 
			},
			error : function() {
				console.log("실패");
			}
		})
	})
}) 
</script>
<body>
<div class="container">
<%-- <form action="${appRoot }/test/test6" method="post"> --%>
			<a href="${appRoot }/test/test7">dd</a>
			<input name="bno">
			<button id="testbtn" type="submit" value="작성">test</button>
			
	<!-- 	</form> -->
</div>


</body>
</html>