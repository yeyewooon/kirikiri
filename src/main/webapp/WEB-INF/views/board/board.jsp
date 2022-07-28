<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<title>자유 게시판</title>

    <style>
        #head{
            background-color: #d2e3ec;
            height: 100px;
        }
        .form-control{
            display: inline-block;

        }
        #searchBtn img{
        	width: 23px;
        	height: 24px;
        }
        
        #boardList a{
        	text-decoration: none;
        	color: black;
        }
        /* 버튼 색상 */
        .btn-primary{
        	
        }
        
        /* 게시글 구분 선택 */
        .sortBox{
        	height: 50px;
        	line-height: 50px;
        	list-style: none;
        	margin: 0;
        	padding: 0;
        }
        .sortBox li{
        	box-sizing: border-box;
        	width: 25%;
        	float: left;
        	background-color: #d2e3ec;
        	border: 1px solid white;
        	text-align: center;
        }
        .sortBox li:hover{
        	background-color: #d2e3ec9e;
        }
        .sortBox a{
        	color: black;
        	text-decoration: none;
        }
        
        /* breadcrumb */
        .breadcrumb a{
        	text-decoration: none;
        	color: #a6a6a6;
        }
        .breadcrumb a:hover{
        	text-decoration: underline;
        }
        
        /* 페이징 */
		/* .active{
			background-color: #d2e3ec;
		} */
    </style>
