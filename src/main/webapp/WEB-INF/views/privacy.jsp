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
<title>개인정보처리방침</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
crossorigin="anonymous">
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
crossorigin="anonymous"></script>
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js"
crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
rel="stylesheet">
<style>
/* header */
header {
   font-family: 'MICEGothic Bold';
}

.border-bottom{
    background-color: white;
}

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

.groupHeaderInfo {
   height: 480px;
}

/* 바디*/
body {
	background-color: #d2e3ec;
}
.privacyBox {
	width: 1000px;
	height: auto;
	border: 1px solid d2e3ec;
	text-align: left;
	margin: auto;
	background-color: #d2e3ec;
	margin-bottom: 150px;
	margin-top: 70px;
}

#privacyForm {
	padding: 20px;
	margin-top: 3000px;
	width: 93%;
	height: 100%;
	margin: auto;
	border: 1px solid d2e3ec;
	background-color: white;
}
.privacyBox > span{
    margin: 15px;
}

/* footer */
/*풋터 영역*/
.footer-imgBox img{
   max-width: 100%;
}

.footerWrapper{
   background-color: white;
   font-family: "MICEGothic Bold";
   font-size: 15px;
}
.footerBox {
   height: 0px;
}

footer.footer {
   padding-top: 2rem;
   padding-bottom: 2rem;
   background-color: white;
}

.footer a {
   text-decoration: none;
   color: black;
   font-weight: 40px;
   font-weight: bold;
}

.footer-imgBox>img {
   height: 100%;
   text-align:center;
}
.footer-imgBox {
   height: 100%;
   text-align:center;
}
</style>

