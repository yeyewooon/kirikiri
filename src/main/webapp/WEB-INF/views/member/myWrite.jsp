<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myWrite</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
* {
	box-sizing: border-box;
}

#mainText {
	font-family: "양진체";
}
/* benu */
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

.header {
	background-color: #d2e3ec;
	justify-content: end;
	width: 100%;
}

h2 {
	margin-top: 100px;
}

.line {
	border: 2px solid rgb(57, 88, 122);
	margin-top: 10px;
	width: 180px;
	box-shadow: 3px 2px 2px rgb(25, 104, 184);
}
/* header 부분 */
.header {
	background-color: #d2e3ec;
	justify-content: start;
	width: 100%;
}

.profile {
	margin: auto;
}

#profile_image {
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

#profilePic {
	border: 0.1rem solid black;
	margin: auto;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	box-shadow: 3px 3px 5px 5px rgb(182, 181, 181);
}

#profilePic:hover {
	transition: 0.8s ease-in;
	transform: scale(1.1);
}

#profilePic:not(:hover) {
	transition: 0.8s ease-out;
}

#profileName {
	font-size: 1.5em;
}

hr {
	margin-top: 80px;
}
/* body */
.pagination {
	justify-content: center;
}

#memberDelete {
	cursor: pointer;
}

.table { 
	--bs-table-striped-bg: rgba(23, 109, 167, 0.05);
}

