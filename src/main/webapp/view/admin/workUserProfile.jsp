<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
		function deleteUser() {
			var email = "${user.email}";
			$.ajax({
				type: 'POST',
				url: 'deleteUser',
				data: {email: email},
				success: function(result) {
					if(result == -1) {
						alert("DB오류");
					} else {
						alert("회원이 삭제 되었습니다.");
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
									<label class="logo"><strong>${user.name }님의 정보</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 55px; padding-top: 10px; margin-right: 55px;">
						  <table class="w3-table-all w3-margin-top">
						    <tr>
						      <td style = "text-align: center;"><strong>이름</strong></td>
						      <td>${user.name }</td>
					        </tr>
					        <tr>
						      <td style = "text-align: center;"><strong>이메일</strong></td>
						      <td>${user.email }</td>
					      	</tr>
					      	<tr>
						      <td style = "text-align: center;"><strong>참가 날짜</strong></td>
						      <td>${user.userDate }</td>
						    </tr>
						    <tr>
						      <td style = "text-align: center;"><strong>등급</strong></td>
						      <td>${user.grade }</td>
						    </tr>
						    <tr>
							  <td style = "text-align: center;" colspan = "2">
							  	<c:choose>
							  		<c:when test="${user.grade eq '관리자 멤버' }">
										<input class = "primary" type = "button" value = "나가기" onclick = "window.close()">
							  		</c:when>
							  		<c:when test="${user.grade eq '일반 멤버' }">
										<input class = "primary" type = "submit" value = "회원 삭제" onclick = "deleteUser()"/>
										<input class = "primary" type = "button" value = "나가기" onclick = "window.close()">
							  		</c:when>
							  	</c:choose>
							  </td>
							</tr>
						  </table>
						</div>
					</div>