<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
=======
    pageEncoding="UTF-8"%>
>>>>>>> d2d3ce3d4ac4293c568f478788b1c1cc5fe7de25
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
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
<title>그룹 가입신청</title>
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

.rowBtn {
	border: 5px solid #d2e3ec;
	width: 40%;
	margin: auto;
	margin-top: 50px;
	place-content: center;
}

.btnBox {
	margin: 25px;
	text-align: center;
}

.btn-success {
	color: #fff;
	background-color: #51c9db;
	border-color: #51c9db;
}

.btn-success:hover {
	color: #fff;
	background-color: #46ADBD;
	border-color: #46ADBD;
}

.btn-secondary {
	color: #fff;
	background-color: #f06345;
	border-color: #f06345;
}

.btn-secondary:hover {
	color: #fff;
	background-color: #D4583D;
	border-color: #D4583D;
}

/*테이블*/
.table {
	width: 60%;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 40px;
}

tr {
	text-align: center;
}

th, td {
	font-family: 'Poor Story', cursive;
}

.tableinfo {
	margin: auto;
	margin-top: 50px;
}

/*버튼 색 지정*/
.btn-primary {
	background-color: cornflowerblue;
	border-color: cornflowerblue;
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
.footerBox {
	height: 0px;
}

footer.footer {
	padding-top: 2rem;
	padding-bottom: 2rem;
	background-color: #ffffff;
	width: fit-content;
	margin: auto;
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
							<div class="col-auto d-none">
								<ul class="navbar-nav mb-2 mb-lg-0 me-2">
									<c:if test="${empty loginSession}">
										<li class="nav-item"><a class="nav-link"
											href="/toLogin.mem">로그인</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/toSignUp.mem">회원가입</a></li>
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

	<div class="body">
		<div class="container-btn">
			<!-- 버튼 그룹 -->
			<div class="row rowBtn">
				<div class="col-md-3 btnBox">
					<button type="button" class="btn btn-primary btn-lg"
						id="groupApply">가입 신청</button>
				</div>
				<div class="col-md-3 btnBox">
					<button type="button" class="btn btn-primary btn-lg"
						id="groupMember">멤버 관리</button>
				</div>
				<div class="col-md-3 btnBox">
					<button type="button" class="btn btn-primary btn-lg"
						id="groupDelete">모임 해산</button>
				</div>
			</div>

			<!-- 테이블 -->
			<div class="row tableinfo">
				<div class="col-12 d-flex justify-content-center">
					<table class="table table-bordered">
						<thead>
							<tr class="table-primary">
								<th class="col-2">닉네임</th>
								<th class="col-5">소개</th>
								<th class="col-1">성별</th>
								<th class="col-3">생년월일</th>
								<th class="col-1">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${map.MemberDTO.size() == 0}">
								<tr>
									<td colspan="5">가입신청 이력이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${map.MemberDTO.size() > 0}">
								<c:forEach items="${map.MemberDTO}" var="list">
									<tr>
										<td>${list.user_nickname}</td>
										<td>${list.user_intro}</td>
										<td>${list.user_gender}</td>
										<c:set var="date" value="${list.user_bd}" />
										<c:set var="subDate" value="${fn:substring(date, 0, 10)}" />
										<td>${subDate}</td>
										<td><input class="form-check-input checkUser_email"
											type="checkbox" name="checkUser_email"
											value="${list.user_email}"></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- 그룹번호 숨겨서 받기 -->
				<div class="d-none">
					<input type="text" value=1 name="seq_group" id="seq_group">
					<input type="text" value="${count}" name="group_people"
						id="group_people"> <input type="text"
						value="${groupCount}" name="groupCount" id="groupCount">
				</div>
				<!-- 				<div class="row m-3">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav> -->
				<div class="row">
					<div class="col d-flex justify-content-center">
						<button type="submit" class="btn btn-success btn-lg m-3"
							id="applyBtn">가입 승인</button>
						<button type="button" class="btn btn-secondary  btn-lg m-3"
							id="denyBtn">가입 거절</button>
					</div>
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
					<li class="list-inline-item"><a href="#!">회원가입</a></li>
					<li class="list-inline-item">⋅</li>
					<li class="list-inline-item"><a href="#!">로그인</a></li>
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
						href="https://twitter.com/?lang=ko"><i class="bi-twitter fs-3"></i></a></li>
					<li class="list-inline-item"><a
						href="https://www.instagram.com/"><i class="bi-instagram fs-3"></i></a></li>
				</ul>
			</div>
		</div>
	</footer>
	</div>


</body>
<script>

	// 멤버관리 페이지 이동
	$("#groupMember").on("click", function(){
		location.href = "/group/toGroupMember?seq_group="+$("#seq_group").val();
	})	
	// 모임가입  페이지 이동
	$("#groupApply").on("click", function(){
		location.href = "/group/toGroupApply?seq_group="+$("#seq_group").val();
	})	
	// 모임해산 페이지 이동
	$("#groupDelete").on("click", function(){
		location.href = "/group/toGroupDelete?seq_group="+$("#seq_group").val();
	})	
	
	// 그룹 승인하기
	$("#applyBtn").on("click", function(){
		let count = $("#group_people").val();
		let groupCount = $("#groupCount").val();
		let checkBoxArr = [];
		$("input[name=checkUser_email]:checked").each(function(){			
			checkBoxArr.push($(this).val());
		})
		
		var jsonData = {
			"userEmails" : JSON.stringify(checkBoxArr)
		};
		var jsonString = JSON.stringify(jsonData);
		
    	$.ajax({
			url:"/group/completeApply?&group_people="+count+"&groupCount="+groupCount,
			headers: {'Content-Type': 'application/json'},
			type : "post",
			data: jsonString,
			success:function(data){
				if(data == "success"){
						Swal.fire({
							  icon: 'success',
							  text: '완료되었습니다.',
							})				
				}else if(data == "error"){
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '인원수를 확인해주세요!',
						})
				}
				setTimeout(function() {
                    window.location.href = "";
                },3000);
			},error : function(e){
				console.log(e);		
			}
		})
	})
	
	// 그룹 승인 거절하기
	$("#denyBtn").on("click", function(){
		let checkBoxArr = [];
		$("input[name=checkUser_email]:checked").each(function(){			
			checkBoxArr.push($(this).val());
		})
		
		var jsonData = {
			"userEmails" : JSON.stringify(checkBoxArr)
		};
		var jsonString = JSON.stringify(jsonData);
		
    	$.ajax({
			url:"/group/denyApply",
			headers: {'Content-Type': 'application/json'},
			type : "post",
			data: jsonString,
			success:function(data){
				Swal.fire({
					  icon: 'success',
					  text: '완료되었습니다.',
					})	
					setTimeout(function() {
	                    window.location.href = "";
	                },3000);
			},error : function(e){
				console.log(e);			
			}
		})
	})
	
