<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/head.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<link rel="stylesheet" href="${hpath}/resources/css/reply.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product One</title>
<style>

  
  #section_main {
    width: 100%;
    height: 700px;
    display: flex;
    justify-content: center;
    padding: 50px 0;
    margin-bottom: 30px;
  }
  #section_main_box {
    width: 1500px;
    height: 100%;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }
  
  @media screen and (max-width: 1499px) {
   #section_main {
      height: auto;
   }
    #section_main_box {
      grid-template-columns: 1fr;
      grid-template-rows: 2fr;
    }
  }
  
  .sld-wrp {
  	width: 700px;
  	margin: 0 auto;
  	padding: 2rem;
   }
  
  .slider-for {
  	width: 700px;
  	margin: 0 auto;
  	position: relative;
  	z-index: 10;
    }

   .slide-container {
  	height: 30rem;
  	background-color: #fff;
  	text-align: center;
  	font-weight: bold;
  	margin-bottom: 20px;
  	box-sizing: border-box;
  	overflow: hidden;
    }

.slide-btn {
  text-align: center;
  box-sizing: border-box;
  padding: 20px;
  cursor: pointer;
}
.slider-nav .slide-btn {
  opacity: 0.5;
  transition: opacity 0.5s ease-in-out;
}

.slick-slide.slick-current.slick-active.slick-center .slide-btn {
  opacity: 1;
}
.slick-prev,.slick-arrow {
  background-color: white;
}
.slick-prev:before,.slick-arrow:before {
  background-color: white;
  color: black;
  font-size: 30px;
}

.slide-btn:focus {
  background-color: rgb(255, 179, 0);
}


#section_btn {
  display: flex;
}

