<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${hpath}/resources/css/common.css">
<style>
.sns_btn a {
  color: #fff;
}

.main_footer {
	display:flex;
	justify-content: space-between;
	align-items:center;
	position: relative;
	min-width:900px;
}
.sns_btn {
	display:flex;
	width:60px;
	height:60px;
	border-radius:31px;
	background-color:#747273;
	justify-content:center;
	align-items:center;
}
.ft_left {
	position: absolute;
	bottom: 30px;
	display:flex;
	float:left;
    flex-direction: column;
    width:50%;
    flex: 1;
    margin-left:50px;
    height:80%;
}
.ft_right {
	display:flex;
	float:right;
	flex: 1;
	margin-right:50px;
	position: absolute;
    bottom: 30px;
    right: 0;
}
.sns_btn {
	margin:10px;
}
.copyrightTerms p {
	width:auto;
	color:#747273;
	margin: 10 0px;
	padding: 10px;
}
.personalTerms {
	position: absolute;
	bottom: 0px;
	display:flex;
}
.personalTerms_item {
	padding: 10px;
	margin: 10 0px;
	margin-right:20px;
}
.personalTerms_item a {
    color: white;
}
.navbar-brand {
	max-width:150px;
	height:auto;
	display:flex;
	margin-top:30px;
}
</style>
</head>
<div id="main_footer">
	<div class="ft_left">
		<div class="navbar-brand">
		    <a class="navbar-item" href="${hpath }" class="logo-wrap">
		        <img src="${hpath}/resources/imgs/footer/logo2transp2.png" alt="LOGO" class="logo">
		    </a>
		</div>
		<div class="copyrightTerms">
			<p>2024 Trademarked ® SQL Record. All rights reserved.</p>
		</div>
		<div class="personalTerms">
			<div class="personalTerms_item">
				<p><a href="">이용약관</a></p>
			</div>
			<div class="personalTerms_item">
				<p><a href="">개인정보처리방침</a></p>
			</div>
			<div class="personalTerms_item">
				<p><a href="">환불정책</a></p>
			</div>
		</div>
	</div>
	<div class="ft_right">
		<div class="sns_btn">
			<a href="${hpath }" id="instagram">
		        <img src="${hpath}/resources/imgs/footer/instagram.png" alt="instagram" class="sns">
		    </a>
		</div>
		<div class="sns_btn">
			<a href="${hpath }" id="youtube">
		        <img src="${hpath}/resources/imgs/footer/youtube.png" alt="youtube" class="sns">
		    </a>
		</div>
		<div class="sns_btn">
			<a href="${hpath }" id="facebook">
		        <img src="${hpath}/resources/imgs/footer/facebook.png" alt="facebook" class="sns">
		    </a>
		</div>
		<div class="sns_btn">
			<a href="${hpath }" id="X">
		        <img src="${hpath}/resources/imgs/footer/X.png" alt="X" class="sns">
		    </a>
		</div>
	</div>
</div>