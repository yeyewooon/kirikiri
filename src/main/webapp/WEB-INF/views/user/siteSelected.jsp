<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!--bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--slick carousel -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<!-- Font -->
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>


<style>

@font-face {
            font-family: 'MICEGothic Bold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
}


/* 네비바  */
body {
	background-color: #f6f7f9;
}

* {
	box-sizing: border-box;
	font-family: "MICEGothic Bold"; 
}

/* header 반응형 */
@media ( max-width : 768px) {
	#navLogo {
		display: none;
	}
	#myPageIcon {
		display: none;
	}
	#cartIcon {
		display: none;
	}
	#menu {
		display: none;
	}
}

/* header */
#navLogo {
	width: 150px;
	height: 100px;
}

#logoImgs {
	width: 100%;
	height: 100%;
}

@media ( min-width : 768px) {
	#navibar {
		display: none;
	}
}


/* 네비바 드롭다운 */
.dropdown-toggle:hover {
   color: #83bf7b;
   border-color: aliceblue;
}

.dropdown:hover .dropdown-menu {
   display: block;
   margin-top: 0;
   font-weight: bold;
}

/* header 반응형 끝 */
#logoImg {
	width: 50%;
}

.mainIcon i {
	color: #316f8c;
}

.imgBox {
	width: 240px;
	height: 240px;
	background-color: yellowgreen;
	border-radius: 4px;
}

.imgBox img {
	width: 240px;
	height: 240px;
}

.mainFooter {
	height: 70px;
}

#search-addon {
	cursor: pointer;
}

ul {
	list-style: none;
	padding: 0;
}


/* 슬라이드 */
.locationPic {
      width: 100px;
      height: 100px;
      overflow: hidden;
    }

    .locationPic img {
      width: 100%;
      height: 100%;
  } 

/* body content */
.content {
	width: 100%;
	margin: 0px;
	background-color: rgb(245, 245, 245);
}

.card {
	width: 18rem;
	box-shadow: 3px 3px 5px 5px rgb(182, 181, 181);
	cursor:pointer;
}

.card>img {
	width: 100%;
}

.card-img-top {
	width: 18rem;
	height: 13rem;
}

.card-text-category {
	width: fit-content;
	padding: 4px;
	background-color: #e26b8b;
	height: 22px;
	border-radius: 5px;
	font-size: 14px;
}

/* footer */
.footerBox {
	height: 0px;
}

footer.footer {
	padding-top: 2rem;
	padding-bottom: 2rem;
	background-color: #f6f7f9;
}

.footer a {
	text-decoration: none;
	color: black;
	font-weight: 40px;
	font-weight: bold;
}

.footer-imgBox>img {
	width: 100%;
	height: 100%;
}

img {
	max-width: 100%;
	height: auto;
}

.slider {
	width: 80%;
	margin: 0px auto;
}

.slider .slick-slide {
	margin: 10px;
}

.slick-prev:before, .slick-next:before {
	color: #444444;
}

/* 사이즈 */
.categoryMapper, .locationMapper {
	width: 120px;
	color: #62656e;
}

.categoryMapper:hover {
	width: 120px;
	color: cornflowerblue;
	cursor: pointer;
}

.locationMapper:hover {
	width: 120px;
	color: cornflowerblue;
	cursor: pointer;
}

#categoryList {
	display:none;
}

/* 지역,카테고리 버튼*/
#locationBtn, #categoryBtn{
	cursor:pointer;
}
.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    padding: 10px;
    border: #000000 solid 3px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b05_3d_roll div:nth-child(1) {
    color: #000000;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll div:nth-child(2) {
    color: #000000;
    background-color: #ffffff;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

.preserve-3d {
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

body {
    padding: 0;
    margin: 0;
    border: 0;
    overflow-x: none;
    background-color: #ffffff;
    font-family: Roboto Condensed, sans-serif;
    font-size: 15px;
    font-smooth: always;
    -webkit-font-smoothing: antialiased;
}


@media screen and (max-width: 1260px) {
    .back {
        width: 50%;
    }
}

@media screen and (max-width: 840px) {
    .back {
        width: 100%;
    }
}

.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    top: 50%;
    left: 50%;
    width: 100px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}


</style>

</head>

