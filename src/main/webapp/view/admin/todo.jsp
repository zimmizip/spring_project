<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>To do</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<label class="logo"><strong>To do</strong></label>
								</header>
						</div>
						<!-- content 시작 -->
						<div style = "margin-left: 75px; padding-top: 10px; margin-right: 70px;">
								<form method="post" action="#">
									<div class="row gtr-uniform">
										<div class="col-12">
											<textarea name="demo-message" id="demo-message" placeholder="할일을 적으세요" rows="6"></textarea>
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
					<!-- content 끝 -->
					</div>
				<!-- Main 끝 -->
