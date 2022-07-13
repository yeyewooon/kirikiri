<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
	rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>모임 생성 페이지</title>


<script>
// 썸머노트
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #f6f7f9;
}

* {
	box-sizing: border-box;
	font-family: "OTWelcomeRA";
}

#mainText {
	font-family: "양진체";
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
	font-family: "Do Hyeon", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

/*모임영역 카드6개*/
/* body menu */
body {
	/* background-color: #f6f7f9; */
	
}

.mainContainer {
	margin-top: 40px;
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

.mainFooterBtnBox {
	margin-left: 30%;
}

.footer {
	height: 200px;
	background-color: black;
	color: #fff;
}

.memberCntBox {
	background-color: black;
	width: 140px;
	border-radius: 10px;
	height: 30px;
}

.plusBtn, .minusBtn {
	width: 35px;
	color: #fff;
}

.plusBtn, .minusBtn:hover {
	cursor: pointer;
}

.memberCnt {
	width: 70px;
	color: #fff;
}

/*풋터 영역*/
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

/* 눈누 폰트 */
@font-face {
	font-family: "OTWelcomeRA";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2")
		format("woff2");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "양진체";
	src:
		url("https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}


.btn-primary {
    color: #fff;
    background-color: cornflowerblue;
    border-color: #fff;
}


</style>
</head>
<body>
	<header class="mb-3 border-bottom" style="background-color: #fff;">
		<div class="container ">
			<!-- 접혔을 때 nav -->
			<nav id="navibar" class="navbar navbar-expand-md navbar-light"
				aria-label="Main navigation">
				<div class="container-fluid">
					<div class="row">
						<div class="col-10">
							<a class="navbar-brand mb-2 mb-lg-0" href="#">
								<div class="title-box">
									<img id="logoImg" src="/resources/images/kiri.jpg" />
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
								<li class="nav-item"><a class="nav-link" href=" ">자유게시판</a>
								</li>
								<c:choose>
									<c:when test="${empty loginSession}">
										<li class="nav-item"><a class="nav-link" href=" ">로그인</a>
										</li>
										<li class="nav-item"><a class="nav-link" href=" ">회원가입</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link" href=" ">마이페이지</a>
										</li>
										<li class="nav-item"><a class="nav-link" href=" ">로그아웃</a>
										</li>
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
							id="logoImgs" src="/resources/images/kiri.jpg" />
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
											height="32" class="rounded-circle" />
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
	<div class="container w-75 mainContainer">
		<form action="/group/createGroup" method="post"
			enctype="multipart/form-data" id="groupForm">
			<!--관심사 -->
			<div class="row mt-4">
				<!--관심사 아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-tags"></i>
					</h4>
				</div>
				<!--관심사 버튼  -->
				<div class="col-9 mainTextInterest d-flex flex-column justify-content-start">
					<h4>Interests</h4>
					<span style="font-size: 14px;">주제가 구체적일수록 비슷한 관심사를 가진 사람들에게
						그룹을 <br>홍보하기가 더 쉬워집니다. 주제는 1개만 선택 가능합니다.
					</span>
					<div class="row mt-4">
						<div class="col">
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="아웃도어/여행">아웃도어/여행</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="운동/스포츠">운동/스포츠</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="외국어/언어">외국어/언어</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="반려동물">반려동물</button>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="음악/악기">음악/악기</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="공예/만들기">공예/만들기</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="댄스/무용">댄스/무용</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="인문학/책/글">인문학/책/글</button>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="사진/영상">사진/영상</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="게임/오락">게임/오락</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="요리/제조">요리/제조</button>
							<button type="button" class="btn btn-outline-primary rounded-pill categoryBtn" value="문화/공연/축제">문화/공연/축제</button>
							<input type="text" name="group_category" id="group_category">
						</div>
					</div>
				</div>
			</div>

			<!--Basic Info-->
			<div class="row mt-5">
				<!--아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-pen-to-square"></i>
					</h4>
				</div>
				<!--기본 글쓰기 -->
				<div class="col-9 mainTextBasicInfo d-flex flex-column justify-content-start">
					<h4>Basic Info</h4>
					<strong class="mt-2">모임 이름</strong> <span style="font-size: 14px;"
						class="mt-2">사람들이 그룹의 성격과 내용을 파악할 수 있는 이름을 지어주세요. 떠오르는 기발한
						이름이 있나요? <br> 마음이 바뀌면 나중에 다시 변경할 수 있습니다.
					</span>
					<div class="form-floating mb-3 mt-1">
						<input type="text" class="form-control" id="group_title"
							placeholder="모임 이름" name="group_title">
					</div>
					<strong class="mt-2">모집 내용</strong> <span style="font-size: 14px;"
						class="mt-2">모집내용은 회원들에게 그룹을 홍보할 때 표시됩니다. <br>변경사항이
						있다면 나중에 언제든지 업데이트가 가능합니다.
					</span>
					<div class="form-floating mb-3 mt-2">
						<textarea id="summernote" name="group_info" class="group_info"></textarea>
					</div>
				</div>
			</div>

			<!--위치 -->
			<div class="row mt-5">
				<!--위치 아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-location-dot"></i>
					</h4>
				</div>
				<!--위치 설정  -->
				<div class="col-9 mainText mainTextMap d-flex flex-column justify-content-start">
					<h4>Location</h4>
					<span style="font-size: 14px;">해당 지역의 사람들이 귀하의 이벤트를 발견하도록 돕고
						<br> 참석자들에게 위치를 제공해주세요.
					</span> <span class="mt-2"><strong>지역 설정</strong></span>
					<div class="selectBox d-flex">
						<select class="form-select mt-2 w-25" name="sido1" id="sido1" onchange="selectBoxChange1(this.value);"></select> 
						<select class="form-select mt-2 w-25" name="gugun1" id="gugun1" onchange="selectBoxChange2(this.value);"></select>
						<button type="button" class="btn btn-primary mt-2 group_siteBtn ms-3">지역 선택 완료</button>
					</div>
					<!--모임 지역-->
					<input type="text" id="group_site" name="group_site"> 
					<input type="text" id="sido1Input" name="sido1Input"> 
					<input type="text" id="gugun1Input" name="gugun1Input">
				</div>
			</div>

			<!--메인 이미지-->
			<div class="row mt-5">
				<!--메인 이미지 아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-images"></i>
					</h4>
				</div>
				<!--이미지 올리기 -->
				<div class="col-9 mainTextFile d-flex flex-column justify-content-start">
					<h4>Main Image</h4>
					<span style="font-size: 14px;">썸네일로 보여질 이미지입니다. <br>본인이
						생각하는 최고의 사진을 넣어주세요!
					</span>
					<div class="imgBox mt-4">
						<img src="/resources/images/메인사진2(배경).png" id="groupDefaultImg">
					</div>
					<input type="file" class="form-control mt-3 w-75" name="groupFile"
						id="groupFile" />
				</div>
			</div>

			<!--인원수-->
			<div class="row mt-5">
				<!--위치 아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-user-group"></i>
					</h4>
				</div>
				<!--위치 설정  -->
				<div class="col-9 mainText mainTextMap d-flex flex-column justify-content-start">
					<h4>Member</h4>
					<span style="font-size: 14px;">인원수를 조정을 통해 유동적인 모임을 생성하세요!<br>
						인원은 최소 2명부터 최대 10명까지 가능합니다.
					</span> <strong class="mt-2">인원 설정</strong>
					<div class="memberCntBox d-flex mt-2 ">
						<div
							class="calBtn minusBtn d-flex justify-content-center align-items-center"
							id="minusBtn">
							<i class="fa-solid fa-minus"></i>
						</div>
						<div
							class="memberCnt d-flex justify-content-center align-items-center">2</div>
						<div
							class="calBtn plusBtn d-flex justify-content-center align-items-center"
							id="plusBtn">
							<i class="fa-solid fa-plus"></i>
						</div>
					</div>
					<input type="text" name="group_people" id="group_people" value="2">
				</div>
			</div>
			<!--이미지-->
			<div class="row mt-5">
				<!--이미지 아이콘-->
				<div class="col-3 mainIcon text-center">
					<h4>
						<i class="fa-solid fa-circle-info"></i>
					</h4>
				</div>
				<!--이미지 올리기 -->
				<div class="col-9 mainTextFile d-flex flex-column justify-content-start">
					<h4>Guideline</h4>
					<span>
						<h5>거의 다왔습니다! 잠시 시간을 내어 가이드라인을 읽어주세요.</h5>
					</span> <span style="font-size: 14px;" class="mt-2">끼리끼리는 끈끈한 커뮤니티를
						통해 사람들이 더욱 풍요롭고 행복한 삶을 <br>살 수 있도록 합니다. 따라서 모든 그룹은 다음 사항을
						충족해야 합니다.
					</span>
					<ul class="mt-2" style="font-size: 14px;">
						<li><i class="fa-solid fa-check"></i><span class="ms-3">회원에게
								성장의 기회 제공</span></li>
						<li><i class="fa-solid fa-check"></i><span class="ms-3">모든
								이벤트에 주최자 참석</span></li>
						<li><i class="fa-solid fa-check"></i><span class="ms-3">그룹의
								목적은 투명하게 공개</span></li>
					</ul>
				</div>
		</form>
	</div>
	</div>






	<!--뒤로가기 , 동의 후 등록-->
	<div class="mainFooter d-flex justify-content-center align-items-center mt-3">
		<span class="mainFooterBtnBox">
			<button class="btn btn-outline-warning">뒤로 가기</button>
			<button class="btn btn-primary ms-4" id="registerGroupBtn">동의후 등록</button>
		</span>
	</div>

	<!-- Footer-->
	<div class="footerWrapper" style="background-color: #fff;">
		<div class="container">
			<footer class="footer" style="background-color: #fff;">
				<div class="row">
					<div class="col-lg-3 footer-imgBox">
						<img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다." />
					</div>
					<div class="col-lg-6 h-100 text-center text-lg-start my-auto">
						<ul class="list-inline mb-2">
							<li class="list-inline-item"><a href="#!">공지사항</a></li>
							<li class="list-inline-item">⋅</li>
							<li class="list-inline-item"><a href="#!">회원가입</a></li>
							<li class="list-inline-item">⋅</li>
							<li class="list-inline-item"><a href="#!">로그인</a></li>
							<li class="list-inline-item">⋅</li>
							<li class="list-inline-item"><a href="#!">책임의 한계 및 법적고지</a>
							</li>
							<li class="list-inline-item">⋅</li>
							<li class="list-inline-item"><a href="#!"
								style="color: red; font-weight: bold">개인정보처리방침</a></li>
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
							<li class="list-inline-item me-4"><a href="#!"><i
									class="bi-facebook fs-3"></i></a></li>
							<li class="list-inline-item me-4"><a href="#!"><i
									class="bi-twitter fs-3"></i></a></li>
							<li class="list-inline-item"><a href="#!"><i
									class="bi-instagram fs-3"></i></a></li>
						</ul>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script>
  <!-- AOS 스크립트 시작 -->
  AOS.init(); // 자바스크립트로 init()을 해야 동작한다.

  // 지역 설정
  $('document').ready(function() {
	  var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	    var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	    var area3 = ["대덕구","동구","서구","유성구","중구"];
	    var area4 = ["광산구","남구","동구",     "북구","서구"];
	    var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	    var area6 = ["남구","동구","북구","중구","울주군"];
	    var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	    var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	    var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	    var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	    var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	    var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	    var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	    var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	    var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	    var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	  // 시/도 선택 박스 초기화
	  $("select[name^=sido]").each(function() {
	   $selsido = $(this);
	   $.each(eval(area0), function() {
	    $selsido.append("<option value='"+this+"'>"+this+"</option>");
	   });
	   $selsido.next().append("<option value=''>구/군 선택</option>");
	  });

	  // 시/도 선택시 구/군 설정
	  $("select[name^=sido]").change(function() {
	   var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	   var $gugun = $(this).next(); // 선택영역 군구 객체
	   $("option",$gugun).remove(); // 구군 초기화

	   if(area == "area0")
	    $gugun.append("<option value=''>구/군 선택</option>");
	   else {
	    $.each(eval(area), function() {
	     $gugun.append("<option value='"+this+"'>"+this+"</option>");
	    });
	   }
	  });
	 });
  
//리팩토링 필요
  // 지역 설정
  let sido1 = "";
  let gugun1 = "";
  // 시 설정
  let selectBoxChange1 = function (value) {
    // 초기화
    $("#sido1Input").val("");
    $("#gugun1Input").val("");
    $("#group_site").val("");

    // 값 담기
    sido1 = value;
    $("#sido1Input").val(sido1);

    // 고정값 설정
    if(sido1 == "서울특별시") {
      $("#gugun1Input").val("강남구");
    }else if(sido1 == "인천광역시") {
      $("#gugun1Input").val("계양구");
    }else if(sido1 == "대전광역시") {
      $("#gugun1Input").val("대덕구");
    }else if(sido1 == "광주광역시") {
      $("#gugun1Input").val("광산구");
    }else if(sido1 == "대구광역시") {
      $("#gugun1Input").val("남구");
    }else if(sido1 == "울산광역시") {
      $("#gugun1Input").val("남구");
    }else if(sido1 == "부산광역시") {
      $("#gugun1Input").val("강서구");
    }else if(sido1 == "경기도") {
      $("#gugun1Input").val("고양시");
    }else if(sido1 == "강원도") {
      $("#gugun1Input").val("강릉시");
    }else if(sido1 == "충청남도") {
      $("#gugun1Input").val("계룡시");
    }else if(sido1 == "충청북도") {
      $("#gugun1Input").val("제천시");
    }else if(sido1 == "전라북도") {
      $("#gugun1Input").val("군산시");
    }else if(sido1 == "전라남도") {
      $("#gugun1Input").val("광양시");
    }else if(sido1 == "경상북도") {
      $("#gugun1Input").val("경산시");
    }else if(sido1 == "경상남도") {
      $("#gugun1Input").val("거제시");
    }else if(sido1 == "제주도") {
      $("#gugun1Input").val("서귀포시");
    }
    if(!gugun1 == "") {
      $("#group_site").val(sido1 + " " + gugun1);
    }
  }

  // 구/군 선택
  let selectBoxChange2 = function (value) {
    $("#gugun1Input").val("");
    gugun1 = value
    $("#gugun1Input").val(gugun1);
  }

  $(".group_siteBtn").on("click",function() {
    if($("#sido1Input").val() == "") {
      Swal.fire('지역을 선택해주세요')
    }else {
      // 초기화
      $("#group_site").val("");
      // 값 셋팅
      let group_site = sido1 + " " + $("#gugun1Input").val()
      $("#group_site").val(group_site);
      Swal.fire(
      '지역 선택 완료',
      $("#group_site").val() + '를 선택하셨습니다.',
      'success'
    )
    }
  })
  

  // Form으로 전송
  $("#registerGroupBtn").on("click",function() {
	  // 구/군 변경시 비교 
	  let group_site_com = $("#sido1Input").val() + " " +$("#gugun1Input").val();
	  if($("#group_category").val() == "") {
		  Swal.fire("모임주제를 선택해주세요");
		  return;
	  }else if($("#group_title").val() == "") {
		  Swal.fire("모임 제목을 선택해주세요");
		  return;
	  }else if($(".group_info").val() == "") {
		  Swal.fire("모임 내용을 적어주세요");
		  return;
	  }else if($("#group_site").val() == "" || $("#sido1Input").val() == "") {
		  Swal.fire('지역 선택을 완료를 눌러주세요');
		  return;
	  }else if(group_site_com != $("#group_site").val()) { // 구/군 변경시 비교 대상
	      Swal.fire('지역 선택을 완료를 눌러주세요');
	      return;
	  }
	  
	 $("#groupForm").submit();
  })
  
  // 이미지 선택
  let groupFile = document.getElementById("groupFile");
  let groupDefaultImg = document.getElementById("groupDefaultImg");

  // 이미지 즉각 변환
  groupFile.onchange = function () {
    let reader = new FileReader();
    reader.readAsDataURL(this.files[0]);
   
    reader.onload = function (e) {
    	 console.log("e.target ", e.target.result);
    	groupDefaultImg.src = e.target.result;
    }
    
    console.log($("#groupFile").val());
  }

  // 카테고리 선택
  // 카테고리 선택
    $(".categoryBtn").on("click", function (e) {
      // 클래스 삭제 후
      $(".categoryBtn").removeClass("active");
      // 해당 클래스만 활성화
      e.target.className += " active";
      // 클릭하면 안보이는 input에 데이터 삽입
      $("#group_category").val(e.target.value);
      // 알림
      Swal.fire(
        '카테고리 선택 완료',
        e.target.value + '를 선택하셨습니다.',
        'success'
      )
    })

  // 지역 설정
  let selectBoxChange = function (value) {
    console.log(value);
    $("#group_site").val(value);
  }

  // 맴버수
  let memberCnt = Number($(".memberCnt").html());
  // 버튼 클릭시
  $(".calBtn").on("click", function () {
    if ($(this).attr("id") === "plusBtn") {
      countUp();
      cntCondition();
    } else if ($(this).attr("id") === "minusBtn") {
      countDown();
      cntCondition();
    }
  })

  // 숫자 증가
  function countUp() {
    memberCnt += 1;
    $(".memberCnt").html(memberCnt);
    $("#group_people").val(memberCnt);
  }

  // 숫자 감소
  function countDown() {
    memberCnt -= 1;
    $(".memberCnt").html(memberCnt);
    $("#group_people").val(memberCnt);
  }

  // 숫자 조건 (2~10)명
  function cntCondition() {
    let cnt = $("#group_people").val();
    if (cnt < 2) {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: '모임은 최소 2명부터 입니다!',
      });
      $(".memberCnt").html(2);
      $("#group_people").val(2);
    } else if (cnt > 10) {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: '모임은 최대 10명 까지입니다!',
      });
      $(".memberCnt").html(10);
      $("#group_people").val(10);
    }
  }

  
  </script>
</body>
</html>