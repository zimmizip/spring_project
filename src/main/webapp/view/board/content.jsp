<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/content.css">

<title>게시판</title>
</head>

<body>
	<table class="type09">
		<h2>상세보기</h2>
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="*">
		</colgroup>

		<tbody>
			<tr class="first">
				<th>글번호</th>
				<td>${article.num }</td>
				<th>조회수</th>
				<td>${article.readcount }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${article.writer }</td>
				<th>작성시간</th>
				<td>${article.reg_date }</td>
			</tr>
			<tr class="sub">
				<th>제목</th>
				<td class="subject">${article.subject }</td>
				<c:if test="${article.filename == null }">
					<th>업로드파일명</th>
					<td>[파일이 없습니다.]
				</c:if>
				<c:if test="${article.filename != null }">
					<th>업로드파일명</th>
					<td>[${article.filename }]</td>
				</c:if>
			</tr>
			<tr class="content">

				<th class="th-content">내용</th>
				<td>${article.content }<img
					src="<%=request.getContextPath() %>/uploadFile/${article.filename }"
					alt="">
				</td>

				<th></th>
				<td></td>
			</tr>
		</tbody>
	</table>
	<br />
	<br />
	<br />

	<div class="button">
	<c:if test="${article.writer eq name }">
		<input type="button" class="btn2" value="수정하기"
			onclick="document.location.href='<%=request.getContextPath()%>/board/updateForm?num=${article.num }'">
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=request.getContextPath()%>/board/deletePro?num=${article.num }" class="btn4">글 삭제</a>
		<%-- <input type="button" class="btn4" value="글삭제"
			onclick="document.location.href='<%=request.getContextPath()%>/board/deletePro?num=${article.num }'"> --%>
	</c:if>
		<input type="button" class="btn3" value="목록보기"
			onclick="document.location.href='<%=request.getContextPath()%>/board/list'">
	</div>

	<div class="comment">
		<table class="table table-striped" style="text-align: center; overflow: scroll; border: 1px solid #AAAAAA;">
			<tbody>	
			
				<tr>
					<th
						style="background-color: #38448a; color: white; text-align: center;">작성자</th>
					<th
						style="background-color: #38448a; color: white; text-align: center;">댓글</th>
					<th
						style="background-color: #38448a; color: white; text-align: center;">작성
						시간</th>
				</tr> 
				<c:forEach var="comment" items="${commentList}">
					<tr>
						<td width="10%"
							style="word-wrap: break-word; vertical-align: middle;">${comment.name}</td>
						<td width="50%"
							style="word-wrap: break-word; vertical-align: middle;">${comment.comment_content}</td>
						<td width="40%"
							style="word-wrap: break-word; vertical-align: middle;">${comment.comment_date}
							<form method="post" action="<%=request.getContextPath()%>/board/deleteComment">
								<input type="hidden" name="comment_board" value="${article.num }"> 
								<input type="hidden" name="comment_num" value="${comment.comment_num }">
								 <c:if test="${comment.comment_id eq email}">
								 <input type="submit" value="삭제" class="del">
								 </c:if>
							</form>
 
						</td>
				</c:forEach>
		</table>
		<form method="post"
			action="<%=request.getContextPath()%>/board/writeComment" class="in">
			<input type="text" size="38" maxlength="50" name="comment_content">
			<input type="hidden" name="comment_board" value="${article.num }">
			<input type="submit" value="댓글작성" class="com">
		</form>
	</div>
</body>
</html>



