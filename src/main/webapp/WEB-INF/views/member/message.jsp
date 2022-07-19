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
/* footer */
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
                  <a href="/" id="navLogo" class="mb-2 mb-lg-0"> <img
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
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a>
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
                     <img src="/resources/images/${memberdto.user_image}" id="profile_image">
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
         <div class="row">   
            <div class="col-12" style="display:flex; justify-content:end;">
                  <select class="form-select" aria-label="Default select example"
                     id="boardCategory" name="boardCategory" style="width: 100px;">
                     <option value="genal">일반</option>
                     <option value="meeting">모임</option>
                  </select>
                  <input class="d-none" type="text" id="user_email" value="${memberdto.user_email}">
                  <select class="form-select" aria-label="Default select example"
                     name="category" style="width: 100px;">
                     <option value="board_all">전체</option>
                     <option value="board_title">제목</option>
                     <option value="board_content">내용</option>
                  </select>      
                  <input type="text" name="keyword" class="form-control" placeholder="검색" style="width: 250px;">      
                  <button type="button" class="btn btn-outline-secondary" id="searchBtn"
                     style="width: 70px;">검색</button>
            </div>
         </div>      
      <div class="row body py-5" style="border-top-width: 0px">
         <table class="table table-striped memberTable text-center mt-3"
            id="tableBox">
            <thead>
               <tr>
                  <th scope="col">유형</th>
                  <th scope="col">제목</th>
                  <th scope="col">내용</th>
                  <th scope="col">작성일</th>
                  <th scope="col">조회수</th>
                  <th scope="col">삭제</th>
               </tr>
            </thead>
            <tbody>
                   <tr>
                      <td>일반</td>
                     <td>${selectBoardList.board_title}</td>
                     <td>${selectBoardList.board_content}</td>
                     <td>${selectBoardList.board_date}</td>
                     <td>${selectBoardList.board_count}</td>
                     <td id="icon"><span class="text-center boardDelete" style="cursor:pointer;"
                        id="boardDelete"><i class="fa-solid fa-trash"></i></span></td>
                     <td class="d-none" id="seq_board">${selectBoardList.seq_board}</td>
                  </tr>
                   <tr>
                      <td>모임</td>
                     <td>${selectGroupBoardList.title}</td>
                     <td>${selectGroupBoardList.content}</td>
                     <td>${selectGroupBoardList.written_date}</td>
                     <td>${selectGroupBoardList.view_count}</td>
                     <td id="icon"><span class="text-center groupBoardDelete" style="cursor:pointer;"
                        id="groupBoardDelete"><i class="fa-solid fa-trash"></i></span></td>
                     <td class="d-none" id="seq_group_board">${selectGroupBoardList.seq_group_board}</td>
                  </tr>
            </tbody>
         </table>
         <input type = "text" class="d-none" id="user_email" value="${memberdto.user_email}">
         <nav aria-label="Page navigation example">
            <ul class="pagination">
               <li class="page-item"><a class="page-link" href="#"
                  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
               </a></li>
               <li class="page-item"><a class="page-link" href="#">1</a></li>
               <li class="page-item"><a class="page-link" href="#">2</a></li>
               <li class="page-item"><a class="page-link" href="#">3</a></li>
               <li class="page-item"><a class="page-link" href="#"
                  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
               </a></li>
            </ul>
         </nav>
      </div>
     
      <!-- Footer-->
      <footer class="footer mt-5">
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
                  <li class="list-inline-item"><a href="#!">책임의 한계 및 법적고지</a></li>
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
</body>
</html>