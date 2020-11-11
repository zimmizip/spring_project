<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>결재 완료</title>
</head>
	<style class ="text/css">
		#myTable:hover tr:hover td {
			    background: #003366;
			    color: white; }
	</style>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<label class="logo"><strong>결재 완료</strong></label>
								</header>
						</div>
						<div class="w3-container" style = "margin-left: 73px; margin-right: 73px; padding-top: 10px; ">
						  <table class="w3-table-all w3-margin-top" id="myTable">
						    <tr>
						      <th style = "width: 100px; text-align: center">번호</th>
						      <th style = "text-align: center;">작성자 이메일</th>
						      <th style = "text-align: center;">제목</th>
						      <th style = "text-align: center;">날짜</th>
						      <th style = "text-align: center;">상태</th>
						    </tr>
						  	<c:forEach   var = "docu"  items = "${docu_finishList}">
							    <tr onclick = "window.open('approval_content?num=${docu.num }','','width=700,height=800,location=no,status=no,scrollbars=yes');">
							      <td style = "text-align: center;">${docu.num }</td>
							      <td style = "text-align: center;">${docu.email }</td>
							      <td style = "text-align: center;">${docu.title }</td>
							      <td style = "text-align: center;">${docu.day }</td>
							      <td style = "text-align: center;">${docu.approval }</td>
							    </tr>
						    </c:forEach>
						  </table>
						</div>
					</div>
				<!-- Main 끝 -->
