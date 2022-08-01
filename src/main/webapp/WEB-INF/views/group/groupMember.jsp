<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
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
<title>모임멤버</title>
<style>
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

.rowBtn {
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

/*테이블*/
.table {
	width: 80%;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 40px;
}

th, td {
	font-family: 'Poor Story', cursive;
}

tr {
	text-align: center;
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
.btn-success{ /*가입 승인*/
	color: #fff;
    background-color: #50C7D9;
    border-color: #50C7D9;
}
.btn-success:hover{ /*가입 승인*/
	color: #fff;
    background-color: #3A919E;
    border-color: #3A919E;
}
.btn-check:focus+.btn-success, .btn-success:focus{ /*가입 승인*/
	color: #fff;
    background-color: #3A919E;
    border-color: #3A919E;
    box-shadow: 0 0 0 0.25rem rgb(48 145 158 / 50%);
}

.btn-secondary {/*가입 거절*/
   color: #fff;
   background-color: #f06345;
   border-color: #f06345;
}

.btn-secondary:hover {/*가입 거절*/
   color: #fff;
   background-color: #D4583D;
   border-color: #D4583D;
}
.btn-check:focus+.btn-secondary, .btn-secondary:focus{ /*가입 거절*/
	color: #fff;
    background-color: #D4583D;
    border-color: #D4583D;
    box-shadow: 0 0 0 0.25rem rgb(212 88 61 / 50%);
}

/*테이블 배경 및 범위*/
.tableinfo {
	margin: auto;
	margin-top: 50px;
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

ul {
	list-style: none;
	padding: 0;
}

/*풋터 영역*/
.footerWrapper{
	margin-top:200px;
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

	<div class="container">
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
			<!-- 테이블 -->
			<div class="row tableinfo">
				<div class="col-12 d-flex justify-content-center">
					<table class="table table-bordered">
						<thead>
							<tr class="table-primary">
								<th class="col-2">직책</th>
								<th class="col-2">닉네임</th>
								<th class="col-5">소개</th>
								<th class="col-1">성별</th>
								<th class="col-1">권한</th>
								<th class="col-1">강퇴</th>
							</tr>
						</thead>
						<tbody class = "tbody">
							<c:forEach items="${memList.TableJoinDTO}" var="list">
								<tr class = "tr">
									<td class = "access">${list.access}</td>
									<td>${list.user_nickname}</td>
									<td>${list.user_intro}</td>
									<td>${list.user_gender}</td>
									<td><input class="form-check-input checkAccess"
										type="checkbox" id="checkAccess"
										name="checkAccess" value="${list.access}"></td>
									<td><input class="form-check-input checkUser_email"
										id="checkUser_email" type="checkbox" name="checkUser_email"
										value="${list.user_email}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 그룹번호 숨겨서 받기 -->
		<div class="d-none">
			<input type="text" value="${seq_group}" name="seq_group" id="seq_group">
		</div>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<button type="button" class="btn btn-success btn-lg m-3"
					id="modifyBtn">권한위임</button>
				<button type="button" class="btn btn-danger btn-lg m-3"
					id="deleteBtn">강퇴하기</button>
			</div>
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
   // 멤버관리 이동
   $("#groupMember").on("click", function(){
      location.href = "/group/toGroupMember?seq_group="+$("#seq_group").val();
   })
   // 모임가입 이동
   $("#groupApply").on("click", function(){
      location.href = "/group/toGroupApply?seq_group="+$("#seq_group").val();
   })
   // 모임수정 이동
   $("#groupModify").on("click", function(){
      location.href = "/group/toModifyGroup?seq_group="+$("#seq_group").val();
   })
   // 모임해산 이동
   $("#groupDelete").on("click", function(){
      location.href = "/group/toGroupDelete?seq_group="+$("#seq_group").val();
   })


	$("input[type=checkbox]").on("change", function(){ //뭔가 체크박스가 눌렷을때
		var tr = $(this).parent().parent();
		let trAccess = tr.children('td').eq(4).children('input'); //직책
		let trEmail = tr.children('td').eq(5).children('input');  //이메일
		if(this.checked) {
			const checkboxes = $("input[name='checkAccess']");
			for(let ind = 0; ind < checkboxes.length; ind++){
				checkboxes[ind].checked = false;
				}
              this.checked = true;
		} else {
              this.checked = false;
		}
	if($(trAccess).prop("checked")){ //직책이 체크됐을때
		for(let i=0; i<3; i++){
			tr.parent().children().eq(i).children('td').eq(5).children('input[type=checkbox]').prop("checked", false);
		}
	}else if($(trEmail).prop("checked")){ // 이메일이 체크됐을때
		for(let i=0; i<3; i++){
			tr.parent().children().eq(i).children('td').eq(4).children('input[type=checkbox]').prop("checked", false);
		}
	}
 		})

       // 그룹 권한 수정
      $("#modifyBtn").on("click", function(){
         let checkAccess = $('input[name=checkAccess]:checked').val();
         let checkEmail = $('input[name=checkAccess]:checked').parent().next().children('input').val();

         if(checkEmail != ""){
	    	  Swal.fire({
	                 icon: 'warning',
	                 text: '버튼을 잘 선택해주세요.',
	               })
         }else{
 	         $.ajax({
	            url : "/group/groupAccess",
	            type : "post",
	            data : {user_email : checkEmail,
	                  access : checkAccess},
	            success: function(data){
	               if(data == "success"){
	            	    let timerInterval
	            	    Swal.fire({
	            	      icon:'success',
	            	      title: '주최자 위임이 완료되었습니다!',
	            	      html: ' <b></b>' + '초뒤에 페이지가 이동됩니다.',
	            	      timer: 5000,
	            	      timerProgressBar: true,
	            	      didOpen: () => {
	            	        Swal.showLoading()
	            	        const b = Swal.getHtmlContainer().querySelector('b')
	            	        timerInterval = setInterval(() => {
	            	          b.textContent = (Swal.getTimerLeft()/1000).toFixed(0)
	            	        }, 100)
	            	      },
	            	      willClose: () => {
	            	        clearInterval(timerInterval)
	            	      }
	            	    }).then((result) => {
	            	      /* Read more about handling dismissals below */
	            	      if (result.dismiss === Swal.DismissReason.timer) {
	            	        console.log('I was closed by the timer')
	            	      }
	            	      window.location.href = "/";
	            	    })
	               }else{
	                  Swal.fire({
	                       icon: 'error',
	                       title: 'Oops...',
	                       text: '다시 확인해주세요!',
	                     })
	                     setTimeout(function() {
	                             window.location.href = "";
	                         },2000);
	               }
	            },error:function(e){
	               console.log(e);
	            }
	         })
         }
      })

   // 그룹 멤버 강퇴
   $("#deleteBtn").on("click", function(){
	  let checkAccess = $('input[name=checkUser_email]:checked').parent().prev().children('.checkAccess').val();
	  console.log(checkAccess);
	  if(checkAccess != ""){
    	  Swal.fire({
              icon: 'warning',
              text: '버튼을 잘 선택해주세요.',
            })
	  }else{
	      let checkBoxArr = [];
		      $("input[name=checkUser_email]:checked").each(function(){
		    	 if(checkAccess != '주최자'){
		         checkBoxArr.push($(this).val());
			      var jsonData = {
			         "userEmails" : JSON.stringify(checkBoxArr)
			      };
			      var jsonString = JSON.stringify(jsonData);

			       $.ajax({
			         url:"/group/deleteMember",
			         headers: {'Content-Type': 'application/json'},
			         type : "post",
			         data: jsonString,
			         success:function(data){
			            Swal.fire({
			                 icon: 'success',
			                 text: '멤버강퇴가 완료되었습니다.',
			               })
			               setTimeout(function() {
			                       window.location.href = "";
			                   },3000);
			         },error : function(e){
			            console.log(e);
			         }
			      })
		      }else{
		    	  Swal.fire({
		                 icon: 'warning',
		                 text: '주최자는 강퇴할 수 없습니다.',
		               })
		      }
	      })
	  }
   })

</script>
</html>