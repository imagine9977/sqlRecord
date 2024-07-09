<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>

<%@ include file="/bootstrap.jsp" %>

<%@ include file="/head.jsp" %>
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/slick/slick.min.css?after2"/>
<link rel="stylesheet" href="${hpath }/resources/css/slick/slick-theme.min.css?after2"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<title>Home</title>
<style>
body {
   background-color: #EDEDED;
}
	

swiper-container {
  width: 100%;
  height: 100%;
}

swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}

swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
	
  
.slick-slide {
  margin: 0 20px; 
}
.slick-list {
  margin: 0 -20px; 
}
  
  
  
  
#section_video {
  display: flex;
  width: 100%;
  height: 710px;
  justify-content: center;
}
#section_video_box {
  width: 100%;
  display: flex;
  justify-content: center;
}
  
  
  
  
  


  
#section_grid {
  display: flex;
  width: 100%;
  height: 80%;
  justify-content: center;
  background-color: white;
  margin-bottom: 50px; 
  padding: 20px 0;
}
#section_grid_box {
  width: 100%;
  max-width: 1500px;
  height: 100%;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
}
#section_grid_box.visible {
  opacity: 1;
}
#section_grid_box div:nth-child(1) {
  font-size: 2.0rem;
}
#section_grid_box div:nth-child(2) {
  background-color: skyblue;
}
  
  
#section_grid_2 {
  display: flex;
  width: 100%;
  height: auto;
  min-height: 90%;
  justify-content: center;
  margin-bottom: 50px; 
}
  
#section_grid_box2 {
  width: 100%;
  max-width: 1500px;
  height: 100%;
}
	  
#section_grid_box2_items {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 1rem;
}
#section_grid_box2_item {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1.5fr;
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
 }
#section_grid_box2_item.visible {
  opacity: 1;
}
#section_grid_box2_item:nth-child(1) { transition-delay: 0s; }
#section_grid_box2_item:nth-child(2) { transition-delay: 0.1s; }
#section_grid_box2_item:nth-child(3) { transition-delay: 0.2s; }
#section_grid_box2_item:nth-child(4) { transition-delay: 0.3s; }
#section_grid_box2_item_imgBox {
  width: 18rem;
  height: 18rem;
}
#section_grid_box2_item_textBox {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
}

	  
	  
#section_slide {
 width: 100%;
 display: flex;
 justify-content: center;
 margin-bottom: 240px; 
 opacity: 0;
 visibility: hidden;
 transition: opacity 1s ease;
 -webkit-transition: opacity 1s ease;
}

	
#slick-prev {
  width: 40px;
  height: 40px;
  background-color: black;
  border-radius: 20px;
  color: #EDEDED;
}
#slick-prev-2 {
  width: 40px;
  height: 40px;
  background-color: black;
  border-radius: 20px;
  color: #EDEDED;
}
	  
#slick-next {
  width: 40px;
  height: 40px;
  background-color: black;
  border-radius: 20px;
  color: #EDEDED;
}
#slick-next-2 {
  width: 40px;
  height: 40px;
  background-color: black;
  border-radius: 20px;
  color: #EDEDED;
}
	
.img_box {
	max-height: 300px;
}
	
.img_box_2 {
	max-height: 300px;
}
	  
	  
	  
       
	  
	  
	  
#slick-prev, #slick-next {
    background-color: black; /* 버튼 배경색 */
    border: none;
    cursor: pointer;
    outline: none;
    width: 40px; /* 버튼 크기 */
    height: 40px; 
    border-radius: 50%; /* 둥근 모서리 */
    display: flex;
    align-items: center;
    justify-content: center;
}

#slick-prev:hover, #slick-next:hover {
    background-color: #bfbfbf; /* Hover 시 배경색 */
}

#slick-prev-2:hover, #slick-next-2:hover {
    background-color: #bfbfbf; /* Hover 시 배경색 */
}

#slick-prev span, #slick-next span {
    display: inline-block;
}

#slick-prev svg, #slick-next svg {
    width: 20px;
    height: 20px;
}

#slick-prev:hover svg, #slick-next:hover svg {
    fill: gray; /* Hover 시 화살표 색상 */
}




@media screen and (max-width: 1499px) {
  #slider-div  , #slider-div-3 {
    width: 100%;
    height: 300px;
  }
  #slider-div-2 {
    width: 100%;
    height: 300px;
  }
}
	  
@media screen and (max-width: 1050px) {
  #slider-div  , #slider-div-3  {
    width: 100%;
    height: 250px;
  }
  #slider-div-2 {
    width: 100%;
    height: 250px;
  }
  #section_grid_box2_items {
    justify-content: center;
  }
}





