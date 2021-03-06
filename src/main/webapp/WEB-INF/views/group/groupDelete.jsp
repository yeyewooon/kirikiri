<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet">
<!-- 깃허브 alert -->
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<title>그룹해산</title>
<style>
* {
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

/*버튼 및 테이블*/
.container-btn {
   width: 100%;
}
.rowBtn{
    border: 5px solid #d2e3ec;
    width: max-content;
    margin: auto;
    margin-top: 50px;
    padding: 30px;
}

.btnBox {
   text-align: center;
   margin-top: 10px;
    margin-bottom: 10px;
}
/*버튼 색 지정*/
.btn-primary {/*버튼 4개*/
   background-color: cornflowerblue;
   border-color: cornflowerblue;
}
.btn-primary:hover{ /*버튼 4개*/
	color: #fff;
    background-color: #5680CC;
    border-color: #5680CC;
}

/*모임 해산 문구 및 사진*/
.container-content {
   width: 100%;
   background-color: #f6f9fe;
}

.content-delete {
   width: 60%;
   height: 100%;
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

/*풋터 영역*/
.footerWrapper{
   background-color: #fff;
}
.footerBox {
	height: 0px;
}

footer.footer {
	padding-top: 2rem;
	padding-bottom: 2rem;
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
/*모임 해산 버튼*/
.deleteBtn{
  position: absolute;
  left: 50%;
  transform: translate(-50%,-50%);
  width: 160px;
  height: 50px;
  line-height: 50px;
  font-size: 20px;
  text-align: center;
  font-family: sans-serif;
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 2px;
  background: #ccc;
  cursor:pointer;
}
.deleteBtn:before{
  content: attr(data-text);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  text-align: center;
  background: #ff005e;
  color: #fff;
  transition: 0.5s;
  transform-origin: bottom;
  transform: translatey(-100%) rotatex(90deg);
}
.deleteBtn:hover:before
{
  transform: translatey(0) rotatex(0deg);
}

.deleteBtn:after{
  content: attr(data-text);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  text-align: center;
  background: #ea004f;
  color: #fff;
  transition: 0.5s;
  transform-origin: top;
  transform: translatey(0) rotatex(0deg);
}
.deleteBtn:hover:after{
  transform: translatey(100%) rotatex(90deg);
}
</style>
</head>
<body>

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
   </header>

	<div class="body">
		<div class="container-btn">
			<!-- 버튼 그룹 -->
			<div class="row rowBtn">
					<div class="col-md-3 btnBox">
						<button type="button" class="btn btn-primary btn-lg"
							id="groupApply" style="font-weight: bold;">가입 신청</button>
					</div>
					<div class="col-md-3 btnBox">
						<button type="button" class="btn btn-primary btn-lg"
							id="groupMember" style="font-weight: bold;">멤버 관리</button>
					</div>
					<div class="col-md-3 btnBox">
						<button type="button" class="btn btn-primary btn-lg"
							id="groupModify" style="font-weight: bold;">모임 수정</button>
					</div>
					<div class="col-md-3 btnBox">
						<button type="button" class="btn btn-primary btn-lg"
							id="groupDelete" style="font-weight: bold;">모임 해산</button>
					</div>
			</div>
			<!-- 해산 문구 및 사진 -->
			<div class="container-content mt-5 py-5">
				<div class="row content-delete m-auto py-5">
					<div class="col-md-6">
						<p style="font-size: 40px; font-family: 'Do Hyeon', sans-serif;">모임을
							해산하시겠습니까?</p>
						<br>
						<p class="text text-muted light-300"
							style="font-size: 20px; font-family: 'Do Hyeon', sans-serif;">
							모임 해산시 해당 정보는 되돌릴 수 없습니다.<br>
							<br> 1) 해당 모임의 활동 기록은 사라집니다.<br>
							<br> 2) 모임에 속해있던 모임원들은 자동으로 모임에서 탈퇴됩니다.<br>
							<br> 3) 모임에서 작성한 게시글 및 일정은 더이상 볼 수 없습니다.<br>
							<br> 4) 모임해산은 되돌릴 수 없습니다.
						</p>
					</div>
					<div class="col-md-6 d-flex justify-content-center">
						<img src="/resources/images/group/group_ban.png">
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<div data-text="모임 해산하기" id = "deleteBtn" class = "deleteBtn">모임 해산하기</div>
					</div>
				</div>
			</div>

		</div>
		<!-- 그룹번호 숨겨서 받기 -->
		<div class="d-none">
			<input type="text" value="${seq_group}" name="seq_group" id="seq_group">
		</div>
	</div>
<!-- Footer-->
  <div class="footerWrapper">
    <div class="container">
      <footer class="footer">
        <div class="row">
          <div class="col-lg-3 footer-imgBox">
            <img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다." />
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
          	<ul class="list-inline mb-2">
				<li class="list-inline-item"><a href="/board/toBoard">공지사항</a></li>
				<li class="list-inline-item">⋅</li>
				<c:choose>
					<c:when test="${not empty loginSession}">
						<li class="list-inline-item"><a href="/mem/myPage">마이페이지</a></li>
						<li class="list-inline-item">⋅</li>
						<li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
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
<script>
	// 멤버관리 페이지 이동
	$("#groupMember").on("click", function(){
		location.href = "/group/toGroupMember?seq_group="+$("#seq_group").val();
	})
	// 모임가입 페이지 이동
	$("#groupApply").on("click", function(){
		location.href = "/group/toGroupApply?seq_group="+$("#seq_group").val();
	})
	// 모임수정 이동
	$("#groupModify").on("click", function(){
		location.href = "/group/toModifyGroup?seq_group="+$("#seq_group").val();
	})
	// 모임해산 페이지 이동
	$("#groupDelete").on("click", function(){
		location.href = "/group/toGroupDelete?seq_group="+$("#seq_group").val();
	})

	// 모임 해산시키기
	$("#deleteBtn").on("click", function(){
			Swal.fire({
			  title: '모임을 해산하시겠습니까???',
			  text: "해산하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '해산하기',
			  cancelButtonText: '다시생각하기'
			}).then((result) => {
			  if (result.value) {
				  let deleteForm = $("<form>").attr({
						"method" : "post"
						, "action" : "/group/groupDelete"
					}).css("display", "none");
					deleteForm.append($("#seq_group"));
					deleteForm.appendTo("body");
					deleteForm.submit();
			  }
			})
		})

</script>
</html>