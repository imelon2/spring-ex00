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
<script>
	$(function() {
		$("#submit1").click(function(e) {
			/* form을 전송하면 뷰가 넘어가는데, 그걸 강제로 진행 안하게 함 */
			e.preventDefault();
			/* 첫클릭후 다시 클릭 x */
			$(this).attr("disabled", "disabled");
			$(this).html('<i class="fas fa-spinner fa-spin"></i>');
			/*input의 데이터를 jsp형식으로 꺼내오기  */
			var id = $("#input1").val();
			var age = $("#input2").val();
			
			var data = {id: id, age: age};
			/* 데이터 전송하기 */			
			$.post({
				url: "${appRoot}/rest10/add",
				data: data,
				success: function (data) {
					console.log(data);
					alert(data.id + "가 등록되었습니다");
					/* 클릭못하게 한거 다시 클릭할 수 있게 하기 */
					$("#submit1").removeAttr("disabled")
								 .html("전송");
					
				}
			})
		})
		
		// buuton2
		$("#button2").click(function() {
			$.get({
				url : "${appRoot}/rest10/list",
				success : function(list) {
					console.log(list);
					
									/* #table1 tbody<-이거 꼭 있어야함 규격임 */
					var table1body = $("#table1 tbody");
					/* empty안하면 반복분 했던게 그대로 남음 */
					table1body.empty();
					
					for (var i = 0; i < list.length; i++) {
						var tr = $(generateTableRow(list[i]));
						/*  선택한 요소의 내용 끝에 ( 컨텐츠 ) 추가 */
						table1body.append(tr);
					}
				}
			})
		})
		function generateTableRow(data) {
			return "<tr><td>"+ data.id + "<td/><td>"+ data.age + "<td/></tr>"
		}
		
		$("#like-button1").click(function() {
			var operation = $(this).attr("data-operation");
			var url ="${appRoot}/rest10/" + operation;
			
			
			$.post({
				url: url,
				success : function(data) {
						/* $("#like-icon1").removeClass("far").addClass("fas"); */
						$("#like-cnt1").text(data);
						if ( operation == "like") {
							$("#like-button1").attr("data-operation", "dislike");
							$("#like-icon1").removeClass("far").addClass("fas");
						} else {
							$("#like-button1").attr("data-operation", "like");
							$("#like-icon1").removeClass("fas").addClass("far");
						}
					}
				})
			})
		})
</script>
</head>
<body>
<div class="container">
<hr>
	<button id="like-button1" data-operation="like">
	<i id="like-icon1" class="far fa-thumbs-up"></i>
	<span id="like-cnt1">10</span></button>

<hr>
								<!--palceholder : input창에 미리보기  -->
		<input id="input1" name="id" placeholder="id">
		<input id="input2" name="age" placeholder="age">
		<!-- <input id="submit1" type="submit" value="전송"> -->
		<button id="submit1" >전송</button>
		
		<hr>
		
		<!-- 목록 가져오기  -->
		<button id="button2">목록보기</button>
		<table id="table1" class="table">
			<thead>
			<tr>
				<th>ID</th>
				<th>AGE</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
</div>
</body>
</html>






