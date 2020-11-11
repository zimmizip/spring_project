<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>공지사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script type = "text/javascript">
         function reload() {
            opener.parent.location.reload();
         }
      </script>
	</head>
	<style class ="text/css">
		#myTable:hover tr:hover td {
			    background: #003366;
			    color: white; }
	</style>
	<body class="is-preload" onunload = "reload()">
		
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
						<!-- content 시작 -->
						<div style = "margin-left: 75px; margin-right: 70px; padding-top: 10px;">
							<form method="post" action="noticePro">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<input type="text" name="title" id="subject" value="" placeholder="제목" />
									</div>
									<div class="col-12">
										<textarea name="content" id="demo-message" placeholder="공지 내용을 입력하세요." rows="6"></textarea>
									</div>
									<!-- Break -->
									<div class="col-12">
										<ul class="actions">
											<li><input type="submit" value="등록" class="primary" /></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<label class="logo"><strong>공지 사항 목록</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 73px; margin-right: 73px; padding-top: 10px; ">
						  <table class="w3-table-all w3-margin-top" id="myTable">
						    <tr>
						      <th style = "text-align: center">번호</th>
						      <th style = "width: 700px; text-align: center;">제목</th>
						      <th style = "text-align: center;">날짜</th>
						    </tr>
						    <c:forEach   var = "notice"  items = "${noticeList}">
							    <tr onclick = "window.open('noticeContent?num=${notice.num }','','width=700,height=800,location=no,status=no,scrollbars=yes');">
							      <td style = "text-align: center;">${notice.num }</td>
							      <td style = "text-align: center;">${notice.title }</td>
							      <td style = "text-align: center;">${notice.day }</td>
							    </tr>
						    </c:forEach>
						  </table>
						</div>
					<!-- content 끝 -->
					</div>
				<!-- Main 끝 -->