#section_btn div {
  width: 100%;
  height: 50px;
  margin: 100px 0;
  font-size: 18px;
  cursor: pointer;
}
 
 
 
  

  

  
.rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd;  display: inline-block; }
.rate > label:before {display: inline-block;font-size: 3rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #161616; } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #161616;  } 
  
.star-rating { display: inline-block; border: 0; margin-right: 15px; }
.star-rating > input { display: none; }
.star-rating > label { float: right; color: #ddd; position: relative; }
.star-rating > label:before { content: "\2605"; /* Unicode star character */ display: inline-block; font-size: 1rem; padding: .3rem .2rem; margin: 0; cursor: pointer; }
.star-rating .half:before { content: "\2605"; /* Unicode half-star character */ position: absolute; overflow: hidden; width: 50%; padding-right: 0; }
.star-rating input:checked ~ label, .star-rating label:hover, .star-rating label:hover ~ label { color: #161616; }

.star-rating input:checked ~ label,
.star-rating input:checked + .star-rating label:hover,
.star-rating input:checked ~ label:hover,
.star-rating input:checked ~ .star-rating label:hover ~ label,
.star-rating label:hover ~ input:checked ~ label,
.star-rating input , .star-rating label{
  pointer-events: none;
}

  
  
  
  
  
  
  .section_review_input div input {
    	
    	width: 100%;
    	position: relative;
    	font-size: 24px;
    	outline: none;
    	border: none;
    	flex-grow: 1;
  }
  
  .section_review_input div input:focus {
  	outline: none; /* 기본 포커스 스타일 제거 */
  	border-bottom: 5px solid #161616; /* 포커스 스타일 */
   }
  

  
  
  
  #point_graph div p {
    font-weight: 700;
    color: black;
  }
  
  
  
  
   .hidden {
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }
    .visible {
      opacity: 1;
    }
  
  .number-container {
  	display: inline-block;
  	width: 20px; /* 적절한 너비를 설정하세요 */
  	text-align: right; /* 숫자를 오른쪽 정렬 */
   }
   .graph-bar {
      position: relative;
      width: 0;
      height: 100%;
      background-color: #161616;
      transition: width 2s;
    }
  
  
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="main_content">
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
<div id="breadCrumb">
 <div id="breadCrumb_items">
  <p><a href="${hpath }">HOME</a></p>
  <p>></p>
  <p><a href="#">항목</a></p>
  <p>></p>
  <p><a>이름</a></p>
 </div> 
</div>


<div id="section_main" class="hidden">
  <div id="section_main_box">
    <div class="sld-wrp">
	 <div class="slider-for">
		<div class="slide-container">
		  <div style="width: 100%; height: 100%;">
		   <img src="${hpath }/resources/imgs/homepageLogo/turnTable.png" style="width: 100%; height: 100%; object-fit: cover;">
		  </div>
		</div>
		<div class="slide-container">
		  <div style="width: 100%; height: 100%;">
         	<img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp">
      	  </div>
		</div>
		<div class="slide-container">go 3</div>
		<div class="slide-container">go 4</div>
		<div class="slide-container">go 5</div>
		<div class="slide-container">go 6</div>
  </div>
  <div class="slider-nav">
    <div class="slide-btn">
      <div style="width: 100%; height: 100%;">
		 <img src="${hpath }/resources/imgs/homepageLogo/turnTable.png" style="width: 100%; height: 100%; object-fit: cover;">
	  </div></div>
    <div class="slide-btn">
      <div style="width: 100%; height: 100%;">
         <img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp" style="width: 100%; height: 100%; object-fit: cover;"">
      </div>
	</div>
    <div class="slide-btn">go 3</div>
    <div class="slide-btn">go 4</div>
    <div class="slide-btn">go 5</div>
    <div class="slide-btn">go 6</div>
  </div>

</div>
    <div style="padding: 9rem 2rem; font-size: 1.1rem;">
      <h2>이름</h2>
      <br>
      <h2>￦가격</h2>
      <br>
      <div style="display: flex; gap: 10px;">
        <fieldset class="star-rating">
		  <input type="radio" id="star5" name="rating_readonly_main" value="5"><label for="star5" title="5 stars"></label>
		  <input type="radio" id="star4.5" name="rating_readonly_main" value="4.5"><label class="half" for="star4.5" title="4.5 stars"></label>
		  <input type="radio" id="star4" name="rating_readonly_main" value="4"><label for="star4" title="4 stars"></label>
		  <input type="radio" id="star3.5" name="rating_readonly_main" value="3.5"><label class="half" for="star3.5" title="3.5 stars"></label>
		  <input type="radio" id="star3" name="rating_readonly_main" value="3"><label for="star3" title="3 stars"></label>
		  <input type="radio" id="star2.5" name="rating_readonly_main" value="2.5"><label class="half" for="star2.5" title="2.5 stars"></label>
		  <input type="radio" id="star2" name="rating_readonly_main" value="2"><label for="star2" title="2 stars"></label>
		  <input type="radio" id="star1.5" name="rating_readonly_main" value="1.5"><label class="half" for="star1.5" title="1.5 stars"></label>
		  <input type="radio" id="star1" name="rating_readonly_main" value="1"><label for="star1" title="1 star"></label>
		  <input type="radio" id="star0.5" name="rating_readonly_main" value="0.5"><label class="half" for="star0.5" title="0.5 star"></label>
		</fieldset>
  		<p>&nbsp;평균참여인원</p>
      </div>
      <br>
      <hr>
      <br>
      <div style="width: 100%; display: flex; justify-content: space-between;"><p>적립 포인트(5%)</p><p>포인트 원</p></div>
      <br>
      <p>구매량 :</p>
      <br>
      <div style="display: flex; gap: 10px; justify-content: space-between;">
        <input type="number" min="100" max="1000" step="100">
        <div style="width: 25rem; height: 3rem; cursor: pointer; font-size:20px; color: white; text-align: center; height: 3rem; line-height: 3rem; background-color: #2F4F4F">
          장바구니에 담기
        </div>
      </div>
    </div>
  </div>

</div>

<div id="section_btn" class="hidden">
  <div style="background-color: #383637; text-align: center; color: white; line-height: 50px; height: 50px;">상품 상세</div>
  <div style="background-color: #DEDEDE; text-align: center; color: black; line-height: 50px; height: 50px;">리뷰</div>
</div>

<h2 style="font-size: 5rem; text-align: center;">상품 설명1</h2>
<br><br><br>
<div id="section_img" style="width: 100%; display: flex; justify-content: center;">
  <div style="width: 800px; height: 800px; display: flex; justify-content: center;">
   <img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp" style="width: 100%; height: 100%; object-fit: cover;">
  </div>
</div>

<br><br><br>















<!-- 리뷰 코드 시작 -->
<div id="section_detail" class="hidden"  style="width: 100%; display: flex; justify-content: center;">
  <div style="width: 1500px; height: auto; padding: 200px;">
    자세한 설명
  </div>
</div>

<%@ include file="/WEB-INF/views/reply/list.jsp" %>


 <script>
    $('.slider-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	$('.slider-nav').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  asNavFor: '.slider-for',
	  dots: true,
	  centerMode: true,
	  focusOnSelect: true
	});
	//슬라이드 opacitiy 설정 (선택시에는 선명하게)
	document.querySelectorAll('.slide-btn').forEach((btn, index) => {
		  btn.addEventListener('click', () => {
		    document.querySelector('.slide-btn.active').classList.remove('active');
		    btn.classList.add('active');
		  });
		});
	

	
	document.addEventListener("DOMContentLoaded", function() {
		  const observer = new IntersectionObserver((entries, observer) => {
		    entries.forEach(entry => {
		      if (entry.isIntersecting) {
		        entry.target.classList.add('visible');
		        observer.unobserve(entry.target);  // Once the element is visible, stop observing it
		      }
		    });
		  }, { threshold: 0.1 });

		  const sections = document.querySelectorAll('.hidden');
		  sections.forEach(section => observer.observe(section));

		});
	
	
	
	
	//별점 
	
	document.addEventListener('DOMContentLoaded', () => {
		  const rateInputs = document.querySelectorAll('.rate input');
		   
		  let ratingValue = 0; // Default value

		  rateInputs.forEach(input => {
		    input.addEventListener('change', (event) => {
		      const ratingValue = event.target.value;
		      console.log(`Rating selected: ` + ratingValue);
		    });
		  });
		});
	
	//판매 상단에 평균 별점 채우기
	$(document).ready(function() {
		  // 평균 별점 
		  const initialRating = 3;
		  // 별점 input value에 채우기
		  $('input[name="rating_readonly_main"]').each(function() {
		        if ($(this).val() === initialRating.toString()) {
		            $(this).prop('checked', true); // 선택된 별점으로 설정
		        }
		    });  
		});
	//리뷰 상단에 평균 별점 채우기
	$(document).ready(function() {
		  // 평균 별점 
		  const initialRating = 3;
		  // 별점 input value에 채우기
		  $('input[name="rating_readonly"]').each(function() {
		        if ($(this).val() === initialRating.toString()) {
		            $(this).prop('checked', true); // 선택된 별점으로 설정
		        }
		    });  
		});
	
	
	
	//리뷰 작성 input 포커스
	$(document).ready(function() {
		  // 포커스가 들어왔을 때
		  $('.section_review_input div input').focus(function() {
		    $(this).css('border-bottom', '3px solid #161616');
		  });
		  
		  // 포커스가 나갔을 때 원래 스타일로 되돌리기
		  $('.section_review_input div input').blur(function() {
		    $(this).css('border-bottom', '1px solid #ddd'); // 기본 스타일로 되돌리기
		  });
		});
	
	
	const contentInput = document.querySelector('.section_review_input div input');
	const reviewInputButton = document.getElementById('review_input_button');

	

	// input 요소가 포커스를 잃을 때
	contentInput.addEventListener('blur', (event) => {
	  // reviewInputButton을 클릭 중이면 blur 이벤트 무시
	  setTimeout(() => {
	    if (!reviewInputButton.contains(document.activeElement)) {
	      reviewInputButton.style.display = 'none';
	    }
	  }, 0);
	});

	// reviewInputButton을 클릭했을 때
	reviewInputButton.addEventListener('mousedown', (event) => {
	  event.preventDefault(); // 이 이벤트가 blur 이벤트를 트리거하지 않도록 함
	});
	
	// input 요소에 글자가 적힐 때마다 실행되는 이벤트 리스너
	contentInput.addEventListener('input', () => {
	  // input 요소에 글자가 하나라도 있는지 확인
	  if (contentInput.value.length > 0) {
	    reviewInputButton.style.backgroundColor = '#2F4F4F';
	    reviewInputButton.style.color = 'white';
	  } else {
	    // input 요소가 비어있을 때 원래 스타일로 되돌림
	    reviewInputButton.style.backgroundColor = '#D6D6D6';
	    reviewInputButton.style.color = 'white';
	  }
	});

	
 </script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 