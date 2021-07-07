<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">

	<!-- spring security test -->
 <div>
<!-- principal은 로그인이 됬을 때, 객체를 갖고 오는거라  access="isAuthenticated()" 로 '로그인됬을때' 라는 조건 부여-->
<sec:authorize access="isAuthenticated()">
						<!-- principal = CustomUser의 Membervo -->
	<sec:authentication property="principal" var="pinfo"/>
	${pinfo.member.userid } <br>
	${pinfo.member.userpw } <br>
	${pinfo.member.userName } <br>
</sec:authorize>

<!-- 로그아웃 됬을 때 =>> String-->
<sec:authorize access="!isAuthenticated()">
						<!-- principal = CustomUser의 Membervo -->
	<sec:authentication property="principal" var="pinfo"/>
	${pinfo }
</sec:authorize>
</div> 

</div>
</body>
</html>