</head>
<body>
    <div class="container">
        <div id="head" class="row text-center align-items-center">
            <h1>자유 게시판</h1>
        </div>
		<div class="container" style="width: 90%">
			<div class="row mt-4 justify-content-end">
				<div class="col-auto">
		            <c:choose>
		            	<c:when test="${loginSession.user_email eq 'admin'}">
		            		<button type="button" id="writeBtn" class="btn btn-primary">관리자 글쓰기</button>
		            	</c:when>
		            	<c:otherwise>
		            		<button type="button" id="writeBtn" class="btn btn-primary">글쓰기</button>
		            	</c:otherwise>
		            </c:choose>
				</div>
			</div>
			
			<!-- breadcrumb -->
			<div class="row">
				<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="#">게시판</a></li>
						<li class="breadcrumb-item text-dark" aria-current="page">자유게시판</li>
					</ol>
				</nav>
			</div>
			
			<!-- 유형별 정렬 -->
			<div class="row justify-content-center">
				<ul class="sortBox">
					<a href="/board/toBoard"><li>전체</li></a>
					<a href="#"><li>공지</li></a>
					<a href="#"><li>일반</li></a>
					<a href="#"><li>후기</li></a>
				</ul>
			</div>
			
			<!-- 게시글 -->
	        <div class="row mt-3" id="boardList">
	            <div class="col">
	                <table class="table table-hover text-center">
	                    <thead>
	                      <tr>
	                        <th class="col-2">구분</th>
	                        <th class="col-4">제목</th>
	                        <th class="col-2">닉네임</th>
	                        <th class="col-2">작성일</th>
	                        <th class="col-2">조회</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                    	<c:choose>
	                    		<c:when test="${list.size() == 0}">
	                    			<tr>
	                    				<td colspan="5">등록된 게시글이 없습니다.</td>
	                    			</tr>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:forEach items="${list}" var="dto">
	                    				<tr>
	                    					<td class="col-2">
		                    					<c:choose>
		                    						<c:when test="${dto.board_category eq '공지'}">
		                    							<i class="fa-solid fa-bullhorn"></i>
		                    						</c:when>
		                    						<c:otherwise>
		                    							${dto.board_category}
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</td>
	                    					<td class="col-5 text-center">
	                    						<%-- /board/toDetailView?seq_board=${dto.seq_board} --%>
	                    						<a class="move" href="${dto.seq_board}">
	                    							${dto.board_title}
	                    						</a>
	                    					</td>
	                    					<td class="col-2">${dto.user_nickname}</td>
	                    					<td class="col-2">${dto.board_date}</td>
	                    					<td class="col-1">${dto.board_count}</td>
	                    				</tr>
	                    			</c:forEach>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </tbody>
					</table>
	            </div>
	        </div>
	        
	        <!-- 페이징 -->
	        <div class="row mt-4 pageInfo_wrap">
	        	<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo pagination justify-content-center">
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous page-item">
								<a class="page-link" href="${pageMaker.startPage-1}">이전</a>
							</li>
						</c:if>
						
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>
						
						<!-- 다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next page-item">
		                    	<a href="${pageMaker.endPage + 1 }">다음</a>
		                    </li>
		                </c:if> 
					</ul>
	        	</div>
	        </div>
	        <form id="moveForm" method="get">
	        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	        	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="category" value="${pageMaker.cri.category}">
	        </form>
	        
	        <!-- 검색 -->
			<div class="search_wrap">
				<div class="search_area row mt-4 justify-content-center">
					<div class="col-auto">
						<select id="type" name="type" class="form-select" aria-label="유형">
							<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>전체</option>
							<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 + 내용</option>
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 + 작성자</option>
						</select>
					</div>
					<div class="col-5">
						<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" class="form-control" placeholder="검색">
					</div>
					<div class="col-auto">
						<button type="button" id="searchBtn" class="btn btn-primary">
							<img src="/resources/images/searchIcon.png">
						</button>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <script>
    	// 공지사항 배경
    	$(document).ready(function(){
    		$(".fa-bullhorn").parents("tr").css("backgroundColor", "pink");
    	});
    	
    	// 페이징
    	$(".move").on("click", function(e){
    		e.preventDefault();
    		
    		$("#moveForm").append("<input type='hidden' name='seq_board' value='" + $(this).attr("href")+"'>");
    		$("#moveForm").attr("action", "/board/toDetailView");
    		$("#moveForm").submit();
    	});
    	
    	// 페이지 이동 번호
    	$(".pageInfo a").on("click", function(e){
    		e.preventDefault();
    		$("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
    		$("#moveForm").attr("action", "/board/toBoard");
    		$("#moveForm").submit();
    	});
    	
 		// 글쓰기 요청
	    $("#writeBtn").on("click", function(){ 
			location.href = "/board/toWrite";
		})
		
		// 정렬
		//let category;
		$(".sortBox a").on("click", function(e){
			let category = $(this).text();
			if(category != '전체'){
				e.preventDefault();
				
				$("#moveForm").find("input[name='category']").val(category);
				$("#moveForm").find("input[name='pageNum']").val(1);
				$("#moveForm").submit();
			}
		
			//category = $(this).text();
			//console.log(category);
			/* $.ajax({
				url : "/board/sort"
				, type : "get"
				, data : { "category" : category }
				, dataType : "json"
				, success : function(data){
					//console.log(data);
					makeDynamicEl(data);
				}, error : function(e){
					console.log(e);
				}
			}); */
		});
		
		// 검색
		$("#searchBtn").on("click", function(e){
			e.preventDefault();
			
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			
			/* if(!type){
				alert("검색 종류를 선택하세요.");
				return false;
			} */
			
			if(!keyword){
				alert("검색어를 입력하세요.");
				return false;
			}
			
			$("#moveForm").find("input[name='type']").val(type);
			$("#moveForm").find("input[name='keyword']").val(keyword);
			$("#moveForm").find("input[name='pageNum']").val(1);
			$("#moveForm").submit();
			
			//let option = $("#option").val();
			//let keyword = $("#keyword").val();
			//console.log(category, keyword, option);
			
			/* $.ajax({
				url : "/board/search"
				, type : "post"
				, data : {
					"category" : category
					, "keyword" : keyword
					, "option" : option
				}, dataType: "json"
				, success : function(data){
					//console.log(data);
					makeDynamicEl(data);
				}, error : function(e){
					console.log(e);
				}
			}); */
		})
		
		// 게시글 목록 ajax
		function makeDynamicEl(data){
			$("tbody").empty();
			if(data.length == 0){ // 검색 결과 없음
				let tr = $("<tr>");
				let td = $("<td colspan=5>").append("검색 결과가 없습니다.");
				tr.append(td);
				tr.appendTo("tbody");
			}else{ // 검색 결과 있음
				for(let dto of data){
					let tr = $("<tr>");
					let td1 = $("<td>").addClass("col-2");
					if(dto.board_category == '공지'){
						td1.append('<i class="fa-solid fa-bullhorn"></i>');
					}else{
						td1.append(dto.board_category);
					}
					let td2 = $("<td>").addClass("col-5 text-start");
					let a = $("<a>").attr("href", "/board/toDetailView?seq_board="+dto.seq_board).append(dto.board_title);
					td2.append(a);
					let td3 = $("<td>").addClass("col-2").append(dto.user_nickname);
					let td4 = $("<td>").addClass("col-2").append(dto.board_date);
					let td5 = $("<td>").addClass("col-1").append(dto.board_count);
					
					tr.append(td1, td2, td3, td4, td5);
					tr.appendTo("tbody");
					
					$(".fa-bullhorn").parents("tr").css("backgroundColor", "pink");
				}	
			}
		}
 		
    </script>
</body>
</html>