</style>
</head>
<body>
   <!--네비바-->
   <header class="mb-3 border-bottom" style="box-shadow: 2px 1px 6px 1px #bfbfbf;">
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
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogin">로그인</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/signup/toSignupAgree">회원가입</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email eq 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/admin/toAdmin">관리자페이지 이동</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
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
                     <li class="nav-item"><a class="nav-link mx-2"
                        href="/board/toBoard" style="font-size:18px;">자유 게시판</a></li>
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
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <div class="dropdown text-end">
                              <a href="/"
                                 class="d-block link-dark text-decoration-none dropdown-toggle"
                                 id="dropdownUser1" data-bs-toggle="dropdown"
                                 aria-expanded="false"> 
                                 <c:if test="${loginSession.user_image eq null}">
                                    <img src="/resources/images/profile.jpg" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                                 <c:if test="${loginSession.user_image ne null}">
                                    <img src="/profile/${loginSession.user_image }" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider" style="margin:0px;">
                                 </li>
                                  <c:if test="${loginType ne 'kakao'}">
                                  	 <li><a class="dropdown-item mt-2" href="/login/toLogout">로그아웃</a></li>
                                  </c:if>
	                              <c:if test="${loginType eq 'kakao'}">
	                                 <li><a class="dropdown-item mt-2" href="${kakaoLogout}">로그아웃</a></li>
	                              </c:if>
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
    <div class="container privacyBox">
        <div id="privacyForm">
	        <div class="row" style="text-align: center;">
				<div class="col">
					<img src="/resources/images/kirilogo.png" alt="오류발생">
				</div>
			</div>
            <span>
                끼리끼리 개인정보 처리방침<br>
                정보통신망 이용촉진 등에 관한 법률 등 관련 법률에 의한 개인정보 보호규정 및 정보통신부가 제정한 개인정보지침을 준수하고 있습니다.<br>
                <br>
                1. 개인정보의 수집 항목<br>
                원활한 서비스 이용과 고객과의 소통을 위해 수집합니다.<br>
                • 필수항목: 아이디, 비밀번호, 이메일<br>
                • 자동수집항목: IP 주소, 접속 기록, 쿠키 등<br>
                <br>
                2. 개인정보의 수집 방법<br>
                회원 가입 시에 필수항목 기재를 요청합니다.<br>
                <br>
                3. 개인정보의 수집 이용 목적<br>
                • 아이디, 비밀번호, 이메일: 회원 가입시에 사용자확인, 중복가입 방지, 부정 이용 방지를 위한 목적으로 사용합니다.<br>
                • 이용자의 IP 주소, 접속 기록 등: 불량회원의 부정 이용방지와 비인가 사용방지, 통계학적 분석에 사용합니다.<br>
                <br>
                4. 개인정보 공유 및 제공<br>
                회원의 동의가 있거나 법률의 규정 또는 수사목적으로 법령에 정해진 절차와 방법에 따른 수사기관의 요구에 의한 경우를 제외하고,<br>
                어떠한 경우에도 본 방침을 넘어 이용자의 개인정보를 이용하거나 외부에 공개하지 않습니다.<br>
                대한민국 경찰서에서 통신자료제공 요청이 온 경우에는 개인정보를 경찰서에 제공합니다.<br>
                <br>
                5. 개인정보의 위탁<br>
                회원의 동의 없이 개인정보를 외부에 위탁하지 않습니다.<br>
                <br>
                6. 개인정보의 보유 및 이용기간<br>
                - 가입 회원정보는 탈퇴할 시 3년간 보관 후 파기됩니다. 이 때 개인정보를 별도로 분리하여 별도로 저장 및 관리합니다.<br>
                - 단, 게시물 및 댓글의 내용은 사이트 폐쇄 시까지 보관합니다.<br>
                - 악성 사용자 재가입을 막기 위해, 단일 암호화 기법으로 해쉬 방식으로 일부 개인정보의 해쉬를 영구적으로 저장하여 가입 제한을 할 수 있다<br>
                (이 때 개인정보 자체는 저장되지 않음).<br>
                <br>
                7. 개인정보의 파기절차 및 방법<br>
                • 파기절차: 가입 회원정보는 탈퇴 후 3년간 보관한 후, 어떠한 용도로도 열람 또는 이용할 수 없도록 파기 처리합니다.<br>
                • 파기 방법: 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
                <br>
                8. 이용자 및 법정대리인의 권리와 그 행사방법<br>
                이용자는 언제든지 "내 정보" > "회원 정보 수정"에서 자신의 개인정보를 조회하거나 수정ㆍ삭제할 수 있으며, 자신의 개인정보에 대한<br> 열람을 요청할 수 있습니다.<br>
                이용자는 언제든지 개인정보 처리의 정지를 요청할 수 있으며, 법률에 특별한 규정이 있는 등의 경우에는 처리정지 요청을 거부할 수 있습니다.<br>
                이용자는 언제든지 "탈퇴" 등을 통해 개인정보의 수집 및 이용 동의를 철회할 수 있습니다.<br>
                만 14세 미만 아동의 경우, 법정대리인이 아동의 개인정보를 조회하거나 수정 및 삭제, 처리정지, 수집 및 이용 동의를 철회할 권리를 가집니다.<br>
                이용자 및 법정대리인의 권리는 "회원정보" 페이지 등에서 직접 처리하거나, "문의" 및 이메일을 통해 요청할 수 있습니다.<br>
                <br>
                9. 쿠키(Cookie)의 설치, 운영 및 거부<br>
                • 쿠키: 웹 사이트를 운영하는데 이용되는 서버가 사용자의 브라우저에 보내는 정보 파일로 사용자의 컴퓨터 하드디스크에 저장되기도 합니다.<br>
                • 쿠키 등의 사용 목적: 사이트 로그인을 위한 아이디 식별 및 사이트 설정 기능이 담겨져 있어서 최적화된 정보 제공을 위해 사용합니다.<br>
                • 쿠키 설정 거부 방법: (IE의 경우) 웹 브라우저 상단의 도구>인터넷 옵션> 사이트별 개인정보에서 거부할 수 있습니다.<br>
                <br>
                10. 개인정보의 기술적/관리적 보호 대책<br>
                이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여<br> 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.<br>
                • 비밀번호 암호화<br>
                회원 아이디(ID)의 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.<br>
                • 해킹 등에 대비한 대책<br>
                해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.<br>
                <br>
                11. 개인정보 관리 책임자<br>
                - 개인정보 보호업무 부서: 끼리끼리 개인정보 보호팀<br>
                - 연락처 및 이메일 : emailsender0222@.gmail.com<br>
                <br>
                12. 고지의 의무<br>
                이 개인정보 취급방침이 법령, 정책 또는 보안기술의 변경에 따라 내용이 추가, 삭제 및 수정될 경우에는 변경사항의 시행일의 7일전부터 사이트에 공고할 것입니다.<br>
                • 공고일자: 2022년 07월 07일<br>
                • 시행일자: 2022년 08월 05일
            </span>
        </div>
    </div>
    <!-- Footer-->
  <div class="footerWrapper mt-5" style="border-top:1px solid #e0e3e8;">
    <div class="container">
      <footer class="footer">
        <div class="row">
          <div class="col-lg-3 footer-imgBox">
            <img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다." />
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
             <ul class="list-inline mb-2">
            <li class="list-inline-item"><a href="/board/toBoard?pageNum=1&amount=10&keyword=&type=&category=공지">공지사항</a></li>
            <li class="list-inline-item">⋅</li>
            <c:choose>
               <c:when test="${not empty loginSession}">
                  <li class="list-inline-item"><a href="/mem/myPage">마이페이지</a></li>
                  <li class="list-inline-item">⋅</li>
                  <c:if test="${loginType ne 'kakao'}">
						<li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
			      </c:if>
			      <c:if test="${loginType eq 'kakao'}">
					<li class="list-inline-item"><a href="${kakaoLogout}">로그아웃</a></li>
	      		  </c:if>
               </c:when>
               <c:otherwise>
                  <li class="list-inline-item"><a href="/signup/toSignupAgree">회원가입</a></li>
                  <li class="list-inline-item">⋅</li>
                  <li class="list-inline-item"><a href="/login/toLogin">로그인</a></li>
               </c:otherwise>
            </c:choose>
            <li class="list-inline-item">⋅</li>
            <li class="list-inline-item">
               <c:choose>
                  <c:when test="${not empty loginSession}">
                     <a href="/group/toCreateGroup">모임 만들기</a>
                  </c:when>
                  <c:otherwise>
                     <a href="/login/toLogin">모임 만들기</a>
                  </c:otherwise>
               </c:choose>
            </li>
            <li class="list-inline-item">⋅</li>
            <li class="list-inline-item"><a href="/privacy"
               style="color: red; font-weight: bold;">개인정보처리방침</a></li>
         </ul>
            <p class="text-muted small mb-4 mb-lg-0">
              끼리끼리(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 |
              사업자등록번호 : 22-02-22
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              &copy; Your Website 2022. All Rights Reserved.
            </p>
          </div>
          <div class="col-lg-3 h-100 text-center text-lg-start my-auto">
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
  </div>
</body>
</html>