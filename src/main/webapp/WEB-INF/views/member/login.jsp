<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
 <!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<style>
/* 눈누 폰트 */
  @font-face {
      font-family: 'OTWelcomeRA';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
  }
  @font-face {
      font-family: '양진체';
      src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
      font-weight: normal;
      font-style: normal;
  }
  *{box-sizing: border-box;   font-family: 'OTWelcomeRA';}
  body{
      background-color: #d2e3ec;
  }
   /* header 반응형 */
   @media (max-width : 768px) {
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
  .border-bottom{
      background-color: white;
  }

  #navLogo {
      width: 150px;
      height: 100px;
  }

  #logoImgs {
      width: 100%;
      height: 100%;
  }

  @media (min-width : 768px) {
      #navibar {
          display: none;
      }
  }

  /* header 반응형 끝 */

  #logoImg {
      width: 50%;
  }

  /* 바디*/
  .loginBox{
      width: 1000px;
      height: auto;
      border: 1px solid d2e3ec;
      text-align: center;
      margin: auto;
      background-color: #d2e3ec;
      margin-bottom: 150px;
      margin-top: 70px;
  }
  #loginForm{
      padding-top: 20px;
      margin-top: 3000px;
      width: 93%;
      height: 100%;
      margin: auto;
      border: 1px solid d2e3ec;
      background-color: white;
  }
  #loginForm .row, #loginForm .col{ 
      align-items: center;
  }
  #loginForm input{
      margin: auto;
      width: 60%;
      margin-bottom: 10px ;
      padding: 5px;
  }
  #loginForm button, #findPwForm button{ 
      margin-bottom: 20px;
      width: 60%;
      height: 80%;
  }

  #loginForm p{
      margin-bottom: 0px;
      color: #656565 ;
      display: inline;
      width: 12%;
  }
  #pw{
  	font-family: none;
  }
  button{
      margin-bottom: 20px;
      width: 25%;
      height: 80%;
  }

  span{
      color: #656565;
      font-size: 16px;
  }
  
  h2{
      margin-top: 30px;
  }
  /* 모달 */
  .modal-header{
      display: flex;
      align-items: center;
      text-align: center;
  }
  #findId_body button, #findPw_body button{
      width: 80%;
      height: 60%;
  }
  
  .findId-emailCheck-box, .findPw-emailCheck-box {
      display: none;
  }

  #findId-emailCheck-no ,#findPw-emailCheck-no {
      height: 60%;
  }

  .social{
      width: 100px;
      height: 100px;
      border-radius: 30px;
      border: 2px dotted #5653ee7c ;
      padding: 5px;
      margin: 4px;
      margin-bottom: 30px;
  }
  .social:hover{
      cursor: pointer;
      padding: 10px;
  }

  .social img{
      width: 100%;
      height: 100%;
      border-radius: 20px;
  }
  .social span{
      margin: auto;
      font-size: 20px;
      color: #030087;
  }


  /*풋터 영역*/
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
  .footer-imgBox{
      overflow: hidden;
  }
  .footer-imgBox > img{
      width: 100%;
      height: 100%;
  }

</style>
</head>
<script>
    $(document).ready(function(){
    	$("input").on("keyup",function(key){         
    		if(key.keyCode==13) {            
    			 alert("엔터키 이벤트");       
    		}    
    	});
    	
        $("#toLoginBtn").click(function(){
        	console.log("dd");
        	$.ajax({
        		url : "/login/general"
        		, type : "post"
        		, data : {user_id : $("#id").val() , user_pw : $("#pw").val() }
        		, dataType : "text"
        		, success : function(result){
        			console.log(result);
        			if(result === "general"){
        				alert("환영합니다!");
        				location.href = "/"
        				
        			}else if(result === "loginFail"){
        				alert("아이디 혹은 비밀번호가 맞지 않습니다.");
        			}
        		}, error : function(e){
        			console.log(e);
        		}
        		
        	})
        })

    })