</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div id="main_content">
<%@ include file="/searchHeader.jsp" %>
  

  
  <!-- 최상위 메인 슬라이드 -->
  <div id="section_video">
   <div id="section_video_box">
    <swiper-container class="mySwiper" scrollbar-hide="false" centered-slides="true" autoplay-delay="5000" autoplay-disable-on-interaction="false">
     <swiper-slide>
      <img src="${hpath }/resources/imgs/homepageLogo/mainSlideimg1.png" style="width: 100%; height: 100%; object-fit: cover;">
     </swiper-slide>
     <swiper-slide>
      <img src="${hpath }/resources/imgs/homepageLogo/mainSlideimg2.webp" style="width: 100%; height: 100%; object-fit: cover;">
     </swiper-slide>
     <swiper-slide>Slide 3</swiper-slide>
     <swiper-slide>Slide 4</swiper-slide>
     <swiper-slide>Slide 5</swiper-slide>
     <swiper-slide>Slide 6</swiper-slide>
     <swiper-slide>Slide 7</swiper-slide>
     <swiper-slide>Slide 8</swiper-slide>
     <swiper-slide>Slide 9</swiper-slide>
    </swiper-container>
   </div>
  </div>
  
  
  <div id="section_grid">
    <div id="section_grid_box">
      <div style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
       <div style="min-width: 300px;">
        <h2>SQL-턴테이블<small>과 함께 하는</small></h2>
        <h4><small>나만의</small> 힐링</h4>
        <br>
        <h6>SQL RECORD는 모두를 위한 턴테이블을 소개합니다.</h6>
        <h6>당신과 가족, 음악 친구들을 위한 턴테이블을 찾아보세요.</h6>
       </div>
      </div>
      <div style="width: 100%; height: 100%; overflow: hidden;">
    	<img src="${hpath }/resources/imgs/homepageLogo/turnTable.png" style="width: 100%; height: 100%; object-fit: cover;">
	  </div>
    </div>
  </div>
  
  <br>
  <br>
  
  
  <div id="section_grid_2">
    <div id="section_grid_box2">
      <h2 style="text-align: center">인기 카테고리</h2>
      <br>
      <br>
      <br>
      <div id="section_grid_box2_items">
        <div id="section_grid_box2_item">
          <div id="section_grid_box2_item_imgBox">
            <img src="${hpath }/resources/imgs/homepageLogo/turntables.webp">
          </div>
          <div id="section_grid_box2_item_textBox">
            <h2>TURNTABLES</h2>
            <br>
            <h5>새로운 음악 친구가</h5>
            <h5>필요하신가요?</h5>
            <br>
            <br>
            <div style="width: 150px; height: 50px; background-color: #383637; color: white; line-height: 50px; text-align: center;">
              <a>상품 전체보기 ></a>
            </div>
          </div>
        </div>
        <div id="section_grid_box2_item">
          <div id="section_grid_box2_item_imgBox">
            <img src="${hpath }/resources/imgs/homepageLogo/mediaStands.webp">
          </div>
          <div id="section_grid_box2_item_textBox">
            <h2>VINYLS</h2>
            <br>
            <h5>내 턴테이블에게</h5>
            <h5>멋진 바이닐을</h5>
            <h5>선물하세요.</h5>
            <br>
            <div style="width: 150px; height: 50px; background-color: #383637; color: white; line-height: 50px; text-align: center;">
              <a>상품 전체보기 ></a>
            </div>
          </div>
        </div>
        <div id="section_grid_box2_item">
          <div id="section_grid_box2_item_imgBox">
            <img src="${hpath }/resources/imgs/homepageLogo/speakers.webp">
          </div>
          <div id="section_grid_box2_item_textBox">
            <h2>SPEAKERS</h2>
            <br>
            <h5>놀라운 음질을</h5>
            <h5>경험하고 싶다면</h5>
            <h5>스피커를 탐색해보세요.</h5>
            <br>
            <div style="width: 150px; height: 50px; background-color: #383637; color: white; line-height: 50px; text-align: center;">
              <a>상품 전체보기 ></a>
            </div>
          </div>
        </div>
        <div id="section_grid_box2_item">
          <div id="section_grid_box2_item_imgBox">
            <img src="${hpath }/resources/imgs/homepageLogo/radios.webp">
          </div>
          <div id="section_grid_box2_item_textBox">
            <h2>RADIOS</h2>
            <br>
            <h5>당신이 원하는 클래식을</h5>
            <h5>찾아보세요.</h5>
            <br>
            <br>
            <div style="width: 150px; height: 50px; background-color: #383637; color: white; line-height: 50px; text-align: center;">
              <a>상품 전체보기 ></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  
  
  <div id="section_slide">
   <div style="overflow: hidden;">
   <h2 style="padding: 10px;"><a href="#" style="color: black;">최신 상품 ></a></h2>
   <div id="slider-div" style="height: auto; max-width: 1500px" >
    <div>
      <div style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	  </div>
  	  <p style="padding: 8px; font-size: 20px">이름</p>
  	  <p style="padding: 8px;">가격</p>           
    </div>
      <div>
       <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
       <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
       <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAnFBMVEX///8sOz0sPDstOj0qPD0sOz8tOzv8/Pz4+PgpOjnu7+/q6+sqODvx8vIdMC8nNznj5OTU1taQlpa+wcEjNTQfMTO0uLimq6tVX1/Nz88AISEWLCvEx8fb3d1jbGxDUE90fHybn6AXKi2Ei4o7SEgAGBhMV1YAHiIAGxcLKCYOJCZsc3MAFBd+g4RESk4yRkUNHSQABwoAHhQVMy8Tq+6PAAAM0klEQVR4nNVdabeiuBbtBGRQTBQTQFBE4OoFyr6v3vv//+2BQ5UDyAmD6F79pXqti9mEnPmc/PNP74gSRcLYNfv/pf4x/zJQgV/zoVfSARwuHclwZ+iVtIe1l05k0Ndi6LW0xXjD0Rl8Nx16NS1hEoRGoxMbsh16Ne0wj1nO5UyGbdZDr6cNtANFV6CROvSKWmAR35LZrIZeUXNMshDdgATjodfUGDaht2R03Rp6TU0xd4h8SwYTfzb0qppBMxOM7shgz9aGXlcjLGOGsXxHhu0+0kSbHkJZvt8ahELzE7dmwSm635lCPKPl0CsTh7bjck7mYWdQ6H/e1thuzgQrygMZyf048Tz22JGLIj2wYT+fZtQEyWljpEcy8qd50EsXyUdR/Hhmcjsg+SjNqTrkCRlMgqEXKAKbnViUckFYZx9kPc92xekvJXIkg5n/MR60aubq8ikZHdtDLxKK5Y5WEjmRwcz5EA96GvGqo/8HBt1+hrJZ5PZXHRlEdx9hos2ycDSqJYPS6ANkgGqHp3NRQ4byDxDP60IsF2e8hozkZZOh11oHzUwljOu5IKR41rvLgPnp9APIIL57cxNNzcJHM7kK6ZvHnhd7MJVcBpC3Dm5oMZPP5uUIwMbLhl7wM2z3wPNyxv6NNeeEGmJk+GboJVcj45IYGcl7W+t5YRR5ZTiVHEb8pppz6nO4WL6ARUMvuxz2Y/gSQCZ+SxmwdngDMjIL3tB61kxqiHPJNWf8hgHO5YY9hmIBUEj2dibaOPIERPLN1jD73aznlaI3JCOTdwtuTPyw3rmsYpO+V/5JtV2Ap1xFhtK3Es+zmDUjcoL3VuI5cttwQdh9o+qteTsuCJHN+2yNw+vX+xzu21jPQr5yOSh9E+t5umu9MUgJD0PTOMFszwVhXX8L8TyPnycwYGQw8YcmUiBoYvk/ktH1N5ABVhcbU4A7g1vPk6yDE3OEQQcPcNpKRxtTxJ4HlgHr9vryio05qB2gbUPpiE7I0HjQ/NNywzskk1vPA9oB00NYv0IBUDZg/mnFGwVkKpF70INtjeaQ8yog+QsIGewOFtywvy6r6IhMbgckA23N2NU7J4OTYBgyh/RPBKM7MsqvQTTnPFUahmMqIedkuDPAqdH84vQD6VC4zTNIca19DC7ByPAsg7Nhu5e3pcwcWpwUEBkaL1YbuA3HXl5ca+oylAxmkaaaTIeeMBq/uDxguWOyDCTDNstLfRAM7PBSGaBFRZsPjIxEjmlLW1egwWg9fmmAcwF3ySR6jlY6BJyMIq+s3pplHlRPSlJ4DlQsWUmXQzkM+sLghiUQkOG7ywGIUnDSg78u/7R2CHhZ2P3jPY5juAzwti/KP+W+8rFsEbIyxbuK7VkumMzLxPP8hyJY5WIumLyr72Xqe1AyKIxesjVq4MFTfretMnPPUIBSgLKXWM+rY2YJaJQpN1FKzUwVKBvvJdbzD9zKkvZ3XvB6x6Fk5K8XWM9bgcxS6N8pP9XywGT0tPdTM/H0+oWcQemDWTIJCFR14rT36q0DgbuXYUlMbwVWNori9SyeVzq8qqQ02jqNoG9DUUjWqwyY+hxegklKVcXcAW6NghTWqwywFQomwyoyFFsMPnXc6dGDXvv1PUt/QM3yj2Tsg0tTDNSf9axuqQGOkNHKtoUVA0eoe2xNy31leLiPVSf17seEPHtKX9Vb08grpvuMQHz0uFoSzVI4mU1PJtqKw/UlTp658baLgKoTJ4deZMBEoDXmxo0pwY5ArRpE+ghunBvjYNBrlPcqAccDehnuMhOISaKkxqxSoxT6nWGvh/yT6SL5CMAKeFz3Ntcx9NXgHmZvzTmVoWTkfa2uU22oB41x3TaLw89PDJCMzAFp1pkPPIJYpl1bz0LFfiABtMDgoGjY7WhEbcMQWC7DShOmEVh1Sr86Fc9m7oRAyVAMKxpZgsWjRP/tUKCtf/JPAkoGPIxpS8FB3rDD/FNAJDAZeKHVzAdrLhp3Jp4XsYFA+gWJlcBZCCwDeFf5p3HAJTAZEQ9EC8BuWlfVW6qNKZiMmG+4hotn3s1oxLVfiGUgGSrmtZtg8Wx00pqmbYkugclwMY2gYQaVaLwL63keM7kgA/pF4UrrxVf9Q08weHvrOVfUMjrWLQJEM/4WlqB+CK2J5O2t52WqIwlKxhXvTpilUGUstR7uMnZyXxlaUMqYuMRRt6kCjCtS3jK4YX8X7wRIJmkSsps44Ihv6LcSzxMZbj/lhkyT31IXFByLT1uJ54uZDmFkeM0M9fEBnIjncYutmbtG8YHBHH+vqY5ebsApmxajEVWfSGAyVG5qPakmOGVDSWPNaZ0nL4DIeM0FZ1HxAWODwqDhb4yd3MAcAcm06hexwSkbo+loRJNKcDJhm06eqU9qf+AM5jRKC8w3XDpF/AFkWrbBr36gvoDcqP/pWOx3yl/Uk6Ftpy9GYA+6UWva1RT8ejLsvnpBFBNwG57BKtKLz54eXH3GdWQMpXVgywL3eouLGtUyBBrjeAcJewecsuGiSmAm1BjHOwgGLz0dWr0lWFyrbeFlbrlY7qLJWjVdaAIqFCuuXf8IjJEw/tNJ4GQWQwfXSKFIa5oaeAJjvfYddb5aX1AyfCOwNasvcOF+4Zt3lKofB8BvW5Jc+ORaNeZl1xOUQlG6G+axBM9IMRKwwWH/RnAyXtZZDcUUPCZBTn3g1kwMJMN7lpQOSyjm4Kli0i+g9XxIiqsWgIexhRvzCNWWob4A34E+iCVmRVde2fUEZc/sNHk6yaCnBoNCQdOMYbnieoIHGLzjmv0FVAZgtgFYz5ZCqyf630HqvJtCPTBwpWF9ecAlNwd6ZA99LusYquJYff5pe9zmEUyYkbZuTNkCHu5GqgAmQY14Xm4YfKxnP7MJwadGV55/F9PIwwIlpXWvphFWQDcN113NtYDnf4uN6afkMIBV1WCsPx2NKFLsV3h8vXDJfQHQG811IXGqtZxqhQZgbvwZhtRX/6ENrjp6Ug0y23HIEPwz3N4G+IzB7VxPvvRjIhtIRmFxf+0tKwY00ZTK0YhrRjG0Ma7fG2WnUQKzcxWlKlfvcIEx2P3eVjYHDrNTFFZuPa9+SwqcTNpvo44dwvoFFOW77OhqQnPKwmis/YV6h/xxqrA+vfzx8YFr6KQxjH+XnBqhSBmiju9nWf5fFgTBIYoi0zS3W/sEq8BTuT2eHbFer+fL5WqRw7LyP9xuTTOKguK5NZcLXZFJHqN26+J6AoHpsZRzwol3QZKmiXvG/uvrt/Lcz7F2iUfCMEyOf/T99fV9hOumSRIW4NDPJD8X3r14ViMObvE9o4imS8djdpqjJZ3+kf9fRrI6Q2cecCLrRxwfNhqd2j/yRwALwf+SYfeyaBVTsYn+10+7+QdGPN7W2waTbRxeyZsLmfMbhRtVhYdPb433ccaR6M5UQPf8BURqayvfO1UzjK7QiAy7zT9ZWMcim1uB/GNjJIJ60rPI0x8DDQ1ep6Ffi+e1T7DQl1pJhhOBC3M1a/9opTf5Nq4vtlW3nt4Bmfzw7/8VSzjOfvadTOC7agktiv1ab0txEBt0I0dJF6Mr/xbX5mZdk4sj7snorNG4mEUM1ilP8Kf/YEmK6E7bEWUUZ81iaOsAwweFVEBRyEk8565Q+0FlOt/YTYPO0+2GNTr312zO5QF2Cu9YrAIl2ap5pKZQOUpLLSelRXBDzVwBHVUObpjtio7XJmHQUs0KnHof5ruw5YjScLNom9eYLn7ClvZHcoziLTchbk5GRv/tpJNy7e8b3ZJywej7VCW4jAVmSdxRGfFf227STWNz32bC8P7SN7z6+d+JnfgzvE1n/rO6isOm+k52//ZAL5rZADJjUZd91JOAsEYnh3rX/dzgjNU1DLbpuFV3uo3hA7quFsKDWycgpqJfGaVZ9yGalU+oqDRS+P1NSRaloJTsBZL3A3AoxTGJqOB1aZg8GlJ2SE+yEfAoCRmp01NIU7V24M6N01v1S4xC22PFQyAKVKI86i8KOA9CgfGuYWmSWLWTItVbX/UlSWFs9TkofrJF52BR7bW8+VLKVbaW25wYUFxopP6y3+Fj2mqXYggbKfy3yvHQTFdXassZ+L5T5VKOWebq9WSkEFd/7Zrp1TSzYIW8aP6ozVjdZyLzn2cOoVY38Ja97va7+Y7Q52R4TYp4Gj3LWhk8fuH84elBIU90n8Q3dd/IOPpfpVykxH/tBRFWvjlP9qX+e58cqnJwHLd0KMUxD44FY2VfPqw+ZBKUtrUaoWO9/g6/iR17pbORKYXVA0+ykv5p6gXzIW5T0FaOVyKTaAqtbZ49smHMfvkc9ctqouReDMjoG14cNvPTm3MjJXHPOv8ZNOvXnUOtCxQ2F2yuUpyy7HZX79sIs91NcZDhlXP5P5yz78UJ3qgEAAAAAElFTkSuQmCC">
  	   </div>
      </div>
       		 
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAnFBMVEX///8sOz0sPDstOj0qPD0sOz8tOzv8/Pz4+PgpOjnu7+/q6+sqODvx8vIdMC8nNznj5OTU1taQlpa+wcEjNTQfMTO0uLimq6tVX1/Nz88AISEWLCvEx8fb3d1jbGxDUE90fHybn6AXKi2Ei4o7SEgAGBhMV1YAHiIAGxcLKCYOJCZsc3MAFBd+g4RESk4yRkUNHSQABwoAHhQVMy8Tq+6PAAAM0klEQVR4nNVdabeiuBbtBGRQTBQTQFBE4OoFyr6v3vv//+2BQ5UDyAmD6F79pXqti9mEnPmc/PNP74gSRcLYNfv/pf4x/zJQgV/zoVfSARwuHclwZ+iVtIe1l05k0Ndi6LW0xXjD0Rl8Nx16NS1hEoRGoxMbsh16Ne0wj1nO5UyGbdZDr6cNtANFV6CROvSKWmAR35LZrIZeUXNMshDdgATjodfUGDaht2R03Rp6TU0xd4h8SwYTfzb0qppBMxOM7shgz9aGXlcjLGOGsXxHhu0+0kSbHkJZvt8ahELzE7dmwSm635lCPKPl0CsTh7bjck7mYWdQ6H/e1thuzgQrygMZyf048Tz22JGLIj2wYT+fZtQEyWljpEcy8qd50EsXyUdR/Hhmcjsg+SjNqTrkCRlMgqEXKAKbnViUckFYZx9kPc92xekvJXIkg5n/MR60aubq8ikZHdtDLxKK5Y5WEjmRwcz5EA96GvGqo/8HBt1+hrJZ5PZXHRlEdx9hos2ycDSqJYPS6ANkgGqHp3NRQ4byDxDP60IsF2e8hozkZZOh11oHzUwljOu5IKR41rvLgPnp9APIIL57cxNNzcJHM7kK6ZvHnhd7MJVcBpC3Dm5oMZPP5uUIwMbLhl7wM2z3wPNyxv6NNeeEGmJk+GboJVcj45IYGcl7W+t5YRR5ZTiVHEb8pppz6nO4WL6ARUMvuxz2Y/gSQCZ+SxmwdngDMjIL3tB61kxqiHPJNWf8hgHO5YY9hmIBUEj2dibaOPIERPLN1jD73aznlaI3JCOTdwtuTPyw3rmsYpO+V/5JtV2Ap1xFhtK3Es+zmDUjcoL3VuI5cttwQdh9o+qteTsuCJHN+2yNw+vX+xzu21jPQr5yOSh9E+t5umu9MUgJD0PTOMFszwVhXX8L8TyPnycwYGQw8YcmUiBoYvk/ktH1N5ABVhcbU4A7g1vPk6yDE3OEQQcPcNpKRxtTxJ4HlgHr9vryio05qB2gbUPpiE7I0HjQ/NNywzskk1vPA9oB00NYv0IBUDZg/mnFGwVkKpF70INtjeaQ8yog+QsIGewOFtywvy6r6IhMbgckA23N2NU7J4OTYBgyh/RPBKM7MsqvQTTnPFUahmMqIedkuDPAqdH84vQD6VC4zTNIca19DC7ByPAsg7Nhu5e3pcwcWpwUEBkaL1YbuA3HXl5ca+oylAxmkaaaTIeeMBq/uDxguWOyDCTDNstLfRAM7PBSGaBFRZsPjIxEjmlLW1egwWg9fmmAcwF3ySR6jlY6BJyMIq+s3pplHlRPSlJ4DlQsWUmXQzkM+sLghiUQkOG7ywGIUnDSg78u/7R2CHhZ2P3jPY5juAzwti/KP+W+8rFsEbIyxbuK7VkumMzLxPP8hyJY5WIumLyr72Xqe1AyKIxesjVq4MFTfretMnPPUIBSgLKXWM+rY2YJaJQpN1FKzUwVKBvvJdbzD9zKkvZ3XvB6x6Fk5K8XWM9bgcxS6N8pP9XywGT0tPdTM/H0+oWcQemDWTIJCFR14rT36q0DgbuXYUlMbwVWNori9SyeVzq8qqQ02jqNoG9DUUjWqwyY+hxegklKVcXcAW6NghTWqwywFQomwyoyFFsMPnXc6dGDXvv1PUt/QM3yj2Tsg0tTDNSf9axuqQGOkNHKtoUVA0eoe2xNy31leLiPVSf17seEPHtKX9Vb08grpvuMQHz0uFoSzVI4mU1PJtqKw/UlTp658baLgKoTJ4deZMBEoDXmxo0pwY5ArRpE+ghunBvjYNBrlPcqAccDehnuMhOISaKkxqxSoxT6nWGvh/yT6SL5CMAKeFz3Ntcx9NXgHmZvzTmVoWTkfa2uU22oB41x3TaLw89PDJCMzAFp1pkPPIJYpl1bz0LFfiABtMDgoGjY7WhEbcMQWC7DShOmEVh1Sr86Fc9m7oRAyVAMKxpZgsWjRP/tUKCtf/JPAkoGPIxpS8FB3rDD/FNAJDAZeKHVzAdrLhp3Jp4XsYFA+gWJlcBZCCwDeFf5p3HAJTAZEQ9EC8BuWlfVW6qNKZiMmG+4hotn3s1oxLVfiGUgGSrmtZtg8Wx00pqmbYkugclwMY2gYQaVaLwL63keM7kgA/pF4UrrxVf9Q08weHvrOVfUMjrWLQJEM/4WlqB+CK2J5O2t52WqIwlKxhXvTpilUGUstR7uMnZyXxlaUMqYuMRRt6kCjCtS3jK4YX8X7wRIJmkSsps44Ihv6LcSzxMZbj/lhkyT31IXFByLT1uJ54uZDmFkeM0M9fEBnIjncYutmbtG8YHBHH+vqY5ebsApmxajEVWfSGAyVG5qPakmOGVDSWPNaZ0nL4DIeM0FZ1HxAWODwqDhb4yd3MAcAcm06hexwSkbo+loRJNKcDJhm06eqU9qf+AM5jRKC8w3XDpF/AFkWrbBr36gvoDcqP/pWOx3yl/Uk6Ftpy9GYA+6UWva1RT8ejLsvnpBFBNwG57BKtKLz54eXH3GdWQMpXVgywL3eouLGtUyBBrjeAcJewecsuGiSmAm1BjHOwgGLz0dWr0lWFyrbeFlbrlY7qLJWjVdaAIqFCuuXf8IjJEw/tNJ4GQWQwfXSKFIa5oaeAJjvfYddb5aX1AyfCOwNasvcOF+4Zt3lKofB8BvW5Jc+ORaNeZl1xOUQlG6G+axBM9IMRKwwWH/RnAyXtZZDcUUPCZBTn3g1kwMJMN7lpQOSyjm4Kli0i+g9XxIiqsWgIexhRvzCNWWob4A34E+iCVmRVde2fUEZc/sNHk6yaCnBoNCQdOMYbnieoIHGLzjmv0FVAZgtgFYz5ZCqyf630HqvJtCPTBwpWF9ecAlNwd6ZA99LusYquJYff5pe9zmEUyYkbZuTNkCHu5GqgAmQY14Xm4YfKxnP7MJwadGV55/F9PIwwIlpXWvphFWQDcN113NtYDnf4uN6afkMIBV1WCsPx2NKFLsV3h8vXDJfQHQG811IXGqtZxqhQZgbvwZhtRX/6ENrjp6Ug0y23HIEPwz3N4G+IzB7VxPvvRjIhtIRmFxf+0tKwY00ZTK0YhrRjG0Ma7fG2WnUQKzcxWlKlfvcIEx2P3eVjYHDrNTFFZuPa9+SwqcTNpvo44dwvoFFOW77OhqQnPKwmis/YV6h/xxqrA+vfzx8YFr6KQxjH+XnBqhSBmiju9nWf5fFgTBIYoi0zS3W/sEq8BTuT2eHbFer+fL5WqRw7LyP9xuTTOKguK5NZcLXZFJHqN26+J6AoHpsZRzwol3QZKmiXvG/uvrt/Lcz7F2iUfCMEyOf/T99fV9hOumSRIW4NDPJD8X3r14ViMObvE9o4imS8djdpqjJZ3+kf9fRrI6Q2cecCLrRxwfNhqd2j/yRwALwf+SYfeyaBVTsYn+10+7+QdGPN7W2waTbRxeyZsLmfMbhRtVhYdPb433ccaR6M5UQPf8BURqayvfO1UzjK7QiAy7zT9ZWMcim1uB/GNjJIJ60rPI0x8DDQ1ep6Ffi+e1T7DQl1pJhhOBC3M1a/9opTf5Nq4vtlW3nt4Bmfzw7/8VSzjOfvadTOC7agktiv1ab0txEBt0I0dJF6Mr/xbX5mZdk4sj7snorNG4mEUM1ilP8Kf/YEmK6E7bEWUUZ81iaOsAwweFVEBRyEk8565Q+0FlOt/YTYPO0+2GNTr312zO5QF2Cu9YrAIl2ap5pKZQOUpLLSelRXBDzVwBHVUObpjtio7XJmHQUs0KnHof5ruw5YjScLNom9eYLn7ClvZHcoziLTchbk5GRv/tpJNy7e8b3ZJywej7VCW4jAVmSdxRGfFf227STWNz32bC8P7SN7z6+d+JnfgzvE1n/rO6isOm+k52//ZAL5rZADJjUZd91JOAsEYnh3rX/dzgjNU1DLbpuFV3uo3hA7quFsKDWycgpqJfGaVZ9yGalU+oqDRS+P1NSRaloJTsBZL3A3AoxTGJqOB1aZg8GlJ2SE+yEfAoCRmp01NIU7V24M6N01v1S4xC22PFQyAKVKI86i8KOA9CgfGuYWmSWLWTItVbX/UlSWFs9TkofrJF52BR7bW8+VLKVbaW25wYUFxopP6y3+Fj2mqXYggbKfy3yvHQTFdXassZ+L5T5VKOWebq9WSkEFd/7Zrp1TSzYIW8aP6ozVjdZyLzn2cOoVY38Ja97va7+Y7Q52R4TYp4Gj3LWhk8fuH84elBIU90n8Q3dd/IOPpfpVykxH/tBRFWvjlP9qX+e58cqnJwHLd0KMUxD44FY2VfPqw+ZBKUtrUaoWO9/g6/iR17pbORKYXVA0+ykv5p6gXzIW5T0FaOVyKTaAqtbZ49smHMfvkc9ctqouReDMjoG14cNvPTm3MjJXHPOv8ZNOvXnUOtCxQ2F2yuUpyy7HZX79sIs91NcZDhlXP5P5yz78UJ3qgEAAAAAElFTkSuQmCC">
  	   </div>
      </div>
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
      <div>
        <div class="img_box" style="width: 100%;">
  	    <img src="data:image/png;base64,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">
  	   </div>
      </div>
   </div>
  </div>
  </div>
  
 <div id="section_slide">
   <div style="overflow: hidden;">
   <h2 style="padding: 10px; color: black;"><a href="#" style="color: black;">당신을 위한 추천 ></a></h2>
   <div id="slider-div-2" style="height: auto; max-width: 1500px">
    <div>
      <div class="img_box_2" style="width: 100%; overflow: hidden;">
        <img style="width: 100%" object-fit: cover; src="data:image/png;base64,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">
      </div>
      <p style="padding: 8px; font-size: 20px">이름</p>
  	  <p style="padding: 8px;">가격</p>  
    </div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>9</div>
    <div>10</div>
   </div>
  </div>
 </div>
 
  <div id="section_slide">
   <div style="overflow: hidden;">
   <h2 style="padding: 10px; color: black;"><a href="#" style="color: black;">당신을 위한 추천 ></a></h2>
   <div id="slider-div-3" style="height: auto; max-width: 1500px">
    <div>
      <div class="img_box" style="width: 100%;">
        <img src="data:image/png;base64,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">
      </div>
      <p style="padding: 8px; font-size: 20px">이름</p>
  	  <p style="padding: 8px;">가격</p>  
    </div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>9</div>
    <div>10</div>
   </div>
  </div>
 </div>
  
  
  
