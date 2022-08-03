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
<title>계정연동</title>
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
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
	height: 800px;
	border: 1px solid d2e3ec;
	text-align: left;
	margin: auto;
	background-color: #d2e3ec;
	margin-bottom: 150px;
	margin-top: 70px;
}

#privacyForm {
	padding: 20px;
	width: 93%;
	height: 100%;
	margin: auto;
	border: 1px solid d2e3ec;
	background-color: white;
    text-align: center;
}
.privacyBox > span{
    margin: 15px;
}
.privacyBox:last-child .col{
	margin-bottom: 30px;
}

h2{
	margin-top: 20px;
    text-align: center;
}

.btn{
    width: 30%;
    margin: 15px;
    height: 70%;
    border: 1px solid #d2e3ec;
    margin-bottom: 70px;
}

table{
    height: 80%;
    width: 100%;
    margin-bottom: 120px;;
    padding: 5px;
    text-align: center;
    border: 1px solid lightgray;
}

table tr{
    border: 1px solid lightgray;
}
table th{
    border-right: 1px solid #d2e4ec;
    background-color: #d2e3ec;
}
table td{
    border-right: 1px solid lightgray;
}

.info{
    text-align: left;
}

p{
    font-size: 16px;
}

#naverBtn{
    background-color: #2DB400;
    overflow: hidden;
}
#kakaoBtn{
    background-color: #FEE500;
    overflow: hidden;
}
#generalBtn, #homeBtn{
    background-color: #d2e4ec;
}

#naverBtn img, #generalBtn img, #kakaoBtn img, #homeBtn img{
    margin-right: 10px;
    border-radius: 10px;
    width: 20%;
    height: 60%;
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
</head>
<script>
	$(document).ready(function(){
		
		if($("#check").val() === ""){
			Swal.fire({
				 icon: 'error',
				 title: 'Oops...',
				 text: "오류가 발생했습니다.",
				});  
			   setTimeout(function() {
				   location.href = "/login/toLogin";
			   },1200);
			   
		}
		
		$("#generalBtn").click(function(){
			
			Swal.fire({
				  title: '뒤로가기',
				  text: "로그인 페이지로 돌아가서 다시 로그인 하시겠습니까?",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '로그인 하러가기'
				}).then((result) => {
				  if (result.isConfirmed) {
					 location.href = "/login/toLogin";
				  };
				});
		});
		
		$("#naverBtn").click(function(){
			 Swal.fire({
				  title: '네이버 계정연동',
				  text: "연동하시면 일반 회원으로 로그인이 불가능합니다."+
				  		" 네이버로 연동하시겠습니까?",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네이버 연동하기'
				}).then((result) => {
				  if (result.isConfirmed) {
						
					  $.ajax({
						  url : "/auth/connetion"
						  , type : "post"
						  , data : {user_email : "${connection.userEmail}", type : "${connection.type}"}
					  	  , dataType : "text"
					  	  , success : function(result){
					  		  if(result == "completion"){
					  			location.href = "/";
					  		  }else if(result == "error"){
					  			setTimeout(function() {
					  				Swal.fire({
						  				 icon: 'error',
						  				 title: 'Oops...',
						  				 text: "오류가 발생했습니다. 다시 로그인해주세요.",
						  				});  
					  				location.href = "/login/toLogin";
					  			},800);
					  		  }
					  		 	 
					  	  }, error : function(e){
					  		  console.log(e);
					  	  }
					  })
				  };
			  });
		});
		$("#kakaoBtn").click(function(){
			Swal.fire({
				  title: '카카오 계정연동',
				  text: "연동하시면 일반 회원으로 로그인이 불가능합니다."+
				  		" 카카오로 연동하시겠습니까?",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '카카오 연동하기'
				}).then((result) => {
				  if (result.isConfirmed) {
						
					  $.ajax({
						  url : "/auth/connetion"
						  , type : "post"
						  , data : {user_email : "${connection.userEmail}", type : "${connection.type}"}
					  	  , dataType : "text"
					  	  , success : function(result){
					  		  if(result == "completion"){
					  			location.href = "/";
					  		  }else if(result == "error"){
					  			setTimeout(function() {
					  				Swal.fire({
						  				 icon: 'error',
						  				 title: 'Oops...',
						  				 text: "오류가 발생했습니다. 다시 로그인해주세요.",
						  				});  
					  				location.href = "/login/toLogin";
					  			},800);
					  		  }
					  		 	 
					  	  }, error : function(e){
					  		  console.log(e);
					  	  }
					  })
				  };
			  });
		});
		
		$("#homeBtn").click(function(){
			location.href = "/";
		});
	});