</script>
<body>
<!--네비바-->
    <header class="mb-3 border-bottom">
        <div class="container">
            <!-- 접혔을 때 nav -->
            <nav id="navibar" class="navbar navbar-expand-md navbar-light" aria-label="Main navigation">
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
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                        <!-- 메뉴 -->
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav mb-2 mb-lg-0">
                                <li class="nav-item"><a class="nav-link" href=" ">자유게시판</a></li>
                                <c:choose>
                                    <c:when test="${empty loginSession}">
                                        <li class="nav-item"><a class="nav-link" href=" ">로그인</a></li>
                                        <li class="nav-item"><a class="nav-link" href=" ">회원가입</a></li>
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
            <nav id="menu" class="navbar navbar-expand-md w-100 navbar-light" aria-label="Main navigation">
                <div class="row w-100 align-items-center">
                    <div class="col-5 d-flex justify-content-center">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link mx-2" href="">자유 게시판</a></li>
                        </ul>
                    </div>
                    <!-- logo -->
                    <div class="col-2">
                        <a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0">
                            <img id="logoImgs" src="/resources/images/kiri.jpg">
                        </a>
                    </div>
                    <div class="col-5">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-auto">
                                <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                    <c:if test="${empty loginSession}">
                                        <li class="nav-item"><a class="nav-link" href="/login/toLogin">로그인</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/signup/toSignup">회원가입</a></li>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="col-auto user">
                                <c:if test="${not empty loginSession}">
                                    <div class="dropdown text-end">
                                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle"
                                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="/final/images/profile.jpg" alt="mdo" width="32" height="32"
                                                class="rounded-circle">
                                        </a>
                                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                                            <li><a class="dropdown-item" href="#">마이페이지</a></li>
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
    
    <!--바디-->
    <div class="container loginBox">
    <!-- 로그인영역-->
   	<form id="generalLogin" action="/login/general" method="post">
        <div id="loginForm">
            <div class="row">
                <div class="col">
                    <img src="/resources/images/kirilogo.png" alt="오류발생">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h2><Strong>Login</Strong><br>
                    Welcome Back!</h2>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" id="id" name="id" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="password" id="pw" name="pw" class="form-control" autocomplete="off">
                </div>
            </div>
            <div class="row m-3">
                <div class="col-12 d-flex justify-content-center kakaoLogin">
                    <p data-bs-toggle="modal" data-bs-target="#staticBackdrop1">아이디 찾기&emsp;</p>
                    <span>/</span>
                    <p data-bs-toggle="modal" data-bs-target="#staticBackdrop2">&emsp;비밀번호 찾기</p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <button type="button" id="toLoginBtn" class="btn btn-primary">로그인</button>
                </div>
            </div>
            <div class="row justify-content-center align-items-center">
                <a class="social" href="" target="_parent"><img class="social-img" src="/resources/images/kakoLogo.JPG" alt="오류가 발생했습니다."></a>
                <div class="social d-flex align-items-center" onclick="location.href='/member/toSignUp'"><span>회원가입</span></div>
            </div>
        </div>
      </form>

        <!-- id찾기 -->
        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">아이디 찾기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="findIdForm" action="/findIdForm.mem" method="post">
                    <div id="findId_body" class="modal-body">
                        <div class="row nameBox m-2">
                            <div class="col-3 d-flex justify-content-center align-items-center">
                                <label for="name" class="form-label">이름</label>
                            </div>
                            <div class="col-9 d-flex justify-content-center">
                                <input type="text" class="form-control" placeholder="ex)홍길동" name="find_name" id="find_name">
                            </div>
                        </div>
                        <div class="row m-2 mt-4">
                            <div class="col-3 d-flex justify-content-center">
                                <label for="email" class="form-label">이메일</label>
                            </div>
                            <div class="col-9 d-flex justify-content-center">
                                <input type="email" id="email" name="email" class="form-control" placeholder="ex)abc@gmail.com" >
                            </div>
                        </div>
                        <div class="row btns mt-4">
                            <div class="col-12 d-flex justify-content-center">
                                <button type="button" class="btn btn-primary" id="btnFindID">아이디 찾기</button>
                            </div>
                        </div>
                        <div class="row findId-emailCheck-box m-2 mt-4">
                            <div class="col-3 d-flex justify-content-center">
                                <label for="email" class="form-label">이메일 인증</label>
                            </div>
                            <div class="col-5 d-flex justify-content-center">
                                <input type="text" id="findId-emailCheck-no" name="findId-emailCheck-no" class="form-control" >
                            </div>
                            <div class="col-4 d-flex justify-content-center">
                                <button type="button" class="btn btn-primary" id="findId-emailCheck-btn">이메일 인증</button>
                            </div>
                        </div>
                    </div>
                    
                </form>
                <div id="resultId" class="modal-body" style="display: none;">
                    <!-- 가입된아이디 -->
                    <div class="row nameBox m-2">
                        <div class="col-12 d-flex justify-content-center">
                            <label for="name" class="form-label">가입된 ID</label>
                        </div>
                    </div>
                    <div id="findId_result">

                    </div>
                    <div class="row anchor mt-4">
                        <div class="col-12 d-flex justify-content-center">
                            <a href="" id="findPw" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">비밀번호
                                찾기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 비밀번호찾기-->
    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">비밀번호 찾기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form id="findPwForm" action="/findPw.mem" method="post">
                    <div id="findPw_body" class="modal-body">
                        <!-- 비밀번호찾는곳 -->
                        <div class="row nameBox m-2">
                            <div class="col-3 d-flex justify-content-center">
                                <label for="findPw_id" class="form-label">아이디</label>
                            </div>
                            <div class="col-9 d-flex justify-content-center">
                                <input type="text" class="form-control" placeholder="ex)홍길동" name="findPw_name"
                                    id="findPw_id">
                            </div>
                        </div>
                        <div class="row phoneBox m-2 mt-4">
                            <div class="col-3 d-flex justify-content-center">
                                <label for="id" class="form-label">이메일</label>
                            </div>
                            <div class="col-9 d-flex justify-content-center">
                                <input type="email" class="form-control" name="findPw_email" id="findPw_email" placeholder="ex)abc@gmail.com">
                            </div>
                        </div>
                        <div class="row btns mt-4">
                            <div class="col-12 d-flex justify-content-center">
                                <button type="button" class="btn btn-primary" id="btnFindPW">비밀번호 찾기</button>
                            </div>
                        </div>
                    </div>
                    <div class="row findPw-emailCheck-box m-2 mt-4">
                        <div class="col-3 d-flex justify-content-center">
                            <label for="email" class="form-label">이메일 인증</label>
                        </div>
                        <div class="col-5 d-flex justify-content-center">
                            <input type="text" id="findPw-emailCheck-no" name="findPw-emailCheck-no" class="form-control" >
                        </div>
                        <div class="col-4 d-flex justify-content-center">
                            <button type="button" class="btn btn-primary" id="findPw-emailCheck-btn">이메일 인증</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    </div>

    <!-- Footer-->
    <footer class="footer">
        <div class="container">
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
                        <li class="list-inline-item me-4"><a href="https://ko-kr.facebook.com"><i
                                class="bi-facebook fs-3"></i></a></li>
                        <li class="list-inline-item me-4"><a href="https://twitter.com/?lang=ko"><i
                                class="bi-twitter fs-3"></i></a></li>
                        <li class="list-inline-item"><a href="https://www.instagram.com/"><i
                                class="bi-instagram fs-3"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>