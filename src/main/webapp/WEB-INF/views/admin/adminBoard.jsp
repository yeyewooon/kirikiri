<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>끼리끼리-회원관리</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <!--구글 폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"
    ></script>
    <!-- AOS 라이브러리 불러오기-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <!-- 아이콘 -->
    <script
      src="https://kit.fontawesome.com/f9358a6ceb.js"
      crossorigin="anonymous"
    ></script>
    <!--알림창-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <style>
      * {
        box-sizing: border-box;
        font-family: "MICEGothic Bold";
      }

      /* 눈누 폰트 */
      @font-face {
        font-family: "BMJUA";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }

      @font-face {
        font-family: "MICEGothic Bold";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2")
          format("woff2");
        font-weight: 700;
        font-style: normal;
      }

      /*사이드바*/
      .sidebar {
        float: left;
        width: 20%;
        height: 1200px;
        background-color: #4e78f5;
      }

      .sidebar span {
        font-family: "BMJUA";
      }

      .sidebar li {
        list-style: none;
        border-bottom: 3px solid rgba(255, 255, 255, 0.63);
        text-align: center;
      }

      .sidebar a:hover {
        color: white;
      }

      .logoHome span {
        color: white;
        font-size: x-large;
        font-weight: 80px;
      }

      #logoImg {
        width: 70%;
      }

      a {
        text-decoration: none;
        font-size: larger;
        color: rgba(255, 255, 255, 0.683);
      }

      /*네비바*/
      .navbar {
        float: right;
        height: 104px;
        width: 80%;
        background-color: white;
        position: relative;
      }

      .user {
        border-radius: 50%;
        width: 50px;
        height: 50px;
        position: absolute;
        right: 20px;
        background-color: white;
        border: 1px solid gainsboro;
      }

      .userName {
        position: absolute;
        right: 80px;
      }

      #user_img {
        border-radius: 50%;
        width: 50px;
        height: 50px;
      }

      .logOut {
        position: absolute;
        right: 19px;
        top: 28px;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        background-color: gray;
        display: none;
      }

      .logout {
        position: absolute;
        top: -7px;
        right: 8px;
        font-size: xx-large;
        color: white;
      }

      /*content*/
      .contents {
        background-color: rgb(224, 230, 243);
        width: 100%;
        height: 1200px;
      }

      /*회원관리 색 다르게*/
      .boardMenu {
        background-color: #a0e4f9ac;
      }

      .memberMenu > a {
        color: white;
      }

      /*content안에*/
      .reportBox {
        margin: auto;
        width: 75%;
        height: max-content;
        max-height: 200px;
        background-color: white;
        overflow-y: scroll;
      }

      .reportBox::-webkit-scrollbar {
        display: none;
      }

      .searchBox {
        margin: auto;
        width: 75%;
        height: 70px;
        background-color: white;
      }

      .resultBox {
        margin: auto;
        width: 75%;
        height: max-content;
        max-height: 550px;
        background-color: white;
      }

      .resultBox::-webkit-scrollbar {
        display: none;
      }

      .resultBox span {
        height: max-content;
      }

      tbody tr {
        border-top: 1px solid gainsboro;
        color: rgb(103, 103, 103);
        text-align: center;
        height:35px;
      }

      td {
        font-size: 12px;
      }

      td > a {
        color: rgb(103, 103, 103);
        font-size: 12px;
      }
    </style>
  </head>

  <body>
    <div class="container">
      <div class="sidebar">
        <ul class="p-2">
          <li class="logoHome">
            <a href="/admin/toAdmin">
              <img src="/resources/images/adminLogo.png" id="logoImg" /><br />
              <span>끼리끼리</span>
            </a>
          </li>
          <li class="sidemenu">
            <a href="/admin/toMember?curPage=1">
              <i class="fa-solid fa-users-rectangle"></i><br />
              <span>회원 관리</span>
            </a>
          </li>
          <li class="sidemenu boardMenu">
            <a href="/admin/toBoard?curPage=1">
              <i class="fa-solid fa-table"></i><br />
              <span>게시물 관리</span>
            </a>
          </li>
          <li class="sidemenu">
            <a href="/admin/toGroupAdmin?curPage=1">
              <i class="fa-solid fa-house-user"></i><br />
              <span>모임 관리</span>
            </a>
          </li>
        </ul>
      </div>
      <div class="navbar">
        <div class="userName">| &nbsp&nbsp admin</div>
        <div class="user">
          <img src="/resources/images/해삐루피.png" id="user_img" />
        </div>
        <div class="logOut">
          <i class="logout fa-solid fa-arrow-right-from-bracket"></i>
        </div>
      </div>
      <div class="contents">
        <div class="row title mt-2">
          <div class="col mt-4 ms-4">
            <h4 style="color: darkblue; text-shadow: 1px 1px 1px dodgerblue">
              게시물 관리
            </h4>
          </div>
        </div>
        <form id="searchForm">
	        <div class="row searchBox">
	          <div class="d-flex align-items-center m-auto w-75">
	            <select name="boardNameCategory" class="form-select title w-25 me-3">
	              <option value="normal">일반</option>
	              <option value="meeting">모임</option>
	            </select>
	            <select id="category" name="category" class="form-select w-25 me-3">
	              <option value="board_all" selected>ALL</option>
	              <option value="board_title">title</option>
	              <option value="board_content">content</option>
	            </select>
	            <input class="form-control keyword me-2" name="keyword" id="searchKeyword" type="search" placeholder="검색" aria-label="Search"/>
	            <button class="btn btn-outline-primary" type="button" id="searchBtn">
	              Search
	            </button>
	          </div>
	        </div>
        </form>
        <div class="row resultBox mt-3">
          <table>
            <thead style="background-color: gainsboro; text-align: center">
              <tr>
                <th scope="col">유형</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">삭제</th>
              </tr>
            </thead>
            <tbody id="tbody">
              <c:choose>
                <c:when test="${list.size() == 0}">
                  <tr>
                    <td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach items="${list}" var="dto">
                    <tr>
	                    <td>일반</td>
						<td>${dto.board_title}</td>
						<td>${dto.board_content}</td>
						<td>${dto.board_date}</td>
						<td>${dto.board_count}</td>
						<td id="icon"><span class="text-center boardDelete" style="cursor:pointer;"
							id="boardDelete"><i class="fa-solid fa-trash"></i></span></td>
						<td class="d-none" id="seq_board">${dto.seq_board}</td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>

    <!-- 검색전 pagination -->
		<div class="pagination mt-4 justify-content-center" id="page">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${naviMap.needPrev eq true}">
						<li class="page-item"><a class="page-link"
							href="/admin/adminBoard?curPage=${naviMap.startNavi-1}"><i
								class="fa-solid fa-angle-left"></i></a></li>
					</c:if>
					<c:forEach var="pageNum" begin="${naviMap.startNavi}" end="${naviMap.endNavi}">
						<li class="page-item"><a class="page-link" href="/admin/toBoard?curPage=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${naviMap.needNext eq true}">
						<li class="page-item"><a class="page-link"
							href="/admin/adminBoard?curPage=${naviMap.endNavi+1}"><i
								class="fa-solid fa-angle-right"></i></a></li>
					</c:if>
				</ul>
			</nav>
		</div>
      </div>
    </div>
    <script>
      /* 첫 번째 selectBox 모임, 일반 구분 */
      let selectedCategory = "normal";
      $(".title").on("change", function () {
        selectedCategory = this.value;
        if (selectedCategory == "normal") {
          selectBoardList("/admin/generalBoard", "일반");
        } else {
          selectBoardList("/admin/meetingBoard", "모임");
        }
      });
      
      /* 첫 번째 selectBox 함수 */
      function selectBoardList(url, type) {
        const curPage = 1;
        $.ajax({
          url,
          type: "post",
          data: {"curPage": curPage },
          dataType: "json",
          success: function (data) {
            makeDynamicEl(data, curPage, type);
          },
          error: function (e) {
            console.log(e);
          },
        });
      }


      /* 검색 기능 */
      $("#searchBtn").on("click", function () {
        let data = $("#searchForm").serialize();
        let keyword = $(".keyword").val();
        let curPage = 1;
        let url;
        let type;
        if (selectedCategory === "normal") {
          url = "/admin/normalSearch";
          type = "일반";
        } else {
          url = "/admin/meetingSearch";
          type = "모임";
        }
        $.ajax({
          url,
          type: "get",
          data: data,
          dataType: "json",
          success: function (data) {
            console.log(data.length);
            makeDynamicEl(data, curPage,type ,keyword);
          },
          error: function (e) {
            console.log(e);
          },
        });
      });
      
      //검색하는거 enter 키
      $("#searchKeyword").on("keyup", function (key) {
        if (key.keyCode == 13) {
          $("#searchBtn").click();
        }
      });

      // 동적으로 함수로 다른 값 파라미터 받고 함수로 만들기
      function makeDynamicEl(data, curPage, type ,keyword) {
        $("tbody").empty();
        $(".pagination").empty();

        if (data.length == 0) {
          let tr = $("<tr>");
          let td = $("<td colspan=6>").append("검색 결과가 없습니다.");
          tr.append(td);
          tr.appendTo("tbody");
        } else {
          const startPage = 1;
          const endPage = Math.ceil(data.length / 10);
          const ul = $(".pagination");

          if (curPage > startPage) {
            const li = $("<li>");
            const a = $("<a>");
            const i = $("<i>");

            li.addClass("page-item");
            a.addClass("page-link");
            a.attr("href", "/admin/toBoard?curPage=" + Number(curPage - 1));
            ajaxPagination(data, curPage - 1, a, type, keyword);
            i.addClass("fa-solid fa-angle-left");

            a.append(i);
            li.append(a);
            ul.append(li);
          }

          for (let i = startPage; i <= endPage; i++) {
            const li = $("<li>");
            const a = $("<a>");

            li.addClass("page-item");
            a.addClass("page-link");
            a.attr("href", "/admin/toBoard?curPage=" + i);
            ajaxPagination(data, i, a, type, keyword);

            a.append(i);
            li.append(a);
            ul.append(li);
          }

          if (curPage < endPage) {
            const li = $("<li>");
            const a = $("<a>");
            const i = $("<i>");

            li.addClass("page-item");
            a.addClass("page-link");
            a.attr("href", "/admin/toBoard?curPage=" + Number(curPage + 1));
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

          for (let i=startIdx; i < endIdx; i++) {
        	const dto = data[i];
            let tr = $("<tr>");
            let td1 = $("<td>").append(type);
            let td2;
            let td3;
            let td4;
            let td5;
            let td6;
            let td7;
            let span = $("<span>");
            if (type === "일반") {
              td2 = $("<td>").append(dto.board_title);
              td3 = $("<td>").append(dto.board_content);
              td4 = $("<td>").append(dto.board_date);
              td5 = $("<td>").append(dto.board_count);
              td6 = $("<td>");
              td6.attr("id", "icon");

              let i = $("<i>");
              i.addClass("fa-solid fa-trash");
              span.append(i);
              td6.append(span);

              td7 = $("<td>").append(dto.seq_board);
              td7.addClass("d-none");
              td7.attr("id", "seq_board");

              span.addClass("text-center boardDelete");
              span.css("cursor", "pointer");
              span.on("click", function () {
                boardDelete(this, "/admin/boardDelete", "seq_board");
              });
            } else if (type === "모임") {
              td2 = $("<td>").append(dto.title);
              td3 = $("<td>").append(dto.content);
              td4 = $("<td>").append(dto.written_date);
              td5 = $("<td>").append(dto.view_count);
              td6 = $("<td>");
              td6.attr('id', 'icon');

              let i = $("<i>");
              i.addClass("fa-solid fa-trash");
              span.append(i);
              td6.append(span);

              td7 = $("<td>").append(dto.seq_group_board);
              td7.addClass("d-none");
              td7.attr('id', 'seq_group_board');

              span.addClass("text-center boardGroupDelete");
              span.css("cursor", "pointer");
              span.on("click", function () {
                boardDelete(this, "/admin/groupBoardDelete", "seq_groud_board");
              });
            }

            tr.append(td1, td2, td3, td4, td5, td6, td7);
            tr.appendTo("tbody");
          }
        }
      }
      
      /* general 동적 el가져다가 ajax로 받은거 사용하기 */
		function ajaxPagination(data, curPage, target, type, keyword) {
			let url;
			if (type === '일반') {
				if (!keyword) {
					url = "/admin/generalBoard"
				} else {
					url = "/admin/normalSearch"
				}
			} else if (type === '모임') {
				if (!keyword) {
					url = "/admin/meetingBoard"
				} else {
					url = "/admin/meetingSearch"
				}
			}
			
			target.on("click", function(e) {
				e.preventDefault();
				let category = $("#category option:selected").val();
				console.log(category)
				$.ajax({
					url,
					type:"get",
					data: {"category":category,"curPage": curPage, "keyword": keyword},
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
      
	/* 게시글 삭제 */

	function boardDelete(target, url, dataType){
		let seq_board = +$(target).parent().next().text();
		console.log("seq_board: ", seq_board)
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
		boardDelete(this, "/admin/boardDelete", "seq_board")
	});
	
	$(".boardGroupDelete").on("click", function() {
		boardDelete(this, "/admin/groupBoardDelete", "seq_groud_board")
	});

    //로그아웃 부분
    $(".user").mouseenter(function () {
      $(".logOut").css({ display: "block", "z-index": "99" });
    });
    $(".user").mouseleave(function () {
      $(".logOut").css("display", "none");
    });
    $(".logOut").click(function () {
      Swal.fire({
        title: "정말 로그아웃 하시겠습니까?",
        showConfirmButton: false,
        showDenyButton: true,
        showCancelButton: true,
        denyButtonText: `로그아웃`,
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isDenied) {
          Swal.fire("로그아웃 성공", "", "info");
        }
      });
    });
    </script>
  </body>
</html>
