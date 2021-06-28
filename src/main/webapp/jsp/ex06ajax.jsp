<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<script>
		$(function() {
			$("#btn1").click(function() {
				console.log("click btn1");
				$.ajax("${appRoot}/rest06/sub01");
			});
			
			$("#btn11").click(function() {
				$.ajax({
					url: "${appRoot}/rest06/sub01"
					});
				});
			});

	</script>
	<button id="btn1">버튼1</button>
	<button id="btn11">버튼1-1</button>
	
	<script>
	$(function() {
		$("#btn2").click(function() {
			var jqXHR = $.ajax("${appRoot}/rest06/sub02");	
			jqXHR.done(function(data) {
				console.log("btn2 done function");
				console.log(data);
			});
		});
	});
	
	</script>
	<button id="btn2">버튼2</button>
</div>

<script>
$(function() {
	$("#btn3").click(function() {
		$.ajax("${appRoot}/rest06/sub02").done(function(data) {
			console.log("btn3 done function");
			console.log(data);
		});
	});
	$("#btn31").click(function() {
		$.ajax({
			
		url: "${sppRoot}/rest06/sub02",
		success : function (res) {
			console.log(res);
			}	
		})
	});
});


</script>
<button id="btn3">버튼3</button>
<button id="btn31">버튼3-1</button>



<script>
$(function() {
	$("#btn4").click(function() {
		$.ajax("${appRoot}/rest06/sub04").done(function(data) {
			console.log("성공!!!");
		})
		.fail(function() {
			console.log("실패!!!");
		});
	});
	
	$("#btn41").click(function() {
		$.ajax({
			url : "${appRoot}/rest06/sub04",
			error: function() {
				console.log("실패!!! btn4-1")
			}
		});
	});
});
</script>
<button id="btn4">버튼4</button>
<button id="btn41">버튼4-1</button>

<script>
	$(function() {
		$("#btn5").click(function() {
			$.ajax({
				url : "${appRoot}/rest06/sub05",
				type: "POST"
			});
		});
	});
</script>
	
	<button id="btn5">버튼5</button>

</body>
</html>