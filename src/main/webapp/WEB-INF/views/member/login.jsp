<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
<bd:navbar />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 col-6">
				<h1>로그인</h1>   <!-- /member 안한 이유는 spring의 필터가 잡아줌 -->
				<form action="${appRoot }/login" method="post">
					<div class="form-group">
						<label for="input1">이름</label> 
						<input name="username" class="form-control" />
					</div>
					<div class="form-group">
						<label for="input2">패스워드</label> <input name="password"
							type="password" class="form-control" /> 
					</div>
					<input type="submit">
				</form>
			</div>
		</div>
	</div>


</body>
</html>