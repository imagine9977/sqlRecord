<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Home</title>
<style>
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="main_content">
		<%@ include file="../searchHeader.jsp"%>

		<!-- 여기에 작성 -->
		<form id="enrollForm" method="post" action="${hpath }/notice/insert.do"
			enctype="multipart/form-data">
			<div class="card-body">
				<div class="form-group">
					<label for="noticeTitle">제목</label> <input type="text"
						class="form-control" id="noticeTitle" name="noticeTitle" value=""
						required>
				</div>
				<div class="form-group">
					<label for="noticeCategory">분류</label> <select class="form-control"
						id="noticeCategory" name="noticeCategory">
						<option value="general">일반</option>
						
						<option value="event">이벤트</option>
						<option value="service">서비스</option>
						<option value="etc">기타</option>
					</select>
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
					<label for="noticeContent">내용</label>
					<textarea class="form-control" rows="5" id="noticeContent"
						name="noticeContent" style="resize: none;" required></textarea>
				</div>
				<button type="reset" class="btn"
					style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">닫기</button>
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