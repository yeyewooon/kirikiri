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
<title>게시글 상세보기</title>
    
    <style>
        body {
            /*font-family: 'OTWelcomeRA';*/
            background-color: #d2e3ec;
            height: 100px;
        }

        .container {
            background-color: white;
            padding-left: 80px;
            padding-right: 80px;
        }

        /* .form-control{
            display: inline-block;
        } */
	
		/* 컨텐츠 영역 */
        #category {
            background-color: pink;
            border-radius: 60px;
            color: white;
        }

        #title {
            font-weight: bold;
        }

        hr {
            opacity: 1;
        }
        
       	#content img{
       		max-width: 100%;
       		height: auto;
       	}
		
		/* 댓글 영역 */
        .profileBox{
            /* background-color: gray; */
            width: 100px;
            height: 100px;
        }
        .profileBox img{
        	border-radius: 50%;
            width: 100%;
            height: 100%;
        }
        .comment{
            border: none;
        }

        /* 눈누 폰트 */
        @font-face {
            font-family: 'OTWelcomeRA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: '양진체';
            src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
    </style>
</head>
<body>
    <div class="container my-5 py-5">
        <div class="row text-center">
            <div class="col-auto my-3 fs-5 pt-2" id="category">${detail.boardDTO.board_category}</div>
        </div>

        <div class="row mt-3 mb-0">
            <h2 id="title" name="board_title">${detail.boardDTO.board_title}</h2>
        </div>

        <div class="row mt-4 justify-content-between align-items-center">
            <div class="col-auto">
                <i class="fa-regular fa-clock me-3"> ${detail.boardDTO.board_date}</i>
                <i class="fa-regular fa-font-awesome me-3"> ${detail.boardDTO.board_count}</i>
                <i class="fa-regular fa-comment-dots"> 12</i>
            </div>
            <div class="col-auto d-flex justify-content-end">
                <div class="fw-bold fs-4 me-2">작성자</div>
                <div class="fw-bold fs-4 me-3">|</div>
                <div class="fw-bold fs-4">${detail.boardDTO.user_nickname}</div>
            </div>
        </div>
        <hr size="4px;">
		
		<!-- 내용 -->
        <div class="row my-3">
            <div id="content">
                <p>${detail.boardDTO.board_content}</p>
            </div>
        </div>
	
		<!-- 댓글 영역 -->
        <div class="row border p-2">
            <div class="col-12" id="body-comment">
                <!-- 댓글 출력 -->
                <c:choose>
	                <c:when test="${detail.commentList.size() == 0}">
	                	<!-- 댓글 없으면 -->
	                	<div class="col-12 my-3 text-center">
	                		<p class="fs-4">등록된 댓글이 없습니다.</p>
	                	</div>
	                </c:when>
	                <c:otherwise>
	                	<c:forEach items="${detail.commentList}" var="comment">
	                		<div class="row align-items-center">
	                			<!-- 프로필 이미지 -->
			                    <div class="col-2 d-flex justify-content-center">		                        
			                        <div class="profileBox">
			                            <img src="/resources/images/profile.jpg">
			                        </div>
			                    </div>
								
								<!-- 내용 -->
			                    <div class="col-10">
			                        <div class="row mb-1">
			                            <div class="col-auto ms-2">${comment.user_nickname}</div>
			                            <div class="col-lg-7 col-md-5 ms-2">${comment.comment_date}</div>
			                        </div>
			
			                        <div class="row">
			                            <div class="col-9">
			                                <input type="text" class="form-control comment" value="${comment.comment}" readonly>
			                            </div>
			                            <!-- 댓글 수정/삭제 버튼 -->
					                <%-- <c:if test="${comment.user_email eq loginSession.user_email}"> --%>
					                	<div class="col-3 defaultComment">
					                		<button type="button" class="btn btn-warning modify-reply me-2">수정</button>
					                		<button type="button" class="btn btn-danger delete-reply" value="${reply.seq_reply}">삭제</button>
					                	</div>
					                	<%-- <div class="col-3 afterComment">
					                		<button type="button" class="btn btn-secondary cancel-reply me-2">취소</button>
					                		<button type="button" class="btn btn-primary complete-reply" value="${reply.seq_reply}">완료</button>
					                	</div> --%>
					                <%-- </c:if> --%>
			                        </div>
			                    </div>
			                </div>
			                
			                <hr>
	                	</c:forEach>
	                </c:otherwise>
                </c:choose>                
            </div>
        </div>

        <!-- 댓글 등록 -->
        <form id="commentForm" action="/comment/write" method="post">
	        <div class="row mt-4 p-0">
	        	<input class="d-none" id="seq_board" name="seq_board" value="${detail.boardDTO.seq_board}">
				<div class="col-10">
					<!-- <input class="form-control" type="text" style="height: 60px" placeholder="댓글을 입력하세요."> -->
					<textarea id="inputComment" name="comment" style="resize: none;" class="form-control" placeholder="댓글을 입력하세요"></textarea>
				</div>
				<div class="col-2">
					<button type="button" id="write-commentBtn" class="btn btn-primary w-100 h-100 fs-5">등록</button>
					<!-- <button type="button" id="testBtn" class="btn btn-primary w-100 h-100 fs-5">테스트</button> -->
				</div>
	        </div>
        </form>
       
        <!-- 게시글 수정 / 삭제 버튼 -->
        <div class="row mt-4 justify-content-center">
            <div class="col-auto">
                <button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
            </div>
            <div class="col-auto">
                <button type="button" id="deleteBtn" class="btn btn-primary">삭제</button>
            </div>
        </div>
    </div>
    
    <script>
    	// 게시글 수정
    	$("#modifyBtn").on("click", function(){
    		location.href = "/board/toModify?seq_board=" + ${detail.boardDTO.seq_board};
    	})
    	
    	// 게시글 삭제
    	$("#deleteBtn").on("click", function(){
    		let answer = confirm("삭제된 게시글은 복구가 불가합니다. 정말 삭제하시겠습니까?");
    		if(answer){
    			/* let deleteForm = $("<form>").attr({
    				"method" : "post"
    				, "action" : "/board/delete"
    			}).css("display", "none");
    			deleteForm.append($("#seq_board"));
    			deleteForm.appendTo("body");
    			deleteForm.submit(); */
    			location.href = "/board/delete?seq_board=" + ${detail.boardDTO.seq_board};
    		}
    	})
    	
    	// 댓글 등록
    	$("#write-commentBtn").on("click", function(){
    		if($("#inputComment").val() === ""){ // 댓글 입력창 비었으면
    			alert("입력된 댓글이 없습니다. 댓글을 입력해 주세요.");
    			return;
    		}
    		
    		let comment = $("#commentForm").serialize();
    		$("#inputComment").val(""); // 댓글 입력창 초기화
    		
    		$.ajax({
    			url : "/comment/write"
    			, type : "post"
    			, data : comment
    			// , dataType : "json"
    			, success : function(data){
    				//makeComment(data);
    				$("#body-comment").load(location.href + " #body-comment");
    			}, error : function(e){
    				console.log(e);
    				alert("댓글 등록에 실패했습니다.");
    			}
    		})
    	})
    	
    	function makeComment(data){
    		/* json 형식 문자열을 자바스크립트 객체 형식으로 변환 */
    		let list = JSON.parse(data);
    		
    		// 댓글 영역 모두 지워줌
    		$(".body-comment").empty();
    		if(list.length == 0){
    			let div = $("<div>").addClass("col-12 my-3 text-center");
    			let p = $("<p>").addClass("fs-4").html("등록된 댓글이 없습니다.");
        		div.append(p);
        		$(".body-comment").append(div);
    		}else{
    			for(let comment of list){
    				let header = $("<div>").addClass("row align-items-center");
    				let imgDiv = $("<div>").addClass("col-2 d-flex justify-content-center");
    				let profileDiv = $("<div>").addClass("profileBox");
    				let img = $("<img>").attr("src", "/resources/images/profile.jpg");
    				profileDiv.append(img);
    				imgDiv.append(profileDiv);
    				header.append(imgDiv);
    				
					/*<!-- 내용 -->
                    <div class="col-10">
                        <div class="row mb-1">
                            <div class="col-auto ms-2">${comment.user_nickname}</div>
                            <div class="col-lg-7 col-md-5 ms-2">${comment.comment_date}</div>
                        </div>

                        <div class="row">
                            <div class="col-10">
                                <input type="text" class="form-control comment" value="${comment.comment}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 댓글 수정/삭제 버튼 -->
                <c:if test="${comment.user_email eq loginSession.id}">
                	<div class="col-3 defaultComment">
                		<button type="button" class="btn btn-warning modify-reply me-2">수정</button>
                		<button type="button" class="btn btn-danger delete-reply" value="${reply.seq_reply}">삭제</button>
                	</div>
                	<div class="col-3 afterComment">
                		<button type="button" class="btn btn-secondary cancel-reply me-2">취소</button>
                		<button type="button" class="btn btn-primary complete-reply" value="${reply.seq_reply}">완료</button>
                	</div>
                </c:if>*/
    			}
    		}
    	}
    </script>
</body>
</html>