<body>
	  <!--네비바-->
      <header class="mb-3 border-bottom">
      <div style="background-color : #fff;">
      <div class="container">
         <!-- 접혔을 때 nav -->
         <nav id="navibar" class="navbar navbar-expand-md navbar-light"
            aria-label="Main navigation">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-10">
                     <a class="navbar-brand mb-2 mb-lg-0" href="/">
                        <div class="title-box">
                           <img id="logoImg" src="/resources/images/kiri.jpg">
                        </div>
                     </a>
                  </div>
                  <!-- toggle button -->
                  <div class="col-2 d-flex align-items-center">
                     <button class="navbar-toggler" type="button"
                        data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                     </button>
                  </div>
                  <!-- 메뉴 -->
                  <div class="collapse navbar-collapse justify-content-end"
                     id="navbarNavDropdown">
                     <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="">자유게시판</a></li>
                           <c:if test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link" href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link" href="/signup/toSignupAgree">회원가입</a></li>
                           </c:if>
                           <c:if test = "${not empty loginSession && loginSession.user_email eq 'admin'}">
                              <li class="nav-item"><a class="nav-link" href="/mem/myPage">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href="/admin/toAdmin">관리자페이지 이동</a></li>
                              <li class="nav-item"><a class="nav-link" href="/login/toLogout">로그아웃</a></li>
                           </c:if>
                           <c:if test = "${not empty loginSession && loginSession.user_email ne 'admin'}">
                              <li class="nav-item"><a class="nav-link" href="/mem/myPage">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href="/login/toLogout">로그아웃</a></li>
                           </c:if>
                     </ul>
                  </div>
               </div>

            </div>
         </nav>
         <!-- 펼쳐졌을 때 nav -->
         <nav id="menu" class="navbar navbar-expand-md w-100 navbar-light"
            aria-label="Main navigation">
            <div class="row w-100 align-items-center">
               <div class="col-5 d-flex justify-content-center">
                  <ul class="navbar-nav mb-2 mb-lg-0">
                     <li class="nav-item"><a class="nav-link mx-2" href="/board/toBoard">자유
                           게시판</a></li>
                  </ul>
               </div>

               <!-- logo -->
               <div class="col-2">
                  <a href="/" id="navLogo" class="mb-2 mb-lg-0"> <img
                     id="logoImgs" src="/resources/images/kiri.jpg">

                  </a>
               </div>

               <div class="col-5">
                  <div class="row align-items-center justify-content-center">
                     <div class="col-auto">
                        <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                           <c:if test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link"
                                 href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 href="/signup/toSignupAgree">회원가입</a></li>
                           </c:if>
                        </ul>
                     </div>
                     <div class="col-auto user">
                  <c:if test = "${not empty loginSession && loginSession.user_email eq 'admin'}">
                     <div class="dropdown text-end">
                        <a href="/" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"> 
                        <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small"
                           aria-labelledby="dropdownUser1">
                           <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                           <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
                           <li><hr class="dropdown-divider"></li>
                           <li><a class="dropdown-item" href="/admin/toAdmin">관리자 페이지이동</a></li>
                           <li><a class="dropdown-item" href="/login/toLogout">로그아웃</a></li>
                        </ul>
                     </div>
                  </c:if> 
                  <c:if test = "${not empty loginSession && loginSession.user_email ne 'admin'}">
                     <div class="dropdown text-end">
                        <a href="/" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"> 
                        <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small"
                           aria-labelledby="dropdownUser1">
                           <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                           <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
                           <li><hr class="dropdown-divider"></li>
                           <li><a class="dropdown-item" href="/login/toLogout">로그아웃</a></li>
                        </ul>
                     </div>
                  </c:if> 
                     </div>
                  </div>
               </div>
            </div>
         </nav>
      </div>
      </div>
   </header>
	<div class="container">
	<div class="back row">
	    <div class="col-md-4 button_base b05_3d_roll locationBtn" id="locationBtn">
	        <div>지역</div>
	        <div>지역</div>
	    </div>
	    <div class="col-md-4 button_base b05_3d_roll categoryBtn" id="categoryBtn">
	        <div>카테고리</div>
	        <div>카테고리</div>
	    </div>
	    <div class="col-md-4">
	    </div>
	</div>
 <!--지역 설정 슬라이더-->
   <div id="locationList" class="responsive mt-5">
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic">
        <img src = "/resources/images/slide/지역9.png">
      </div>
      <span class="locationText mt-1">
        서울특별시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역2.png">
      </div>
      <span class="locationText mt-1">
        인천광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역3.png">
      </div>
      <span class="locationText mt-1">
        대전광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역4.png">
      </div>
      <span class="locationText mt-1">
        광주광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역5.png">
      </div>
      <span class="locationText mt-1">
        대구광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역6.png">
      </div>
      <span class="locationText mt-1">
        울산광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역22.png">
      </div>
      <span class="locationText mt-1">
        부산광역시
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역8.png">
      </div>
      <span class="locationText mt-1">
        경기도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역9.png">
      </div>
      <span class="locationText mt-1">
        강원도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역10.png">
      </div>
      <span class="locationText mt-1">
       	충청북도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역11.png">
      </div>
      <span class="locationText mt-1">
        충청남도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역12.png">
      </div>
      <span class="locationText mt-1">
        전라북도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역14.png">
      </div>
      <span class="locationText mt-1">
        전라남도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역13.png">
      </div>
      <span class="locationText mt-1">
        경상북도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
       <img src = "/resources/images/slide/지역15.png">
      </div>
      <span class="locationText mt-1">
        경상남도
      </span>
    </div>
    <div class="locationMapper d-flex flex-column align-items-center justify-content-center">
      <div class="locationPic" style="font-size: 40px;">
        <img src = "/resources/images/slide/지역19.png">
      </div>
      <span class="locationText mt-1">
        제주도
      </span>
    </div>
  </div>
		<!--카테고리 설정 슬라이더-->
		<div id="categoryList" class="responsive mt-5">
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center"
				id="아웃도어/여행">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-plane-departure"></i>
				</div>
				<span class="categoryText mt-1"> 아웃도어/여행 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-baseball"></i>
				</div>
				<span class="categoryText mt-1"> 운동/스포츠 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-language"></i>
				</div>
				<span class="categoryText mt-1"> 외국어/언어 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-dog"></i>
				</div>
				<span class="categoryText mt-1"> 반려동물 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-guitar"></i>
				</div>
				<span class="categoryText mt-1"> 음악/악기 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-democrat"></i>
				</div>
				<span class="categoryText mt-1"> 공예/만들기 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-people-group"></i>
				</div>
				<span class="categoryText mt-1"> 댄스/무용 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-book"></i>
				</div>
				<span class="categoryText mt-1"> 인문학/책/글 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-camera"></i>
				</div>
				<span class="categoryText mt-1"> 사진/영상 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-gamepad"></i>
				</div>
				<span class="categoryText mt-1"> 게임/오락 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-kitchen-set"></i>
				</div>
				<span class="categoryText mt-1"> 요리/제조 </span>
			</div>
			<div
				class="categoryMapper d-flex flex-column align-items-center justify-content-center">
				<div class="categoryPic" style="font-size: 66px;">
					<i class="fa-solid fa-microphone-stand"></i>
				</div>
				<span class="categoryText mt-1"> 문화/공연/축제 </span>
			</div>
		</div>
	</div>

	<div class="container">
	<!-- 모임 card 캐러셀 -->
	<div class="row content mt-4">
		<div class="col p-0">
			<div class="content2">
				<div class="imgContainer">
					<div class="row" style="background-color: #f6f7f9;">
						<c:forEach items="${groupList}" var="dto">
							<div class="col-md-4 d-flex justify-content-center p-4">
								<div class="card">
									<c:choose>
										<c:when test="${dto.sys_name ne null}">
											<img src="/group_profile/${dto.sys_name}" id="profile_image"
												class="card-img-top">
										</c:when>
										<c:otherwise>
											<img src="/resources/images/메인사진2(배경).png" id="profile_image"
												class="card-img-top">
										</c:otherwise>
									</c:choose>
									<span class="d-none">${dto.seq_group}</span>
									<div class="card-body">
										<div
											class="card-text card-text-category d-flex justify-content-center align-items-center" style="color:#fff;">
											${dto.group_category}</div>
										<div class="card-text mt-1">
											<strong>${dto.group_title}</strong>
										</div>
										<div class="card-text d-flex justify-content-end">
											<i class="fa-solid fa-location-dot"></i><span class="ms-2">${dto.group_site}</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



	<script>
	