</div>
<script>
          $(function(){
            /* $('#slider-div').slick({
                slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
                infinite : true,     //무한 반복 옵션     
                slidesToShow : 5,        // 한 화면에 보여질 컨텐츠 개수
                slidesToScroll : 5,        //스크롤 한번에 움직일 컨텐츠 개수
                speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                arrows : true,         // 옆으로 이동하는 화살표 표시 여부
                dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
                autoplay : false,            // 자동 스크롤 사용 여부
                autoplaySpeed : 5000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
                vertical : false,        // 세로 방향 슬라이드 옵션
                prevArrow : "<button type='button' class='slick-prev' id='slick-prev'><</button>",        // 이전 화살표 모양 설정
                nextArrow : "<button type='button' class='slick-next' id='slick-next'>></button>",        // 다음 화살표 모양 설정
                dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
                draggable : true,     //드래그 가능 여부 
                
                responsive: [ // 반응형 웹 구현 옵션
                    {  
                        breakpoint: 960, //화면 사이즈 960px
                        settings: {
                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                            slidesToShow:3 
                        } 
                    },
                    { 
                        breakpoint: 768, //화면 사이즈 768px
                        settings: {    
                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                            slidesToShow:2 
                        } 
                    }
                ]
 
            });
          }) */

        	    $('#slider-div').slick({
        	        slide: 'div',        
        	        infinite : true,     
        	        slidesToShow : 5,        
        	        slidesToScroll : 5,        
        	        speed : 1000,     
        	        arrows : true,         
        	        dots : false,         
        	        autoplay : false,            
        	        autoplaySpeed : 5000,         
        	        pauseOnHover : true,        
        	        vertical : false,        
        	        prevArrow : "<button type='button' class='slick-prev' id='slick-prev'><span><svg fill='#fff' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 5 9' style='transform: scaleX(-1); width: 20px; height: 20px;'><path stroke='currentColor' d='M1 1l3 3.5L1 8' fill='none' fill-rule='evenodd'></path></svg></span></button>",        
        	        nextArrow : "<button type='button' class='slick-next' id='slick-next'><span><svg fill='white' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 16' style='width: 20px; height: 20px;'><path stroke='currentColor' d='M2 2l4 6L2 14' fill='none' fill-rule='evenodd'></path></svg></span></button>",        
        	        dotsClass : "slick-dots",     
        	        draggable : true,     
        	        centerMode: false, 
        	        responsive: [ 
        	        	{
        	                breakpoint: 960,
        	                settings: {
        	                    slidesToShow: 3 ,
        	                    slidesToScroll : 3, 
        	                }
        	            },
        	            {
        	                breakpoint: 768,
        	                settings: {
        	                    slidesToShow: 2 ,
        	                    slidesToScroll : 2, 
        	                }
        	            }
        	        ]
        	    });
        	});


          
          
          $('#slider-div-2').slick({
        slide: 'div',
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        speed: 1000,
        arrows: true,
        dots: false,
        autoplay: false,
        autoplaySpeed: 5000,
        pauseOnHover: true,
        vertical: false,
        prevArrow: "<button type='button' class='slick-prev' id='slick-prev-2'><span><svg fill='black' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 5 9' style='transform: scaleX(-1); width: 20px; height: 20px;'><path stroke='currentColor' d='M1 1l3 3.5L1 8' fill='none' fill-rule='evenodd'></path></svg></span></button>",
        nextArrow: "<button type='button' class='slick-next' id='slick-next-2'><span><svg fill='black' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 16' style='width: 20px; height: 20px;'><path stroke='currentColor' d='M2 2l4 6L2 14' fill='none' fill-rule='evenodd'></path></svg></span></button>",
        dotsClass: "slick-dots",
        draggable: true,
        centerMode: false, 
        responsive: [ 
        	{
                breakpoint: 960,
                settings: {
                    slidesToShow: 2 ,
                    slidesToScroll : 2, 
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1 ,
                    slidesToScroll : 1, 
                }
            }
        ]
    });
          
          
          $('#slider-div-3').slick({
              slide: 'div',
              infinite: true,
              slidesToShow: 5,
              slidesToScroll: 5,
              speed: 1000,
              arrows: true,
              dots: false,
              autoplay: false,
              autoplaySpeed: 5000,
              pauseOnHover: true,
              vertical: false,
              prevArrow: "<button type='button' class='slick-prev' id='slick-prev-2'><span><svg fill='black' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 5 9' style='transform: scaleX(-1); width: 20px; height: 20px;'><path stroke='currentColor' d='M1 1l3 3.5L1 8' fill='none' fill-rule='evenodd'></path></svg></span></button>",
              nextArrow: "<button type='button' class='slick-next' id='slick-next-2'><span><svg fill='black' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 16' style='width: 20px; height: 20px;'><path stroke='currentColor' d='M2 2l4 6L2 14' fill='none' fill-rule='evenodd'></path></svg></span></button>",
              dotsClass: "slick-dots",
              draggable: true,
              centerMode: false, 
              responsive: [ 
              	{
                      breakpoint: 960,
                      settings: {
                          slidesToShow: 3 ,
                          slidesToScroll : 3, 
                      }
                  },
                  {
                      breakpoint: 768,
                      settings: {
                          slidesToShow: 2 ,
                          slidesToScroll : 2, 
                      }
                  }
              ]
          });
          

          
          
    </script>
    <script>
        
        
     // 새로고침 시 #section_slide 순차적 등장.
        var sectionSlides = document.querySelectorAll("#section_slide");

        function showSectionSlides() {
            sectionSlides.forEach(function(slide, index) {
                var delay = index * 500;
                setTimeout(function() {
                    slide.style.opacity = "1";
                    slide.style.visibility = "visible";
                }, delay);
            });
        }
        window.onload = function() {
            showSectionSlides();
        };
        
        
        document.addEventListener('DOMContentLoaded', function() {
        	  const sectionGridBox = document.querySelector('#section_grid_box');

        	  const observer = new IntersectionObserver(entries => {
        	    entries.forEach(entry => {
        	      if (entry.isIntersecting) {
        	        sectionGridBox.classList.add('visible');
        	        observer.unobserve(entry.target); // 요소가 나타난 후에는 더 이상 관찰하지 않습니다.
        	      }
        	    });
        	  });

        	  observer.observe(sectionGridBox);
        	});
        
        //뷰포트
        document.addEventListener('DOMContentLoaded', function() {
        	  const sectionGridBox2Items = document.querySelectorAll('#section_grid_box2_item');

        	  const observer = new IntersectionObserver(entries => {
        	    entries.forEach(entry => {
        	      if (entry.isIntersecting) {
        	        entry.target.classList.add('visible');
        	      }
        	    });
        	  });

        	  sectionGridBox2Items.forEach(item => {
        	    observer.observe(item);
        	  });
        	});


        
</script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html>
