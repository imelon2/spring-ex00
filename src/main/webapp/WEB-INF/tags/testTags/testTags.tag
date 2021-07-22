<%@ tag language="java" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" scope="request"/>
</sec:authorize>
	


<nav class="Tags">
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53f2oltjp5&submodules=geocoder"></script>
	<div id="map3" style="width: 50%; height: 400px;"></div>
	<script type="text/javascript">
$(function() {
	var userid = $("#test1").val();
	data= {
			userid : userid
	}
	
	$.ajax({
		type : "POST",
		url : "${appRoot}/tegsTest/teg1",
		data : data,
		success : function(list) {
			console.log(list);
		},
		erroe : function() {
			console.log("실패");
		}
	})
})

	</script>
	<p style="font-family: 'GongGothicMedium';">안녕하세요 반가워용</p>
	<input type="text" id="test1" value="won666"> 
	<input type="text" id="test2" value="">
	
	<h1>${pinfo.member.userid}</h1>
</nav>
</body>
</html>

