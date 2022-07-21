<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    </style>
</head>
<body>
    <div class="container">
        <div id="head" class="row text-center align-items-center">
            <h1>자유 게시판</h1>
        </div>

        <div class="row mt-4">
            <div class="col-2">
                <select class="form-select" aria-label="유형">
                    <option value="all" selected>전체</option>
                    <option value="notice">공지</option>
                    <option value="general">일반</option>
                    <option value="review">후기</option>
                </select>
            </div>
            <div class="col-4">
                <input type="search" class="form-control w-50" placeholder="검색">
                <button type="button" id="searchBtn" class="btn btn-primary">
                    <img src="/resources/images/searchIcon.png">
                </button>
            </div>
            <div class="col-6">
                <button type="button" id="writeBtn" class="btn btn-primary float-end">글쓰기</button>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col">
                <table class="table text-center">
                    <thead>
                      <tr>
                        <th class="col-2">유형</th>
                        <th class="col-5">제목</th>
                        <th class="col-2">닉네임</th>
                        <th class="col-2">작성일</th>
                        <th class="col-1">조회수</th>
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
                    					<td class="col-2">${dto.board_category}</td>
                    					<td class="col-5">
                    						<a href="/board/toDetailView?seq_board=${dto.seq_board}">
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
    </div>
    
    <script>
 		// 글쓰기 요청
	    $("#writeBtn").on("click", function(){ 
			location.href = "/board/toWrite";
		})
    </script>
</body>
</html>