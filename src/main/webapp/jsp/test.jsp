<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		var a = $("#form").attr("action");
		$("#input").val(a);
	})

</script>

<script>

function on123() {
	
    window.open(http://api.coolsms.co.kr/sendmsg?user=tester01&password=tester01&to=01077030500&from=01077030500&text=HELLO)
	
}
</script> 

<script type="text/javascript">
$(function() {
	$(".btn123").click(function() {
	let abc = $("#select1 option:selected").val();
	console.log(abc);
		
	})
})
</script>
</head>
<body>
<select id="select1">
	<option value="">--</option>
	<option value="name">name</option>
	<option value="address">address</option>
</select>
<button class="btn123">찾기</button>

<button  onclick="on123()">ㅎㅇ</button>


</body>
</html>






