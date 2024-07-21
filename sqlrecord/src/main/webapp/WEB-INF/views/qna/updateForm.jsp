<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>수정하기</title>
<style>
#qna-update-container {
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	.
	card-body
	{
	padding
	:
	20px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-control, .form-control-file, select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea.form-control {
	resize: none;
}

.file-list {
	margin-top: 10px;
}

.file-list ol {
	padding-left: 20px;
}

.file-list li {
	list-style: decimal;
	margin-bottom: 10px;
}

.file-list a {
	color: #007bff;
	text-decoration: none;
}

.file-list a:hover {
	text-decoration: underline;
}

.fileDelBtn {
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
}

.fileDelBtn:hover {
	background-color: #c82333;
}

.button, .btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 4px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
}

.button {
	background-color: #ff52a0;
	color: white;
	border: 0;
	opacity: 0.8;
}

.button:hover {
	opacity: 1;
}

.btn {
	background-color: red;
	color: white;
	border: 0;
	opacity: 0.8;
}

.btn:hover {
	opacity: 1;
}
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../searchHeader.jsp"%>
	<div id="qna-update-container">


		<form id="updateForm" method="post" action="${hpath }/qna/update.do"
			enctype="multipart/form-data">
			<div class="card-body">
				<input type="hidden" id="fileNoDel" name="fileNoDel" value="" /> <input
					type="hidden" id="qnaNo" name="qnaNo" value="${qna.qnaNo }" />
				<div class="form-group">
					<label for="qnaTitle">제목</label> <input type="text"
						class="form-control" id="qnaTitle" name="qnaTitle"
						value="${qna.qnaTitle}" required>
				</div>
				<div class="form-group">
					<label for="qnaCategory">분류</label> <select class="form-control"
						id="qnaCategory" name="qnaCategory">
						<option value="general"
							<c:if test="${qna.qnaCategory == 'general'}">selected</c:if>>일반</option>
						<option value="event"
							<c:if test="${qna.qnaCategory == 'pay'}">selected</c:if>>결제</option>
						<option value="service"
							<c:if test="${qna.qnaCategory == 'service'}">selected</c:if>>서비스</option>
						<option value="etc"
							<c:if test="${qna.qnaCategory == 'etc'}">selected</c:if>>기타</option>
					</select>
				</div>
				<div class="form-group">
					<label for="secret">비밀글</label> <input type="checkbox" id="secret"
						name="secret" data-switchval
						<c:if test="${qna.secret == 'Y'}">checked</c:if> />
				</div>
				<label for="files">파일 변경하기</label>
				<div id="files" class="file-list">
					<c:if test="${not empty qna.files}">
						<ol type="1">
							<c:forEach var="file" items="${qna.files}">

								<li>파일:</li>
								<div>
									<a href="${path0}/${file.changedName}"
										download="${file.originalName}">
										${fn:escapeXml(file.originalName)} </a>
									<button type="button" class="fileDelBtn"
										value="${file.nfileNo}">삭제</button>
								</div>
							</c:forEach>
							<c:if test="${fn:length(qna.files) < 3}">
								<c:forEach var="i" begin="${fn:length(qna.files)}" end="2">
									<li>파일:</li>
									<input type="file" class="form-control-file border"
										name="updatefile" />
								</c:forEach>
							</c:if>
						</ol>
					</c:if>
					<c:if test="${empty qna.files}">
						<input type="file" class="form-control-file border"
							name="updatefile" />
						<input type="file" class="form-control-file border"
							name="updatefile" />
						<input type="file" class="form-control-file border"
							name="updatefile" />
					</c:if>
				</div>
				<div class="form-group">
					<label for="qnaContent">내용</label>
					<textarea class="form-control" rows="5" id="qnaContent"
						name="qnaContent" style="resize: none;" required>${qna.qnaContent}</textarea>
				</div>
				<a class=" button btn" href="${path0}/sqlrecord/qnas"
					style="background-color: #ff52a0; height: 40px; color: white; border: 0; opacity: 0.8">닫기</a>
				<button type="submit" class="btn"
					style="background-color: red; height: 40px; color: white; border: 0; opacity: 0.8">작성하기</button>
			</div>
		</form>


	</div>

	<script>
		var fileNoArry = [];

		$(document).on('click', '.fileDelBtn', function() {
			var fileNo = $(this).val();
			fileNoArry.push(fileNo);
			$('#fileNoDel').val(fileNoArry.join(',')); // Join array as comma-separated string
			$(this).parent().remove();
			console.log($('#fileNoDel').val());
		});
	</script>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>

</body>
</html>
