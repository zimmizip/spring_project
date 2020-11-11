<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list.css?ver=2">
</head>


<div class="over-flow-x:auto;">
	<span class="w3-center  w3-large">
	
		<h2>${workspace_name}  Board</h2><hr/>

	</span>	
	<div class="ccc">
	 <div class="go1">
	<p class="write">
	<a href="<%=request.getContextPath()  %>/main/workspace_main?workspace_name=${workspace_name}" class="oops">워크스페이스 이동  </a>
		<a href="<%= request.getContextPath() %>/board/writeUploadForm" class="go">글쓰기</a> <br/><br/>
	</p>
	</div>
			  <count>[&nbsp;Total: &nbsp;${count }&nbsp;] 개</count>
	<c:if test="${count == 0 }">
	
	<table class="w3-table-all" >
		<tr class="w3-grey">
			<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
	</table></div>
	
	
	</c:if>
	
	<c:if test = "${count != 0 }">
	
<table class="type09">
<thead>
<tr class="aa">
<th><span>번호</span></th>
<th><span>제목</span></th>
<th><span>작성자</span></th>
<th><span>작성일</span></th>
<th><span class="bb">조회수</span></th><thead>
</tr>
<c:set var = "number" value = "${number }"/>
		<c:forEach var = "article" items = "${ articleList}">
		<tr>
<td >${number }</td>
			<c:set var = "number" value = "${number-1 }"/>
			<td >
				
			<c:if test="${article.re_level > 0 }">
				<img src="<%=request.getContextPath() %>/images/re_jpg" width="${ 5 * article.re_level }" height="16"> 
				<img src="<%=request.getContextPath() %>/images/re.jpg" width="16" height="16">
			</c:if>
				
			<c:if test="${article.re_level == 0 }">
 				<img src="<%=request.getContextPath() %>/images/level.gif"
				width="0" height="16">
				</c:if>
			 	<a href="<%= request.getContextPath() %>/board/content?num=${article.num }"> ${article.subject }</a>
				<c:if test = "${article.readcount >= 20 }">
					<img src="<%=request.getContextPath() %>/images/hot.png" width="22x" height="12px">
				</c:if>
			</td>
			<td >${article.writer }</td>
			<td >${article.reg_date }</td>
			<td >${article.readcount }</td>
		</tr>
		</c:forEach>
		
</table>
	</c:if> <br/>
	<div class="now">
	
		<c:if test = "${startPage > bottomLine }">
		
		<a href="<%= request.getContextPath() %>/board/list?pageNum=${startPage - bottomLine }">[이전]</a>
		</c:if>
		
		<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
		
		<a href="<%= request.getContextPath() %>/board/list?pageNum=${i}">
 	<c:if test = "${i == currentPage }">
 		<font color='blue'>${i }</font></c:if>
 	<c:if test = "${i != currentPage }">
 		${i}</c:if> </a></c:forEach>
				<br/> <br/>
		<c:if test = "${endPage < pageCount }">
		<a href="<%= request.getContextPath() %>/board/list?pageNum=${startPage + bottomLine }">[다음]</a>
		</c:if>
	</div>
	<div>
		<div class="search" >
			<form name="searchForm" method="post">
				<select name="category" size="1"> 
				   <option value="writer">작성자</option>
					<option value="subject">제 목</option>
					<option value="content">내 용</option>
				</select> <input size="16" name="sentence">
				 <input type="submit" class="find" value="찾기">
			</form>
		</div>
	</div>
</div>
</body>
</html>