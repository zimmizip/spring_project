<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script type = "text/javascript">
		function copyToClipboard(element) {
			var $temp = $("<input>");
			$("body").append($temp);
			$temp.val($(element).text()).select();
			document.execCommand("copy");
			$temp.remove();
			alert("복사되었습니다.");
		}
	</script>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<a href = "admin"><h2>관리자 페이지</h2></a>
									</header>
									<ul>
										<li>
											<span class="opener"><strong>워크스페이스 멤버</strong></span>
											<ul>
												<li><a href="admin">멤버 관리</a></li>
												<li><a href="commute">근태 관리</a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><strong>워크스페이스 관리</strong></span>
											<ul>
												<li><a href="notice">공지 사항</a></li>
												<!-- <li><a href="todo">to do</a></li> -->
											</ul>
										</li>
										<li>
											<span class="opener"><strong>전자 결재</strong></span>
											<ul>
												<li><a href="approval_wait">결재 대기</a></li>
												<li><a href="approval_finish">결재 완료</a></li>
											</ul>
										</li>
										<li><a href="deleteWorkspace"><strong>워크 스페이스 삭제</strong></a></li>
									</ul>
									<div class="w3-container">
									  <button style = "margin: 70px;" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">초대 코드</button>
									  
									  <div id="id01" class="w3-modal">
									    <div class="w3-modal-content w3-animate-top w3-card-4">
									      <header style = "background-color: #003366;"> 
									        <span onclick="document.getElementById('id01').style.display='none'" 
									        class="w3-button w3-display-topright">&times;</span>
									        <h2 style = "height: 40px; text-align: center; color: white;">초대 코드</h2>
									      </header>
									      <div class="w3-container">
									        <span>초대코드는 </span>
									        <p id="p1" style = "display: inline;"><strong>${Wcode }</strong></p> 입니다.
									        <span><button type = "button" style = "margin-top: -10px; float: right;" onclick="copyToClipboard('#p1')">초대코드 복사</button></span>
									      </div>
									    </div>
									  </div>
									</div>
								</nav>
						</div>
					</div>
			</div>

			<!-- Scripts -->
			<script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/browser.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/breakpoints.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/util.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/main.js"></script>

	</body>
</html>