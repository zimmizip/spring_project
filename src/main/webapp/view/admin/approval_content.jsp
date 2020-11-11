<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type = "text/javascript">
		function docuPermit() {
			var num = "${docu.num}";
			$.ajax({
				type: 'POST',
				url: 'docuPermit',
				data: {num: num},
				success: function(result) {
					if(result == -1) {
						alert("DB오류");
					} else {
						alert("승인 완료.");
						opener.parent.location.reload();
						window.close();
					}
				}
			});
		}
		function docuCancel() {
			var num = "${docu.num}";
			$.ajax({
				type: 'POST',
				url: 'docuCancel',
				data: {num: num},
				success: function(result) {
					if(result == -1) {
						alert("DB오류");
					} else {
						alert("승인 취소.");
						opener.parent.location.reload();
						window.close();
					}
				}
			});
		}
	</script>
</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<label class="logo"><strong>결재 내용</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 55px; padding-top: 10px; margin-right: 55px;">
						  <table class="w3-table-all w3-margin-top">
						    <tr>
						      <td style = "text-align: center;"><strong>결재 번호</strong></td>
						      <td>${docu.num }</td>
						      <td style = "text-align: center;"><strong>이메일</strong></td>
						      <td>${docu.email }</td>
					        </tr>
					      	<tr>
						      <td style = "text-align: center;"><strong>제출 날짜</strong></td>
						      <td>${docu.day }</td>
						      <td style = "text-align: center;"><strong>상태</strong></td>
						      <td>${docu.approval }</td>
						    </tr>
						    <tr>
						    	<td style = "text-align: center;" colspan = "1"><strong>제목</strong></td>
						    	<td style = "text-align: center;" colspan = "3">${docu.title }</td>
					    	</tr>
					    	<tr>
						    	<td style = "text-align: center;" colspan = "4"><strong>내용</strong></td>
					    	</tr>
				    		<tr>
						    	<td style = "height: 350px;" colspan = "4">${docu.content }</td>
					    	</tr>
						    <tr>
							  <td style = "text-align: center;" colspan = "4">
							  	<c:choose>
							  		<c:when test="${docu.approval eq '대기' }"> <!-- eq는 == 와 같다 jstl의 비교연산자 -->
										<input class = "primary" type = "button" value = "승인" onclick = "docuPermit()"/>
							  		</c:when>
							  		<c:when test="${docu.approval eq '승인' }">
							  			<input class = "primary" type = "button" value = "승인 취소" onclick = "docuCancel()"/>
							  		</c:when>
							  	</c:choose>
								<input class = "primary" type = "button" value = "나가기" onclick = "window.close()">
							  </td>
							</tr>
						  </table>
						</div>
					</div>