=======
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<title>그룹 가입신청</title>
<style>
         i{
            margin: 5px;
        }
        .navbar-light{
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1;
            left: 0%;
        }

        body{margin-top: 100px;}
        
       /*네비바 속성*/
       .navbar-anchor a{
           text-decoration: none;
           color: black;
           font-weight: bold;
        }
        #userIcon {
            text-align: right;
            font-size: 25px;
            padding: 5px;
        }
        #navbar-search{
            text-align: right;
        }
        #searchIcon{
            color: lightgrey;
        }
        
        /*이미지*/
        .container-body{width: 100%; height: 450px;}


        /*버튼 및 테이블*/
        .container-content{width: 100%; margin-bottom: 50px;}
        .rowBtn{border:3px solid #d0e2ff; width: 60%; margin:auto; margin-top:50px;}

        /*테이블*/
        .table{width:60%; margin:auto; margin-top:40px;}
        tr{text-align: center;}

        /* 네비바 드롭다운 */
        .dropdown-toggle:hover{color: #83bf7b; border-color: aliceblue;}
        .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
        font-weight: bold;
        }


         /*풋터 영역*/
         .footerBox{
            height: 200px;
        }
        footer.footer {
             padding-top: 4rem;
             padding-bottom: 4rem;
        }
        .footer a{
            text-decoration: none;
            color: black;
            font-weight: 40px;
            font-weight: bold;
        }
</style>
</head>
<body>
    <div class="header">
        <nav class="navbar navbar-light bg-light fixed">
            <div class="container navbar-head">
                <a class="navbar-brand" href="#!" id="logo">로고</a>
                <div class="col-md-1 navbar-anchor"><a href="/">COMPANY</a></div>
                
                <div class="dropdown ">
                    <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">
                      CLOTHES
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <li><a class="dropdown-item" href="#">Top</a></li>
                      <li><a class="dropdown-item" href="#">Bottom</a></li>
                      <li><a class="dropdown-item" href="#">Accessory</a></li>
                    </ul>
                  </div>
    
                <div class="col-md-1 navbar-anchor"><a href="/">매장찾기</a></div>
                <div class="col-md-1 navbar-anchor"><a href="/">고객센터</a></div>
            <!-- 네비바 검색창 -->
                <div class="col-md-4 navbar-anchor" id="navbar-search">
                    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                        <div class="input-group">
                            <button class="btn btn-link" style="border: 1px solid lightgrey;" id="btnSearch" type="button"><i id="searchIcon" class="fas fa-search"></i></button>
                            <input class="form-control" type="text" aria-describedby="btnNavbarSearch" />
                        </div>
                    </form>
                </button></div>
                <div class="col-md-2 navbar-anchor" id="userIcon">
                    <a href=""><i class="fa-solid fa-cart-plus"></i></a>
                    <a href=""><i class="fa-solid fa-user"></i></a>
                </div>
            </div>
        </nav>
    </div>

    <div class="body">
        <!-- 사진 -->
        <div class="container-body">
            <div class="image">
                <img src = "/resources/images/group/header_image.png" style="height: 450px; width:100%;">
            </div>
        </div> 
        <div class="container-content">
            <!-- 버튼 그룹 -->  
            <div class="rowBtn">
                <div class="col-12 m-3 d-flex justify-content-center">
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupApply">가입 신청</button>
                    </div>
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupMember">멤버 관리</button>
                    </div>
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupDelete">모임 해산</button>
                    </div>
                </div>
            </div>
            <!-- 테이블 -->
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="table-primary">
                                <th class="col-2">직책</th>
                                <th class="col-2">이름</th>
                                <th class="col-5">소개</th>
                                <th class="col-1">성별</th>
                                <th class="col-1">권한</th>
                                <th class="col-1">강퇴</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">모임장</th>
                                <td>햅삐</td>
                                <td>햅-삐</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버1</td>
                                <td>멤버1~</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버2</td>
                                <td>멤버2~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버3</td>
                                <td>멤버3~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버4</td>
                                <td>멤버4~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버5</td>
                                <td>멤버5~</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>
    <div class="row m-3">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
            </ul>
        </nav>
    </div>
    <div class="row">
        <div class="col d-flex justify-content-center">
            <button type="button" class="btn btn-success btn-lg m-3">권한수정</button>
            <button type="button" class="btn btn-danger btn-lg m-3">강퇴하기</button>
        </div>
    </div>
</div>    
    
    
    <div class="container-footer">
        <div class="row">
            <div class="col"
                style="text-align:center; font-size: 50px; font-weight: bold; border:1px solid black; height: 300px; margin-top: 50px;">
                푸터
            </div>
        </div>
    </div>
</body>
<script>
	// 멤버관리 이동
	$("#groupMember").on("click", function(){
		location.href = "/group/toGroupMember";
	})	
	// 모임가입 이동
	$("#groupApply").on("click", function(){
		location.href = "/group/toGroupApply";
	})	
	// 모임해산 이동
	$("#groupDelete").on("click", function(){
		location.href = "/group/toGroupDelete";
	})	
>>>>>>> d2d3ce3d4ac4293c568f478788b1c1cc5fe7de25
</script>
</html>