</script>
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
                        <li class="nav-item"><a class="nav-link" href="/board/toBoard" style="font-size:18px;">자유게시판</a></li>
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
			<div class="row">
				<div class="col">
					<h1 style="margin: 40px;">계정 연동</h1>	
					<input id="check" type="hidden" value="${connection.type}" />
				</div>
			</div> 
			<div class="row">
                <div class="col-md-2"></div>
				<div class="col-md-8">
					<table border="1px">
						<thead>
							<tr>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>가입일</th>
                            </tr>
						</thead>
						<tbody>
                            <tr>
                                <td>${connection.userName}</td>
                                <td>${connection.userEmail}</td>
                                <td>${connection.signupDate}</td>
                            </tr>
						</tbody>
					</table>
				</div>
                <div class="col-md-2"></div>
			</div>
			<c:choose>
				<c:when test="${connection.type eq '탈퇴'}">
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.userName}님 ${connection.userEmail}으로 ${connection.signupDate}에 ${connection.signupType} 회원으로 가입하셨습니다 </p>
						</div>
						<div class="col-md-2"></div>
						</div>         
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>현재는 탈퇴된 계정입니다. 로그인이 불가능합니다.</p>
						</div>
						<div class="col-md-2"></div>
					</div>          
				</c:when>
				<c:when test="${connection.type eq '블랙리스트'}">
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.userName}님 ${connection.userEmail}으로 ${connection.signupDate}에 ${connection.signupType} 회원으로 가입하셨습니다 </p>
						</div>
						<div class="col-md-2"></div>
						</div>         
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>현재는 차단된 계정입니다. 로그인이 불가능합니다. 고객센터로 문의해주세요.</p>
						</div>
						<div class="col-md-2"></div>
					</div>          
				</c:when>
				<c:when test="${connection.signupType eq '일반'}">
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.userName}님 ${connection.userEmail}으로 ${connection.signupDate}에 ${connection.signupType} 회원으로 가입하셨습니다 </p>
						</div>
						<div class="col-md-2"></div>
						</div>         
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.signupType} 회원에서 ${connection.type} 계정으로 전환을 원하시면 아래의 버튼을 눌러주세요.</p>
						</div>
						<div class="col-md-2"></div>
					</div>          
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>단, ${connection.type} 계정으로 전환 시 일반 회원으로 로그인이 불가능해집니다.</p>
						</div>
						<div class="col-md-2"></div>
					</div>
				</c:when>
				<c:when test="${connection.signupType ne '일반'}">
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.userName}님 ${connection.userEmail}으로 ${connection.signupDate}에 ${connection.signupType} 회원으로 가입하셨습니다 </p>
						</div>
						<div class="col-md-2"></div>
						</div>         
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.signupType}계정으로 로그인 해주세요.</p>
						</div>
						<div class="col-md-2"></div>
					</div>          
				</c:when>
				<c:when test="${connection.signupType ne '일반'}">
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.userName}님 ${connection.userEmail}으로 ${connection.signupDate}에 ${connection.signupType} 회원으로 가입하셨습니다 </p>
						</div>
						<div class="col-md-2"></div>
						</div>         
					<div class="row info">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<p>${connection.signupType}계정으로 로그인 해주세요.</p>
						</div>
						<div class="col-md-2"></div>
					</div>     
				</c:when>
			</c:choose> 
            <div class="row btnRow">
		        <div class="col">
		            
                    <c:choose>
                    	<c:when test="${connection.type eq'탈퇴' ||  connection.type eq '블랙리스트'}">
                    		<button type="button" id="homeBtn" class="btn">
                        		<img src="/resources/images/profile.jpg" alt="오류가 발생했습니다.">홈으로
                    		</button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" id="generalBtn" class="btn">
                        		<img id="kirikiri" name="kirikiri" src="/resources/images/profile.jpg"alt="오류가 발생했습니다.">일반 회원으로 로그인
                   		    </button>
                    	</c:otherwise>
                    </c:choose>
                    <c:choose>
                    	<c:when test="${connection.signupType eq'일반' && connection.type eq '네이버'}">
                    		<button type="button" id="naverBtn" class="btn">
                        		<img src="/resources/images/naverLogo.JPG" alt="오류가 발생했습니다.">네이버로 연동
                    		</button>
                    	</c:when>
                    	<c:when test="${connection.signupType eq'일반' && connection.type eq '카카오'}">
                    		<button type="button" id="kakaoBtn" class="btn">
                        		<img src="/resources/images/kakoLogo.JPG" alt="오류가 발생했습니다.">카카오로 연동
                    		</button>
                    	</c:when>
                    </c:choose>
		        </div>
    		</div>      
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