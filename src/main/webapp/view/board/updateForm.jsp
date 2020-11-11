<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/updateForm.css">
</head>


<div class="w3-container">
	<br>

	<form method="post" name="writeform" action="<%=request.getContextPath()%>/board/updatePro"
		enctype="multipart/form-data">
		<input type="hidden" name="num" value="${article.num }"> <input
			type="hidden" name="ref" value="0"> <input type="hidden"
			name="re_step" value="0"> <input type="hidden"
			name="re_level" value="0"> <input type="hidden"
			name="oldFile" value="${article.filename }">
		<table class="type09">

			<h2>게시글 수 정</h2>
			<tbody>
				<tr class="name">
					<th align="center">작 성 자</th>
					<td><input type="text" size="38" maxlength="10" name="writer"
						value=${name } disabled></td>
				</tr>
				<tr class="subject">
					<th align="center">제 목</th>
					<td><input type="text" size="38" maxlength="50" name="subject"
						value="${article.subject }"></td>
				</tr>

				<tr>
					<th>내 용</th>
					<td><textarea name="content" rows="13" cols="40">${article.content}</textarea></td>
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
		<br /> <br />

		<div class="button">
			<input type="submit" value="글쓰기"> <input type="reset"
				value="다시작성"> <input type="button" class="look" value="목록보기"
				OnClick="window.location='<%=request.getContextPath()%>/board/list'">
		</div>
	</form>
</div>

</html>
