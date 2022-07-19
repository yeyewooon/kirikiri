<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
   crossorigin="anonymous"></script>

<title>끼리끼리</title>
<style>
* {
   box-sizing: border-box;
   font-family: 'OTWelcomeRA';
}

#mainText {
   font-family: '양진체';
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

/* header 반응형 끝 */
#logoImg {
   width: 50%;
}

/*맨위 사진*/
.topimg {
   background-color: #d2e3ec;
   width: 100%;
}

.txtBox div {
   color: rgba(85, 85, 95, 0.993);
}

.txtBox>div:first-child {
   font-size: 35px;
   color: navy;
   text-shadow: 3px 3px white;
}

/* 동그라미 세개 */
.circleImg {
   width: 200px;
   height: 200px;
   background-color: #faead2;
   border-radius: 50%;
}

.circleTitle {
   font-size: 26px;
   color: #83c8e5;
}

#circle_img {
   width: 100%;
   height: 100%;
   border-radius: 50%;
}

/* 네모네모 영역 */
.mainImg {
   object-fit: cover;
}

#bestParty {
   background-color: #e8f5ed;
   font-family: 'Do Hyeon', sans-serif;
}

a {
   text-decoration: none;
   color: black;
}

/*모임영역 카드6개*/
/* body menu */
.menu {
   background-color: #e0ecf3;
   width: 100%;
   height: 100px;
   align-items: center;
   margin-top : 40px;
}

.btn-group {
   width: 100%;
   background-color: #e0ecf3;
}

.active, .dropnav {
   font-weight: bold;
   color: #1d76c9;
   font-size: 30px;
   cursor: pointer;
}

.active:hover {
   transition: 0.8s ease-in;
   transform: scale(1.1);
   transform: translate(0, -5px);
}

.show1, .show {
   z-index: 1;
}

.dropdown-menu[data-bs-popper] {
   top: 70%;
}

.text {
   color: #1d76c9;
   font-weight: bold;
   font-size: 30px;
   cursor: pointer;
}

.text:hover {
   transition: 0.8s ease-in;
   transform: scale(1.1);
   transform: translate(0, -5px);
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
}

.card>img {
   width: 100%;
}

.card-img-top {
   width: 18rem;
   height: 13rem;
}

.imgContainer {
   text-align: center;
}

.more {
   width: 100%;
   height: 50px;
   text-align: center;
   margin-top: 20px;
   background-color: lightgray;
}

.more>a {
   text-decoration: none;
   color: black;
}

button {
   margin-top: 50px;
   background-color: rgb(138, 136, 136);
   border: none;
   cursor: pointer;
   outline: none;
   padding: 0;
   height: 50px;
   line-height: 32px;
   width: 250px;
   border-radius: 16px;
}

/*앱 광고*/

.phoneImgBox {
   height: 400px;
}

.phoneImgBox img {
   height: 400px;
}

.phoneContainer {
   position: relative;
}

.appBox {
   width: 160px;
   height: 40px;
   background-color: black;
   border-radius: 6px;
   padding: 0;
}

.appBoxText {
   font-size: 14px;
   padding: 0;
}

.appleLogo {
   font-size: 30px;
}

.googleLogo {
   font-size: 28px;
}

.downLoadSmallText {
   font-size: 10px;
}
p{
   text-align : center;
}
/*풋터 영역*/
.footerBox {
   height: 0px;
}