// 지역 클릭시
$('#locationBtn').on("click", function() {
    $('#categoryList').css('display', 'none'); // 카테고리 안보이게
    $('#locationList').css('display', 'block'); // 지역 보이게
    $('#locationList').get(0).slick.setPosition();
    $('.locationBtn').children().eq(1).css({'background-color':'black', 'color':'white'});
    $('.categoryBtn').children().eq(1).css({'background-color':'white', 'color':'black'});
});

// 카테고리 클릭시
$('#categoryBtn').on("click", function() {
    $('#categoryList').css('display', 'block'); // 카테고리 보이게
    $('#locationList').css('display', 'none'); // 지역 안보이게
    $('#categoryList').get(0).slick.setPosition();
    $('.categoryBtn').children().eq(1).css({'background-color':'black', 'color':'white'});
    $('.locationBtn').children().eq(1).css({'background-color':'white', 'color':'black'});
});

// 슬라이더 함수
$(window).on('load', function() {
  $('.responsive').slick({
  dots: false,
  infinite: true,
  speed: 300,
  slidesToShow: 6,
  slidesToScroll: 6,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: false
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});
});




// 해당 모임 상세페이지 이동
$(".card").on("click",function() {
    let findSeq_group = $(this).find('span').html(); // 공백이 포함되서 나옴
    let seq_group = findSeq_group.trim(); // 공백을 없앰
    console.log(seq_group);
    location.href = "/group/toGroupDetail?seq_group="+seq_group; 
  })


  // 지역으로 모임 조회
  $(".locationMapper").on("click",function() {
	console.log("hi");
    let locationText = $(this).find('span').html(); // 공백이 포함되서 나옴
    let group_site = locationText.trim(); // 공백을 없앰
    location.href = "/user/toUserSelectedGroupList?group_site="+group_site; 
  })
  
  // 카테고리로로 모임 조회
  $(".categoryMapper").on("click",function(e) {
    let categoryText = $(this).find('span').html(); // 공백이 포함되서 나옴
    let group_category = categoryText.trim(); // 공백을 없앰
    location.href = "/user/toUserSelectedGroupList?group_category="+group_category;
  })


  </script>
</body>

</html>