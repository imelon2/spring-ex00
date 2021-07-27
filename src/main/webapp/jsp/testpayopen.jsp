<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
function payPage() {
	var url = "${appRoot}/jsp/paytest.jsp";
	var name = "결제시스템 테스트";
	 var option = "width = 800, height = 700, top = 100, left = 200, location = no";
	 
	window.open( url, name, option );
}

</script>


</head>
<body>
<div class="container">
<input type="button" onclick="payPage()" value="결제하기">
</div>


</body>
</html>