footer.footer {
   padding-top: 2rem;
   padding-bottom: 2rem;
   background-color: #ffffff;
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

/* 눈누 폰트 */
@font-face {
   font-family: 'OTWelcomeRA';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: '양진체';
   src:
      url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
</style>
</head>
<body>
   <header class="mb-3 border-bottom">
      <div class="container">
         <!-- 접혔을 때 nav -->
         <nav id="navibar" class="navbar navbar-expand-md navbar-light"
            aria-label="Main navigation">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-10">
                     <a class="navbar-brand mb-2 mb-lg-0" href="#">
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
                        <li class="nav-item"><a class="nav-link" href=" ">자유게시판</a></li>
                        <c:choose>
                           <c:when test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link" href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link" href="/login/signup">회원가입</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="nav-item"><a class="nav-link" href=" ">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href=" ">로그아웃</a></li>
                           </c:otherwise>
                        </c:choose>


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
                     <li class="nav-item"><a class="nav-link mx-2" href="">자유
                           게시판</a></li>
                  </ul>
               </div>

               <!-- logo -->
               <div class="col-2">
                  <a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0"> <img
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
                                 href="/login/signup"">회원가입</a></li>
                           </c:if>
                        </ul>
                     </div>

                     <div class="col-auto user">
                        <c:if test="${not empty loginSession}">
                           <div class="dropdown text-end">
                              <a href="#"
                                 class="d-block link-dark text-decoration-none dropdown-toggle"
                                 id="dropdownUser1" data-bs-toggle="dropdown"
                                 aria-expanded="false"> <img
                                 src="/resources/images/profile.jpg" alt="mdo" width="32"
                                 height="32" class="rounded-circle">
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="#">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="#">모임생성</a></li>
                                 <li><hr class="dropdown-divider"></li>
                                 <li><a class="dropdown-item" href="#">로그아웃</a></li>
                              </ul>
                           </div>
                        </c:if>
                     </div>


                  </div>
               </div>
            </div>
         </nav>
      </div>
   </header>
   <div class="container">
      <!-- 그림 -->
      <div class="topimg row">
         <div class="col-md-6">
            <img src="/resources/images/메인사진1(배경x).png" id="topimg">
         </div>
         <div
            class="txtBox col-md-6 d-flex flex-column align-items-center justify-content-center">
            <div id="mainText">'끼리끼리'와 함께하는 취미생활</div>
            <div class="mt-3 w-75">올해 하고 싶은 취미가 무엇이든 끼리끼리가 도와드릴 수 있습니다.
               이제부터 사람들과 취미에 대해 이야기하고 싶다면 '끼리끼리'를 찾아주세요. 매일 많은 사람들과 소통하고 싶다면 가입하여
               즐거운 시간을 보내세요.</div>
            <div class="mt-4 w-75">취미가 없고 지루한 일상이 싫다면 모임을 가입하세요. 즐거운 모임으로
               새로운 세상을 찾아요.</div>
         </div>

      </div>

      <!--동그라미세개-->
      <!--상단 텍스트 -->
      <div class="row mt-5">
         <div class="col-md-12 text-center">
            <h3>
               <strong>끼리끼리가 이루어지는 방식</strong>
            </h3>
            <p>
               온라인과 대면 이벤트를 통해 관심사를 공유할 새로운 사람들을 만나보세요.<br>계정을 무료로 생설할 수
               있습니다.
            </p>
         </div>
      </div>

      <!--원그림-->
      <div class="row">
         <div
            class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
            <div class="circleImg" data-aos="flip-left" data-aos-duration="1000">
               <img src="/resources/images/aksu.png" id="circle_img">
            </div>
            <div class="w-100">
               <p class="text-center mt-4 circleTitle">그룹 가입하기</p>
               <p>공통된 관심사인 사람을 만나고, 자신의 커뮤니티를 찾아보세요.</p>
            </div>
         </div>
         <div
            class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
            <div class="circleImg" data-aos="flip-left" data-aos-duration="1000"
               data-aos-delay="100">
               <img src="/resources/images/dodbogi.png" id="circle_img">
            </div>
            <div class="w-100">
               <p class="text-center mt-4 circleTitle">이벤트 찾기</p>
               <p>자신이 생각하시는 모든 주제에 대한 이벤트가 이루어집니다!</p>
            </div>
         </div>
         <div
            class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
            <div class="circleImg" data-aos="flip-left" data-aos-duration="1000"
               data-aos-delay="200">
               <img src="/resources/images/chatting.png" id="circle_img">
            </div>
            <div class="w-100">
               <p class="text-center mt-4 circleTitle">모임간 소통</p>
               <p>사람들을 모으고 공통의 관심사를 찾기 위해 전문가가 될 필요는 없죠!</p>
            </div>
         </div>
      </div>

      <!--가입 하기 버튼-->
      <div class="row mt-2">
         <div class="signUpBox col text-center">
            <button type="button" class="btn btn-outline-primary">가입하기</button>
         </div>
      </div>

      <!-- 네모네모 -->
      <div id="bestParty" class="p-4 mt-5">
         <div class="content-1" data-aos="fade-left" data-aos-duration="1000">
            <div class="row g-0 align-items-center">
               <div class="col-lg-5 text-end ps-5">
                  <div class="fs-2">모임 이름 &bullet;</div>
                  <div class="fs-3">글 제목</div>
                  <div class="my-4">모임 후기 샬라샬라 적어요 샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라</div>
                  <div>
                     <a href="#">글 보러 가기</a>
                  </div>
               </div>
               <div class="mainImg col-lg-6 ms-auto d-flex align-items-center">
                  <img src="/resources/images/메인사진2(배경).png" class="img-fluid">
               </div>
            </div>
         </div>

         <div class="content-2 mt-3" data-aos="fade-right"
            data-aos-duration="1000">
            <div class="row g-0 mt-5 align-items-center">
               <div class="mainImg col-lg-6 mb-4 mb-lg-0">
                  <img src="/resources/images/메인사진2(배경).png" class="img-fluid">
               </div>
               <div class="col-lg-5 ms-auto pe-5">
                  <div class="fs-2">모임 이름 &bullet;</div>
                  <div class="fs-3">글 제목</div>
                  <div class="my-4">모임 후기 샬라샬라 적어요 샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라</div>
                  <div>
                     <a href="#">글 보러 가기</a>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- 애플리케이션 -->
      <div class="acontainer mt-5">
         <div class="row mt-3">
            <div
               class="col-md-5 phoneImgBox d-flex align-items-center justify-content-center">
               <img src="/resources/images/smartphone.png">
            </div>
            <div
               class="col-md-7 d-flex align-items-center justify-content-center">
               <div
                  class="phoneTextBox d-flex flex-column justify-content-center align-items-center mt-2">
                  <div class="downloadHead">
                     <h1>
                        <span style="font-size: 50px; color: #4285f4;">끼</span><span
                           style="font-size: 50px; color: #9e9e9e;">리</span><span
                           style="font-size: 50px; color: #4285f4;">끼</span><span
                           style="font-size: 50px; color: #9e9e9e;">리</span> 모바일 앱 출시!
                     </h1>
                  </div>
                  <div class="downloadTtitle mt-3">
                     <strong>이제 끼리끼리를 앱에서도 사용할 수 있습니다.</strong>
                  </div>
                  <div class="downloadContent">
                     <label><strong style="font-size: 30px;">남은 시간</strong><br></label>
                     <strong id="sample01" style="color: red"></strong>
                  </div>
                  <div class="downloadBtn mt-3 d-flex">
                     <div class="row appBox">
                        <div class="col-4 text-center mt-1" style="color: #fff;">
                           <i class="fa-brands fa-apple w-100 appleLogo"></i>
                        </div>
                        <div
                           class="col-8 appBoxText d-flex flex-column justify-content-center"
                           style="color: #fff;">
                           <span><strong>AppStore</strong>에서</span> <span
                              class="downLoadSmallText">다운로드 하기</span>
                        </div>
                     </div>
                     <div class="row appBox ms-5">
                        <div class="col-4 text-center mt-1" style="color: #fff;">
                           <i class="fa-brands fa-google-play w-100 googleLogo"></i>
                        </div>
                        <div
                           class="col-8 appBoxText d-flex flex-column justify-content-center"
                           style="color: #fff;">
                           <span><strong>Android</strong>에서</span> <span
                              class="downLoadSmallText">다운로드 하기</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- 모임 나타나기 -->
      <!-- menubar -->
      <div class="row menu ms-0">
         <div class="col-4 d-flex justify-content-end text">ALL</div>
         <div class="col-4 d-flex justify-content-center text">NEW</div>
         <div class="col-4 d-flex justify-content-start text">BEST</div>
      </div>
      <!-- 모임 card 캐러셀 -->
      <div class="row content">
         <div class="col p-0">
            <div class="content2">
               <div class="imgContainer">
                  <div class="row">
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="imgContainer">
                  <div class="row">
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 d-flex justify-content-center p-4">
                        <div class="card">
                           <img src="/resources/images/profile.jpg" class="card-img-top"
                              alt="..." />
                           <div class="card-body">
                              <p class="card-text">Some quick example text to build on
                                 the card title and make up the bulk of the card's content.</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-12" style="width: 100%">
               <div class="d-flex justify-content-center align-items-center more">
                  <a href="">더보기 ▼</a>
               </div>
            </div>
         </div>
      </div>

      <!-- Footer-->
      <footer class="footer mt-5">
         <div class="row">
            <div class="col-lg-3 footer-imgBox">
               <img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다.">
            </div>
            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
               <ul class="list-inline mb-2">
                  <li class="list-inline-item"><a href="#!">공지사항</a></li>
                  <li class="list-inline-item">⋅</li>
                  <c:choose>
                     <c:when test="${not empty loginSession}">
                        <li class="list-inline-item"><a href="member/toMyPage">마이페이지</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="list-inline-item"><a href="member/toSignup">회원가입</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="/login/toLogin">로그인</a></li>
                     </c:otherwise>
                  </c:choose>
                  <li class="list-inline-item">⋅</li>
                  <li class="list-inline-item"><a href="#!">책임의 한계 및 법적고지</a></li>
                  <li class="list-inline-item">⋅</li>
                  <li class="list-inline-item"><a href="#!"
                     style="color: red; font-weight: bold;">개인정보처리방침</a></li>
               </ul>
               <p class="text-muted small mb-4 mb-lg-0">끼리끼리(주) 대표 : 이호준 |
                  개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
               <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로
                  57 이레빌딩</p>
               <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
                  2022. All Rights Reserved.</p>
            </div>
            <div class="col-lg-3 h-100 text-center text-lg-end my-auto">
               <ul class="list-inline mb-0">
                  <li class="list-inline-item me-4"><a
                     href="https://ko-kr.facebook.com"><i class="bi-facebook fs-3"></i></a></li>
                  <li class="list-inline-item me-4"><a
                     href="https://twitter.com/?lang=ko"><i
                        class="bi-twitter fs-3"></i></a></li>
                  <li class="list-inline-item"><a
                     href="https://www.instagram.com/"><i
                        class="bi-instagram fs-3"></i></a></li>
               </ul>
            </div>
         </div>
      </footer>
   </div>


   <!-- AOS 스크립트 시작 -->
   <script>
      AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
      const countDownTimer = function(id, date) {
         var _vDate = new Date(date); // 전달 받은 일자
         var _second = 1000;
         var _minute = _second * 60;
         var _hour = _minute * 60;
         var _day = _hour * 24;
         var timer;

         function showRemaining() {
            var now = new Date();
            var distDt = _vDate - now;

            if (distDt < 0) {
               clearInterval(timer);
               document.getElementById(id).textContent = "해당 이벤트가 종료 되었습니다!";
               return;
            }

            var days = Math.floor(distDt / _day);
            var hours = Math.floor((distDt % _day) / _hour);
            var minutes = Math.floor((distDt % _hour) / _minute);
            var seconds = Math.floor((distDt % _minute) / _second);

            document.getElementById(id).textContent = days + "일 ";
            document.getElementById(id).textContent += hours + "시간 ";
            document.getElementById(id).textContent += minutes + "분 ";
            document.getElementById(id).textContent += seconds + "초";
         }

         timer = setInterval(showRemaining, 1000);
      };

      var dateObj = new Date();
      dateObj.setDate(dateObj.getDate() + 1);

      countDownTimer("sample01", dateObj); // 내일까지
      countDownTimer("sample02", "04/01/2024 00:00 AM"); // 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다.
      countDownTimer("sample03", "04/01/2024"); // 2024년 4월 1일까지
      countDownTimer("sample04", "04/01/2019"); // 2024년 4월 1일까지
   </script>
</body>
</html>