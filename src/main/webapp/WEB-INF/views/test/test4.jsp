<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>ajax로 사진 업로드</title>
<script type="text/javascript">


$(function() {
	$("#btn1").click(function() {
		console.log("여기가능1");
		var form = new FormData();
		form.append("file1", $("#file1")[0].files[0] );
		console.log(form);
	/* 	var b2bid = $("#b2bid").val();
		var introduce = $("#introduce").val();
		data = {
				b2bid = b2bid
				introduce = introduce
			}
		 */
		
		$.ajax({
			type : "post",
			url : "${appRoot}/test/registrerImg",
			data: form ,
			enctype : "multipart/form-data",
			processData : false,
			contentType : false,
			cache: false,
			success: function() {
				console.log("성공");
			},
			error: function() {
				console.log("실패");
			}
				
			
		})
	})
})

</script>
</head>
<body>
	<div class="container">
		<div class="form-group ">
			<label for="b2bid">b2bid (*회원정보에서 확인해주세요)</label> <input type="text"
				class="form-control" id="b2bid" value="3">
		</div>
		<form  action="${appRoot}/test/registrerImg" method="post">
		<label for="introduceImage">홍보배너이미지</label>
		<input type="file" accept="image/*" class="form-control" id="file1">
		</form>
		<div class="form-group">
			<label for="introduce">가게 홍보 멘트</label>
			<textarea class="form-control" id="introduce" style="height: 400px"></textarea>
		</div>
		<button type="submit" id="btn1">버튼</button>
	</div>


</body>
</html>