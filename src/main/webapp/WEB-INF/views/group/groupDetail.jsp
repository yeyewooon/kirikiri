<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<!--차트 js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>모임 상세 페이지</title>
<style>
* {
      box-sizing: border-box;
      font-family: "OTWelcomeRA";
    }

    #mainText {
      font-family: "양진체";
    }

    /* header 반응형 */
    @media (max-width: 768px) {
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

    @media (min-width: 768px) {
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

    /* body menu */
    .groupImgBox {
      background-color: yellowgreen;
      height: 340px;
      width: 500px;
      border-radius: 10px;
    }

    .groupImgBox img {
      height: 340px;
      width: 500px;
      border-radius: 10px;
    }


    .groupActiveBtnBox {
      width: 480px;
      height: 40px;
    }

    .groupInfoSumTitle {
      word-break: break-all;
    }

    .infoSumLogo {
      width: 20px;
    }

    .groupInfo {
      width: 480px;
      word-break: break-all;
    }

    .hostImg {
      width: 80px;
      height: 80px;
      border-radius: 50%;
    }

    .hostImg img {
      width: 80px;
      height: 80px;
      border-radius: 50%;
    }

    .covidCautionBox {
      padding: 12px;
      border-radius: 10px;
    }

    .memberInfo {
      background-color: red;
      width: 400px;
      overflow: auto;
    }
    
    .groupActiveBtn, .groupInfoBtn {
    	cursor : pointer;
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
      src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2") format("woff2");
      font-weight: normal;
      font-style: normal;
    }

    @font-face {
      font-family: "양진체";
      src: url("https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff") format("woff");
      font-weight: normal;
      font-style: normal;
    }
	
	.uselessBox {
		height:40px;
	}
</style>

</head>
<body>
  <header class="mb-3 border-bottom" style="background-color: #fff;">
    <div class="container ">
      <!-- 접혔을 때 nav -->
      <nav id="navibar" class="navbar navbar-expand-md navbar-light" aria-label="Main navigation">
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
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            </div>
            <!-- 메뉴 -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
              <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href=" ">자유게시판</a>
                </li>
                <c:choose>
                  <c:when test="${empty loginSession}">
                    <li class="nav-item">
                      <a class="nav-link" href=" ">로그인</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=" ">회원가입</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="nav-item">
                      <a class="nav-link" href=" ">마이페이지</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=" ">로그아웃</a>
                    </li>
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
              <li class="nav-item">
                <a class="nav-link mx-2" href="">자유 게시판</a>
              </li>
            </ul>
          </div>
          <!-- logo -->
          <div class="col-2">
            <a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0">
              <img id="logoImgs" src="/resources/images/kiri.jpg" />
            </a>
          </div>
          <div class="col-5">
            <div class="row align-items-center justify-content-center">
              <div class="col-auto d-none">
                <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                  <c:if test="${empty loginSession}">
                    <li class="nav-item">
                      <a class="nav-link" href="/toLogin.mem">로그인</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/toSignUp.mem">회원가입</a>
                    </li>
                  </c:if>
                </ul>
              </div>
              <div class="col-auto user">
                <c:if test="${not empty loginSession}">
                  <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32"
                        class="rounded-circle" />
                    </a>
                    <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                      <li>
                        <a class="dropdown-item" href="#">마이페이지</a>
                      </li>
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

  <!--body-->
  ${memberList}
  ${applyList}
  ${wishList}
  <div class="container">
    <!--body-headline-->
    <div class="row">
      <div class="col-md-7 d-flex justify-content-center mt-2">
        <div class="groupImgBox">
        <c:choose>
			<c:when test="${tbl_group_dto.sys_name ne null}">
				<img src="/group_profile/${tbl_group_dto.sys_name}" id="profile_image">
			</c:when>
			<c:otherwise>
				<img src="/resources/images/메인사진2(배경).png" id="profile_image">
			</c:otherwise>
		</c:choose>
        </div>
      </div>
      <div class="col-md-5 mt-2">
        <div class="groupInfoSumTitle mt-1">
          <h3>${tbl_group_dto.group_title}</h3>
        </div>
        <div class="groupInfoSumBox mt-3">
          <div class="groupInfoSum d-flex align-items-center mt-1" style="font-size: 16px;">
            <div class="infoSumLogo"><i class="fa-solid fa-location-dot"></i></div>
            <div class="infoSumContent ms-2">위치 : ${tbl_group_dto.group_site}, 대한민국</div>
          </div>
          <div class="groupInfoSum d-flex align-items-center mt-1" style="font-size: 16px;">
            <div class="infoSumLogo"><i class="fa-solid fa-tags"></i></div>
            <div class="infoSumContent ms-2">카테고리 : ${tbl_group_dto.group_category}</div>
          </div>
          <div class="groupInfoSum d-flex align-items-center mt-1" style="font-size: 16px;">
            <div class="infoSumLogo"><i class="fa-solid fa-user-group"></i></div>
            <div class="infoSumContent ms-2">회원 : ${fn:length(memberList)}명 / ${tbl_group_dto.group_people}명</div>
          </div>
          <div class="groupInfoSum d-flex align-items-center mt-1" style="font-size: 16px;">
            <div class="infoSumLogo"><i class="fa-solid fa-user-tie"></i></div>
            <div class="infoSumContent ms-2">호스트 : ${memberList[0].user_nickname}</div>
          </div>
          <div class="groupInfoSum d-flex align-items-center mt-1" style="font-size: 16px;">
            <div class="infoSumLogo"><i class="fa-solid fa-heart"></i></div>
            <div class="infoSumContent ms-2">찜 : ${fn:length(wishList)}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--버튼 클릭-->
  <div class="mt-3" style="border-top: 1px solid #e0e3e8;">
    <div class="container">
      <!-- 이용 -->
      <div class="row mt-2">
        <div class="col-md-7 d-flex justify-content-center mt-1">
          <div class="groupActiveBtnBox d-flex justify-content-evenly align-items-center ">
            <div class="groupInfoBtn">상세 정보</div>
            <div class="groupActiveBtn">게시판</div>
            <div class="groupActiveBtn">일정</div>
            <div class="groupActiveBtn">채팅</div>
            <div class="groupActiveBtn groupManageBtn d-none"><a href="/group/toGroupMember=${tbl_group_dto.seq_group}">모임 관리</a></div>
          </div>
        </div>
        <div class="col-md-5 d-flex align-items-center mt-1">
          <button type=" button" class="btn btn-outline-info" id="wishListBtn">찜 하기</button>
          <button type=" button" class="btn btn-outline-info ms-2 d-none" id="wishCancelBtn">찜 취소</button>
          <button type=" button" class="btn btn-primary ms-2 d-none" id="quitGroupBtn">모임 탈퇴하기</button>
          <button type=" button" class="btn btn-primary ms-2" id="joinGroupBtn">모임 가입하기</button>
        </div>
      </div>
    </div>
  </div>
  
  <!--세부 정보-->
  <div style="background-color: #f6f7f9;">
    <div class="container mt-2">
      <div class="row mt-2">
        <div class="col-md-7 d-flex justify-content-center mt-2">
          <!--상세 정보 내용-->
          <div class="groupInfo mt-3">
            <div class="groupContent">
              ${tbl_group_dto.group_info}
            </div>
            <!--코로나 안전조치-->
            <div class="covidCautionBox mt-4" style="background-color: #fff;">
              <div><strong><i class="fa-solid fa-virus-covid"></i></strong><span class="ms-2">코로나 안전조치</span></div>
              <div class="mt-1 ms-4">이벤트 주최자는 본 이벤트를 위해 안전 조치를 시해하고 있습니다. "끼리끼리"는 이러한 예방 조치를 준수하는지
                확인할 책임이 없으며 개별적으로 확인하지도 않습니다.</div>
            </div>
            <!--주의 사항-->
            <div class="cautionBox mt-4 ms-3">
              <div class="mt-3">
                <h7><i class="fa-solid fa-message"></i><span class="ms-2">주최자 전달 메세지</span></i></h7>
              </div>
              <div class="mt-1 ms-3">
                <i class="fa-solid fa-check"></i> 인종, 언어, 성별 차별을 금지합니다.
              </div>
              <div class="mt-1 ms-3">
                <i class="fa-solid fa-check"></i> 다른 모임 비방을 금지합니다.
              </div>
              <div class="mt-1 ms-3">
                <i class="fa-solid fa-check"></i> 모임 분란 행위는 모임에서 탈퇴됩니다.
              </div>
              <div class="mt-1 ms-3">
                <i class="fa-solid fa-check"></i> 연락이 지속적으로 안될시, 강제로 모임에서 탈퇴됩니다.
              </div>
              <div class="uselessBox">
                
              </div>
            </div>

          </div>
        </div>
        <div class="col-md-5 mt-2 groupMemberrInfo">
          <!-- 주최자 -->
          <div style="font-size : 18px;" class="ms-2 mt-3"><h4>호스트</h4></div>
          <div class="hostInfo d-flex mt-1">
            <div class="hostImg">
              <img src="/resources/images/profile.jpg">
            </div>
            <div class="hostName d-flex align-items-center ms-3">
              <div class="">${memberList[0].user_nickname}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
                <li class="list-inline-item">
                  <a href="#!">책임의 한계 및 법적고지</a>
                </li>
                <li class="list-inline-item">⋅</li>
                <li class="list-inline-item">
                  <a href="#!" style="color: red; font-weight: bold">개인정보처리방침</a>
                </li>
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
            <div class="col-lg-3 h-100 text-center text-lg-end my-auto">
              <ul class="list-inline mb-0">
                <li class="list-inline-item me-4">
                  <a href="#!"><i class="bi-facebook fs-3"></i></a>
                </li>
                <li class="list-inline-item me-4">
                  <a href="#!"><i class="bi-twitter fs-3"></i></a>
                </li>
                <li class="list-inline-item">
                  <a href="#!"><i class="bi-instagram fs-3"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </footer>
      </div>
    </div>

    <script>
 	let seq_group = "${tbl_group_dto.seq_group}"; // 현재 모임 번호
 	let loginSession_id = "er8634"; // 로그인 세션
 	let hostEmail = "${memberList[0].user_email}"; // 주최자 아이디
 	
 	console.log(hostEmail);
 	console.log(loginSession_id);
 	
 	$(document).ready(function() {
 		// 해당 세션 id와 주최자가 같으면 모임 관리 페이지 보이게
 		if(loginSession_id == hostEmail) {
 			$(".groupManageBtn").removeClass("d-none");
 		}

 		// 현재 세션 id가 그룹맴버에 있으면 게시판,일정, 채팅 활동가능
 		$(".groupActiveBtn").on("click",function() {
 			let memberList = new Array(); // 빈 배열 생성
 	 	    <c:forEach items="${memberList}" var="dto">
 	 	   		memberList.push("${dto.user_email}");
 	 	    </c:forEach>
 	 	    for (let i = 0; i < memberList.length; i++) {
 	 	        if(memberList[i] == loginSession_id) {
 	 	        	// 그룹 활동 버튼
 	 	        	let activeText = this.innerHTML;
 	 	        	if(activeText == "게시판"){
 	 	        		location.href = "https://www.naver.com";
 	 	        	}else if(activeText = "일정") {
 	 	        		location.href = "/cal/toGroupCalendar?seq_group="+seq_group;
 	 	        	}else if(activeText = "채팅") {
 	 	        		location.href = "https://www.naver.com";
 	 	        	}
 	 	        }else {
 	 	        	Swal.fire('모임 맴버만 활동 가능합니다');
 	 	        	return;
 	 	        }
 	 	        break;
 	 	    } 
	    })
	       
 	 	// 세션이 모임에 가입되어 있으면 모임 탈퇴하기, 가입 안되어있으면 모입 가입하기
 		// 맴버 리스트 체크 -> 모임 가입하기인지 모임 탈퇴인지 판별
 		let memberList = new Array(); // 빈 배열 생성
 	    <c:forEach items="${memberList}" var="dto">
 	   		memberList.push("${dto.user_email}");
 	    </c:forEach>
 	    for (let i = 0; i < memberList.length; i++) {
 	    	console.log(memberList[i]);
 	        if(memberList[i] == loginSession_id) {
 	        	$("#joinGroupBtn").addClass("d-none"); // 가입 버튼 안보이게 
 	        	$("#quitGroupBtn").removeClass("d-none"); // 모임 탈퇴버튼 보이게
 	        	
 	        	// 그룹 활동 버튼
 	        }
 	    } 
 	    
 	   // 찜하기 판별 -> 찜 명단에 있으면 찜취소 있으면 찜하기
 	   let wishList = new Array();
	    <c:forEach items="${wishList}" var="dto">
	   		wishList.push("${dto.user_email}");
	    </c:forEach>
	    for (let i = 0; i < wishList.length; i++) {
	        if(wishList[i] == loginSession_id) { // 찜한 목록과 세션의 아이디
	        	$("#wishListBtn").addClass("d-none");
 	        	$("#wishCancelBtn").removeClass("d-none");
	        }
	    } 
 	    
 	})
    
      	// 모임 탈퇴 
      	$("#quitGroupBtn").on("click",function() {
      		if(hostEmail == loginSession_id) {
      			alert("탈퇴 못하게 하고 사이트로 이동시켜서 탈퇴시키기");
      		}else {
      			Swal.fire({
      			  title: '정말 모임에서 떠나시겠습니까?',
      			  text: "그 동안의 모임 기록들이 다 사라집니다.",
      			  icon: 'warning',
      			  showCancelButton: true,
      			  confirmButtonColor: '#3085d6',
      			  cancelButtonColor: '#d33',
      			  cancelButtonText: '아니요!',
      			  confirmButtonText: '네 떠날게요!'
      			}).then((result) => {
      			  if (result.isConfirmed) {
      				  
      				  $.ajax({
      					  url : "/group/quitGroupMember",
      					  type : "post",
      					  data : {"seq_group" : seq_group ,"user_email" : loginSession_id},
      				  	  success : function(data) {
      				  		  
      				  		  if(data == "success") {
      				  			Swal.fire(
      		      			      '모임에서 탈퇴하였습니다',
      		      			      '그 동안 감사했습니다!',
      		      			      'success'
      		      			    )
      				  		  }else {
      				  			  alert("모임 탈퇴 실패");
      				  		  }
      				  	  },
      				  	  error : function(e) {
      				  		  console.log(e);
      				  	  }
      				  })
      				  
      			  }
      			})
      		}
      		
      	})
   
      
		// 모임 가입
		$("#joinGroupBtn").on("click",function(){
			let curMemberCnt = ${fn:length(memberList)}; // 현재 맴버수 jstl memberList 길이
			let totalMemberCnt = ${tbl_group_dto.group_people}; // 수용가능 맴버수 
			if(curMemberCnt < totalMemberCnt) { // 현재 맴버수 < 수용 맴버수
				
				// 가입 신청한 명단에 현재 id 세션이 있는지 판별
				let applyList = new Array();
		 	    <c:forEach items="${applyList}" var="dto">
		 	   		applyList.push("${dto.user_email}");
		 	    </c:forEach>
		 	    for (let i = 0; i < applyList.length; i++) {
		 	    	console.log(applyList[i]);
		 	        if(applyList[i] == loginSession_id) { // 가입 대기
		 	        	Swal.fire(
		 	        			  '가입 대기중',
		 	        			  '호스트가 확인중에 있습니다!',
		 	        			  'question'
		 	        			)
		 	        	return;
		 	        }
		 	    } 
		 	    // 가입 신청한 명단에 현재 id 세션이 없으면 실행
				$.ajax({
					url : "/group/applyGroupMember",
					type: "post",
					data : {"seq_group" : seq_group,"user_email" : loginSession_id},
					success : function(data) {
				  		  if(data == "success") {
				  			Swal.fire(
								'모임가입 신청 완료!',
								'호스트가 승인을 할 때까지 기다려주세요!',
								'success'
							)
				  		  }	
				  	  },
				  	  error : function(e) {
				  		  console.log(e);
				  	  }
				})

			}else {
				Swal.fire({
		            icon: 'error',
		            title: 'Oops...',
		            text: '모임 정원이 가득찼습니다!',
		          });
			}
		})

		
		// 찜하기 
		$("#wishListBtn").on("click",function() {
			console.log("찜 하기")
			$.ajax({
				url : "/group/insertWishList",
				type : "post",
				data : {"seq_group" : seq_group, "user_email" : loginSession_id},
				success : function(data) {
					if(data == "success") {
						Swal.fire('찜 완료');
						$("#wishListBtn").addClass("d-none"); // 찜한 즉시 wishList 버튼 사라지게 
		 	        	$("#wishCancelBtn").removeClass("d-none"); // 찜한 취소한 즉시 wishList 버튼 보이게
		 	        	setTimeout(function() {
							window.location.href = "";
						},800);
					}
				},error : function(e) {
					console.log(e);
				}
			})
		})
		
		// 찜하기 취소 
		$("#wishCancelBtn").on("click",function() {
			console.log("찜취소");
			$.ajax({
				url : "/group/deletetWishList",
				type : "post",
				data : {"seq_group" : seq_group, "user_email" : loginSession_id},
				success : function(data) {
					if(data == "success") {
						Swal.fire('찜 취소');
						$("#wishListBtn").removeClass("d-none"); // 찜한 즉시 wishList 버튼 사라지게 
		 	        	$("#wishCancelBtn").addClass("d-none"); // 찜한 취소한 즉시 wishList 버튼 보이게
		 	        	setTimeout(function() {
							window.location.href = "";
						},800);
					}
					
				},
				error : function(e) {
					console.log(e);
				}
			})
		})


    </script>
</body>
</html>