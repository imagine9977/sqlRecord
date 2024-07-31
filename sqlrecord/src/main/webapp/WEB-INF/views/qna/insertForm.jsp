<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Home</title>
<style>
#insert-container {
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 800px;


.card-body {
    padding: 20px;
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
    height:50px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

textarea.form-control {
    resize: none;
}
#qnaContent{
	height: 300px;
}
.btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 4px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
}

.btn[type="reset"] {
    background-color: #ff52a0;
    color: white;
    border: 0;
    opacity: 0.8;
}

.btn[type="reset"]:hover {
    opacity: 1;
}

.btn[type="submit"] {
    background-color: red;
    color: white;
    border: 0;
    opacity: 0.8;
}

.btn[type="submit"]:hover {
    opacity: 1;
}
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../searchHeader.jsp"%>
	<div id="insert-container">
		

		<!-- 여기에 작성 -->
		<form id="enrollForm" method="post" action="${hpath }/qna/insert.do"
			enctype="multipart/form-data">
			<div class="card-body">
				<div class="form-group">
					<label for="qnaTitle">제목</label> <input type="text"
						class="form-control" id="qnaTitle" name="qnaTitle" value=""
						required> <label for="memberId">작성자 아이디</label> <input
						type="text" id="writer" class="form-control"
						value="${sessionScope.loginUser.memberId }" name="boardWriter"
						readonly> <input type="hidden" id="memberNo"
						class="form-control" value="${sessionScope.loginUser.memberNo }"
						name="memberNo">

				</div>
				<div class="form-group">
					<label for="qnaCategory">분류</label> <select class="form-control"
						id="qnaCategory" name="qnaCategory">
						<option value="general">일반</option>
						<option value="pay">결제</option>
						<option value="service">서비스</option>
						<option value="etc">기타</option>
					</select>
				</div>
				<label>비밀글 여부</label>
				<div class="form-check">
				
					<input class="form-check-input" type="radio"
						name="secret" id="secret1" value="Y"> <label
						class="form-check-label" for="secret1"> 네 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="secret" id="secret2" value="N" checked> <label
						class="form-check-label" for="secret2">아니요 </label>
				</div>
				<div class="form-group">
					<label for="upfile1">첨부파일1</label> <input type="file" id="upfile1"
						class="form-control-file border" name="upfile">
				</div>
				<div class="form-group">
					<label for="upfile2">첨부파일2</label> <input type="file" id="upfile2"
						class="form-control-file border" name="upfile">
				</div>
				<div class="form-group">
					<label for="upfile3">첨부파일3</label> <input type="file" id="upfile3"
						class="form-control-file border" name="upfile">
				</div>
				<div class="form-group">
					<label for="qnaContent">내용</label>
					<textarea class="form-control" rows="5" id="qnaContent"
						name="qnaContent" style="resize: none;" required></textarea>
				</div>
				<a type="reset" class="btn" href="${hpath }/qnas"
					style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">닫기</a>
				<button type="submit" class="btn"
					style="background-color: red; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">작성하기</button>
			</div>
		</form>

		<!-- jsp Templates 양식 -->
	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>
</html>