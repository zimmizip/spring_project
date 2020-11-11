<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/writeUploadForm.css">
</head>


<div class="w3-container">
	<br>

	<form method="post" name="writeform" enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/board/writeUploadPro">
		<input type="hidden" name="num" value="${num }"> <input
			type="hidden" name="ref" value="${ref }"> <input
			type="hidden" name="re_step" value="${re_step }"> <input
			type="hidden" name="re_level" value="${re_level }">
		<table class="type09">

			<h2>게시글 작성</h2>
			<tbody>
				<tr class="name">
					<th align="center">작 성 자</th>
					<td><input type="text" size="38" maxlength="10" name="writer" value=${name } disabled></td>
				</tr>
				<tr class="subject">
					<th align="center">제 목</th>
					<td><c:if test="${num == 0 }">
							<input type="text" size="38" maxlength="50" name="subject">
						</c:if> <c:if test="${num != 0 }">
							<input type="text" size="38" maxlength="50" name="subject"
								value="[답글]">
						</c:if></td>
				</tr>

				<tr>
					<th>내 용</th>
					<td><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>

					<td width="70" align="center">file</td>
					<td width="330"><input type="text" id="fileName"
						class="file_input_textbox" readonly="readonly">

						<div class="file_input_div">

							<input type="button" value="파일선택" class="file_input_button">

							<input type="file" name="uploadfile" class="file_input_hidden"
								onchange="javascript:document.getElementById('fileName').value = this.value.split('\\')[this.value.split('\\').length-1]">
						</div></td>
				</tr>
			
				
			
			</tbody>
		</table>
		<br />
		<br />

		<div class="button">
			<input type="submit" value="글쓰기"> <input type="reset"
				value="다시작성"> <input type="button"  class="look" value="목록보기"
				OnClick="window.location='<%=request.getContextPath()%>/board/list'">
		</div>
		<input type="hidden" name="passwd" value="1111">
	</form>
</div>


    

</html>
