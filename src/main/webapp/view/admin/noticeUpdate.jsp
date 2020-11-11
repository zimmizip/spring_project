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
		function notiUpdate() {
				var num = "${noti.num}";
				var title = $('#title').val();
				var content = $('#content').val();
				$.ajax({
					type: 'POST',
					url: 'notiUpdateFix',
					data: {
						num: num,
						title: title,
						content: content
					},
					success: function(result) {
						if(result == -1) {
							alert("DB오류");
						} else {
							alert("수정 완료.");
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
									<label class="logo"><strong>공지 사항</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 55px; padding-top: 10px; margin-right: 55px;">
						  <table class="w3-table-all w3-margin-top">
						    <tr>
						      <td style = "text-align: center;"><strong>공지 번호</strong></td>
						      <td>${noti.num }</td>
						      <td style = "text-align: center;"><strong>공지 날짜</strong></td>
						      <td>${noti.day }</td>
					        </tr>
						    <tr>
						    	<td style = "text-align: center;" colspan = "4"><strong>제목</strong></td>
					    	</tr>
					    	<tr>
						    	<td style = "text-align: center;" colspan = "4">
						    		<input type = "text" id = "title" name = "title" value = "${noti.title }" />
						    	</td>
					    	</tr>
					    	<tr>
						    	<td style = "text-align: center;" colspan = "4"><strong>내용</strong></td>
					    	</tr>
				    		<tr>
						    	<td style = "height: 350px;" colspan = "4">
						    		<textarea id = "content" name = "content" rows="6">${noti.content }</textarea>
					    		</td>
					    	</tr>
						    <tr>
							  <td style = "text-align: center;" colspan = "4">
								<input class = "primary" type = "button" value = "수정" onclick = "notiUpdate()"/>
								<input class = "primary" type = "button" value = "나가기" onclick = "window.close()">
							  </td>
							</tr>
						  </table>
						</div>
					</div>