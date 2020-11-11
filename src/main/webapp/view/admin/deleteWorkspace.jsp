<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>워크스페이스 삭제</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type = "text/javascript">
		function deleteWorkspace() {
			var email = "${admin.EMAIL}";
			var password = "${admin.PASSWORD}";
			var pwdCheck = $('#pwCheck').val();
			if(password == pwdCheck) {
				$.ajax({
					type: 'POST',
					url: 'deleteWorkspacePro',
					data: {email: email},
					success: function(result) {
						if(result == -1) {
							alert("DB오류");
						} else {
							alert("워크스페이스가 삭제 되었습니다.");
							window.opener.location.href = "<%=request.getContextPath()%>/main/main";
							self.close();
						}
					}
				});
			} else {
				alert("비밀번호를 확인하세요");
			}
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
									<label class="logo"><strong>워크스페이스 삭제</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 55px; padding-top: 10px; margin-right: 55px;">
						  <table class="w3-table-all w3-margin-top">
						    <tr>
						      <td style = "text-align: center;"><strong>워크스페이스 명 </strong></td>
						      <td>${workspace }</td>
					        </tr>
					        <tr>
						      <td style = "text-align: center;"><strong>관리자 비밀번호</strong></td>
						      <td><input type = "password" id = "pwCheck"></td>
					      	</tr>
						    <tr>
							  <td style = "text-align: center;" colspan = "2">
								<input class = "primary" type = "submit" value = "워크스페이스 삭제" onclick = "deleteWorkspace()"/>
								<input class = "primary" type = "button" value = "나가기" onclick = "window.close()">
							  </td>
							</tr>
						  </table>
						</div>
					</div>