.Board {
	cursor: pointer;
}
.genal, .meeting{
	margin-top: 20px;
	align-items: center;
}
.genal span,.meeting span{
	cursor:pointer;
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
</style>
</head>
<body>
	<!-- page Benu -->
	<!--네비바-->
        <header class="mb-3 border-bottom">
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
	<div class="container py-5">
		<!-- header 부분 -->
		<div class="row header">
			<div class="col-md-6 mt-3 mb-4">
				<div id="profilePic">
					<c:choose>
						<c:when test="${empty memberdto.user_image}">
							<img src="/resources/images/default_profile.jpg"
								id="profile_image">
						</c:when>
						<c:otherwise>
							<img src="/profile/${memberdto.user_image}" id="profile_image">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-md-5 mt-4">
				<div class="col-12 mt-3" id="profileName">
					<strong>${memberdto.user_name}</strong> <span style="font-size: 15px">님</span>
				</div>
				<div class="col-12 mt-3" id="totalCount">
					<i class="fa-solid fa-file-pen"></i> <span> 전체 게시글 : </span> <span>
						${totalBoardCount}</span>
				</div>
				<div class="col-12 mt-3" id="boardCount">
					<i class="fa-solid fa-file-pen"></i> <span> 일반 게시글 : </span> <span>${selectBoardCount}</span>
				</div>
				<div class="col-12 mt-3" id="roomCount">
					<i class="fa-solid fa-file-pen"></i> <span> 모임 게시글 : </span> <span>
						${selectGroupBoardCount}</span>
				</div>
			</div>
		</div>
		<hr />
		<form id="searchForm">
			<div class="row">	
				<div class="col-12" style="display:flex; justify-content:end;">
					<input class="d-none" type="text" id="user_email" value="${memberdto.user_email}">
					<select class="form-select title" aria-label="Default select example"
						name="boardNameCategory" style="width: 100px;">
						<option value="normal">일반</option>
						<option value="meeting">모임</option>
					</select>
					<select class="form-select" aria-label="Default select example"
						name="category" id="category" style="width: 100px;">
						<option value="board_all">전체</option>
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
					</select>		
					<input type="text" name="keyword" class="form-control keyword" placeholder="검색" style="width: 250px;">		
					<button type="button" class="btn btn-outline-secondary" id="searchBtn" style="width: 70px;">검색</button>
				</div>
			</div>	
		</form>
		<script>
		/* enter키 event */
		 $(".keyword").on("keyup",function(key){  
			if(key.keyCode==13) {     
				 $("#searchBtn").click();
			}     
		});
		/* 첫 번째 selectBox 함수 */
		function selectBoardList(url,type){
			let user_email = $("#user_email").val();
			const curPage = 1;
			$.ajax({
				url,
				type:"post",
				data: {"user_email":user_email, "curPage": curPage},
				dataType: "json",
				success:function(data){
					makeDynamicEl(data, curPage, type);
				},
				error: function(e){
					console.log(e);
				}
			}); 
		}
		/* 첫 번째 selectBox */
		let selectedCategory = 'normal'
		$('.title').on('change', function() {
			selectedCategory = this.value;
			if (selectedCategory =="normal") {
				selectBoardList("/mem/genalBoard","일반");
			} else {
				selectBoardList("/mem/meetingBoard","모임");
			}
		})
		
		/* 검색 기능 */
		$("#searchBtn").on("click",function(){
			let data = $("#searchForm").serialize();
			let keyword = $(".keyword").val();
			let user_email = $("#user_email").val();
			let curPage = 1;
			let url;
			let type;
			if(selectedCategory === 'normal') {
				url = "/mem/normalSearch?user_email=" + user_email + "&curPage=" + curPage;
				type = '일반'; 
			} else {
				url = "/mem/meetingSearch?user_email=" + user_email + "&curPage=" + curPage;
				type = '모임';
			}
			 $.ajax({
				url,
				type:"get",
				data: data,
				dataType:"json",
				success:function(data){
					 makeDynamicEl(data, curPage, type, keyword); 
				},
				error: function(e){
					console.log(e);
				}
			}); 					
			})
		
		// 동적으로 함수로 다른 값 파라미터 받고 함수로 만들기
		 function makeDynamicEl(data, curPage, type, keyword){
			$("tbody").empty();
			$(".pagination").empty();
			
			if(data.length == 0){
				let tr=$("<tr>");
				let td = $("<td colspan=6>").append("검색 결과가 없습니다.");
				tr.append(td);
				tr.appendTo("tbody");
			} else {
				const startPage = 1;
				const endPage = Math.ceil(data.length / 10);
				const ul = $(".pagination");
				
				if(curPage > startPage) {
					const li = $("<li>");
					const a = $("<a>");
					const i = $("<i>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + Number(curPage - 1));
					ajaxPagination(data, curPage - 1, a, type, keyword);
					i.addClass("fa-solid fa-angle-left");
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				for (let i = startPage; i <= endPage; i++) {
					const li = $("<li>");
					const a = $("<a>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + i);
					ajaxPagination(data, i, a, type, keyword);
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				if(curPage < endPage) {
					const li = $("<li>");
					const a = $("<a>");
					const i = $("<i>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + Number(curPage + 1));
					ajaxPagination(data, curPage + 1, a, type, keyword);
					i.addClass("fa-solid fa-angle-right");
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				const startIdx = (curPage - 1) * 10;
				let endIdx;
				if (curPage * 10 < data.length) {
					endIdx = curPage * 10;
				} else {
					endIdx = data.length;
				}
				
				for(let i = startIdx; i < endIdx; i++){
					const dto = data[i];
					console.log(dto)
					let tr = $("<tr>");
					let td1 = $("<td>").append(type);
					let td2;
					let td3;
					let td4;
					let td5;
					let td6;
					let td7;
					let span = $("<span>");
					let a;
					
					if (type === '일반') {
						td2 = $("<td>").append(dto.board_title);
						
						td3 = $("<td>");
						a = $("<a>");
						a.attr('href','/board/toDetailView?seq_board='+dto.seq_board);
						a.css({
							'text-decoration':'none',
							'color':'black'
						});
						a.append(dto.board_content);
						a.appendTo(td3);
						
						td4 = $("<td>").append(dto.board_date);
						td5 = $("<td>").append(dto.board_count);
						td6 = $("<td>");
						td6.attr('id','icon');
						
						let i = $("<i>");
						i.addClass('fa-solid fa-trash');
						span.append(i);
						td6.append(span);
						
						td7 = $("<td>").append(dto.seq_board);
						td7.addClass('d-none');
						td7.attr('id','seq_board');
						
						span.addClass('text-center boardDelete');
						span.css('cursor','pointer');
						span.on("click", function() {
							boardDelete(this, "/mem/boardDelete", "seq_board")
						});
					} else if (type === '모임') {
						td2 = $("<td>").append(dto.title);
						
						td3 = $("<td>");
						a = $("<a>");
						a.attr('href','/board/toDetailView?seq_group_board='+dto.seq_group_board);
						a.css({
							'text-decoration':'none',
							'color':'black'
						});
						a.append(dto.content);
						a.appendTo(td3);
						td4 = $("<td>").append(dto.written_date);
						td5 = $("<td>").append(dto.view_count);
						td6 = $("<td>");
						td6.attr('id','icon');
						
						let i = $("<i>");
						i.addClass('fa-solid fa-trash');
						span.append(i);
						td6.append(span);
						
						td7 = $("<td>").append(dto.seq_group_board);
						td7.addClass('d-none');
						td7.attr('id','seq_group_board');
						
						span.addClass('text-center boardGroupDelete');
						span.css('cursor','pointer');
						span.on("click", function() {
							boardDelete(this, "/mem/groupBoardDelete", "seq_groud_board")
						});
					}
					
					tr.append(td1, td2, td3, td4, td5, td6, td7);
					tr.appendTo("tbody");
				}
			}
		} 
		
		/* genal 동적 el가져다가 ajax로 받은거 사용하기 */
		function ajaxPagination(data, curPage, target, type, keyword) {
			console.log(data, curPage, target, type, keyword);
			let url;
			if (type === '일반') {
				if (!keyword) {
					url = "/mem/genalBoard"
				} else {
					url = "/mem/normalSearch"
				}
			} else if (type === '모임') {
				if (!keyword) {
					url = "/mem/meetingBoard"
				} else {
					url = "/mem/meetingSearch"
				}
			}
			target.on("click", function(e) {
				e.preventDefault();
				let category = $("#category option:selected").val();
				let user_email = $("#user_email").val();
				$.ajax({
					url,
					type:"get",
					data: {"category": category,"user_email": user_email, "curPage": curPage, "keyword": keyword},
					dataType: "json",
					success:function(data){
						if (type === '일반') {
							if (!keyword) {
								makeDynamicEl(data, curPage, type);
							} else {
								makeDynamicEl(data, curPage, type, keyword);
							}
						} else if (type === '모임') {
							if (!keyword) {
								makeDynamicEl(data, curPage, type);
							} else {
								makeDynamicEl(data, curPage, type, keyword);
							}
						}
					},
					error: function(e){
						console.log(e);
					}
				}); 
			})
		}

		</script>
		<div class="row body py-3" style="border-top-width: 0px">
			<table class="table table-striped memberTable text-center mt-3"
				id="tableBox">
				<thead>
					<tr>
                   		<th scope="col">유형</th>
                  		<th scope="col">제목</th>
                 		<th scope="col">작성일</th>
                  		<th scope="col">조회수</th>
                  		<th scope="col">삭제</th>
                   </tr>
				</thead>
				<tbody>
					 <c:forEach items="${list}" var="selectBoardList">
					 	<tr>
                      		<td>일반</td>
                     		<td><a href="/board/toDetailView?seq_board=${selectBoardList.seq_board}" style="color:black; text-decoration:none;"  onclick="window.open(this.href, '_blank', 'width=1000, height=800'); return false;">${selectBoardList.board_title}</a></td>
                     		<td>${selectBoardList.board_date}</td>
                     		<td>${selectBoardList.board_count}</td>
                     		<td id="icon"><span class="text-center boardDelete" style="cursor:pointer;" id="boardDelete"><i class="fa-solid fa-trash"></i></span></td>
                     		<td class="d-none" id="seq_board">${selectBoardList.seq_board}</td>
                  		</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type = "text" class="d-none" id="user_email" value="${memberdto.user_email}">
			
			<!-- 검색전 pagination -->
			<div class="pagination mt-4 justify-content-center" id="page">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${naviMap.startNavi-1}"><i
									class="fa-solid fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${naviMap.endNavi+1}"><i
									class="fa-solid fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<script>
		
		/* 게시글 삭제 */
		// targetId = "#seq_group_board"
		// url = "/mem/boardDelete"
		// dataType = "seq_board"
		function boardDelete(target, url, dataType){
			console.log($(target));
			let seq_board = +$(target).parent().next().text();
			let user_email = $("#user_email").val();
			console.log("seq_board: ", seq_board)
			console.log(typeof dataType)
			Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "다시 복구 할수 없습니다.!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      '삭제 완료!',
			      '희망 모임을 삭제하였습니다.',
			      'success'
			    ).then(function() {
			    	$.ajax({
						url,
						type: "post",
						data: dataType === 'seq_board' ? {"seq_board": seq_board} : {"seq_group_board": seq_board},
						success:function(data){
							if(data =='success'){
								$(this).parent().parent().remove();
								location.reload();
							}
						},
						error: function(e){
							console.log(e);
						}
					})
                });
			  }
			})
		}
		$(".boardDelete").on("click", function() {
			boardDelete(this, "/mem/boardDelete", "seq_board")
		});
		
		$(".boardGroupDelete").on("click", function() {
			boardDelete(this, "/mem/groupBoardDelete", "seq_groud_board")
		});
		
		</script>
		<!-- Footer-->
		<footer class="footer mt-5">
			<div class="row">
				<div class="col-lg-3 footer-imgBox">
					<img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다.">
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-start my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="board/toBoard">공지사항</a></li>
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
						<li class="list-inline-item"><a href="privacy"
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
</body>
</html>