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
       	.likeBtn{
       		border: none;
       		background-color: transparent;
       	}
       	.likeBtn img{
       		width: 50px;
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

        <div class="row mt-4 justify-content-between align-items-center" id="board-head-row">
            <div class="col-auto" id="board-head-col">
                <i class="fa-regular fa-clock me-3"> ${detail.boardDTO.board_date}</i>
                <i class="fa-regular fa-font-awesome me-3"> ${detail.boardDTO.board_count}</i>
                <i class="fa-regular fa-comment-dots"> ${detail.commentCnt}</i>
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
        
        <!-- 좋아요 영역 -->
        <div class="row justify-content-center mb-3" id="body-like">
        	<c:choose>
        		<%-- 로그인 상태일 때 --%>
        		<c:when test="${not empty loginSession.user_email}">
	        		<c:choose>
	        			<%-- 추천 안누름 --%>
	        			<c:when test="${like.likeCheck == 0}">
	        				<div class="col-auto">
			        			<button class="likeBtn" id="likeBefore" value="${detail.boardDTO.seq_board}">
			        				<img src="/resources/images/emptyheart.png" alt="좋아요">
			        			</button>
			        			<span>${like.likeHit}</span>
			        		</div>
	        			</c:when>
	        			<%-- 추천 누름 --%>
	        			<c:otherwise>
	        				<div class="col-auto">
			        			<button class="likeBtn" id="likeAfter" value="${detail.boardDTO.seq_board}">
			        				<img src="/resources/images/fullheart.png" alt="좋아요">
			        			</button>
			        			<span>${like.likeHit}</span>
			        		</div>
	        			</c:otherwise>
	        		</c:choose>
	        	</c:when>
	        	
	        	<%-- 로그인 x일 때 --%>
	        	<c:otherwise>
		        	<div class="col-auto">
				        <button id="like-notLoginBtn" value="${detail.boardDTO.seq_board}">
				        	<img src="/resources/images/emptyheart.png" alt="좋아요">
				        </button>
				        <span>${like.likeHit}</span>
					</div>
	        	</c:otherwise>
	        </c:choose>
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
			                                <textarea class="form-control comment" style="resize: none;" readonly>${comment.comment}</textarea>
			                            </div>
			                            <c:if test="${loginSession.user_email eq 'admin'}">
			                           		<div class="col-3 defaultComment">
						                		<button type="button" class="del-commentBtn btn btn-danger" value="${comment.seq_comment}">삭제</button>
						                	</div>
			                            	<div class="col-3 afterComment d-none">
						                		<button type="button" class="btn btn-secondary mod-cancelBtn me-2">취소</button>
						                		<button type="button" class="btn btn-primary mod-completeBtn" value="${comment.seq_comment}">완료</button>
						                	</div>
			                            </c:if>
			                            <!-- 댓글 수정/삭제 버튼 -->
					                	<c:if test="${comment.user_email eq loginSession.user_email && loginSession.user_email ne 'admin'}">
						                	<div class="col-3 defaultComment">
						                		<button type="button" class="mod-commentBtn btn btn-warning me-2" value="${comment.seq_comment}">수정</button>
						                		<button type="button" class="del-commentBtn btn btn-danger" value="${comment.seq_comment}">삭제</button>
						                	</div>
						                	<div class="col-3 afterComment d-none">
						                		<button type="button" class="btn btn-secondary mod-cancelBtn me-2">취소</button>
						                		<button type="button" class="btn btn-primary mod-completeBtn" value="${comment.seq_comment}">완료</button>
						                	</div>
					                	</c:if>
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
	        <c:if test="${loginSession.user_email eq detail.boardDTO.user_email}">
	        	 <div class="col-auto">
	                <button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
	            </div>
	            <div class="col-auto">
	                <button type="button" id="deleteBtn" class="btn btn-primary">삭제</button>
	            </div>
	        </c:if>
	        <div class="col-auto">
	        	<button type="button" id="toListBtn" class="btn btn-primary">뒤로가기</button>
	        </div>
        </div>
		<form id="infoForm" method="get">
			<input type="hidden" id="seq_board" name="seq_board" value="${detail.boardDTO.seq_board}">
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value="${cri.type}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
    </div>
    
    <script>
    	// 목록으로 돌아가기
    	$("#toListBtn").on("click", function(){
    		$("#infoForm").find("#seq_board").remove();
    		$("#infoForm").attr("action", "/mem/toWrite");
    		$("#infoForm").submit();
    	})
    	
    	// 게시글 수정
    	$("#modifyBtn").on("click", function(){
    		//location.href = "/board/toModify?seq_board=" + ${detail.boardDTO.seq_board};
    		$("#infoForm").attr("action", "/board/toModify");
    		$("#infoForm").submit();
    	})
    	
    	// 게시글 삭제
    	$("#deleteBtn").on("click", function(){
    		let answer = confirm("삭제된 게시글은 복구가 불가합니다. 정말 삭제하시겠습니까?");
    		if(answer){
    			location.href = "/board/delete?seq_board=" + ${detail.boardDTO.seq_board};
    		}
    	})
    	
    	// 좋아요
    	$("#body-like").on("click", ".likeBtn", function(){
    		let seq_board = $(this).val();
    		// 로그인 세션의 id
    		let user_email = "${loginSession.user_email}";
    		//let user_email = "abc123";
    		
    		if($(this).attr("id") == "likeBefore"){
    			updateLike(seq_board, user_email);
    		}else if($(this).attr("id") == "likeAfter"){
    			//$(this).addClass("d-none");
    			updateLike(seq_board, user_email);
    		}
    	})
    	
    	// 로그인 안한 상태에서 하트 클릭시
    	$("#like-notLoginBtn").on("click", function(){
    		alert("로그인 후 좋아요를 눌러주세요!");
    	})
    	
    	// 좋아요 함수
    	function updateLike(seq_board, user_email){
    		$.ajax({
    			type : "post"
    			, url : "/like/boardLike"
    			, dataType : "json"
    			, data : {
    				"seq_board" : seq_board
    				, "user_email" : user_email
    			}, success : function(likeCheck){
    				console.log("ajax의 체크: " + likeCheck);
    				if(likeCheck == 0){
    					alert("게시글 추천 완료!");
    					$("#body-like").load(location.href + " #body-like");
    				}
    				else if(likeCheck == 1){
    					alert("게시글 추천 취소");
    					$("#body-like").load(location.href + " #body-like");
    				}
    			}, error : function(e){
    				console.log(e);
    			}
    		});
    	}
    	
    	
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
    				if(data === "success"){
    					$("#body-comment").load(location.href + " #body-comment");
    					$("#board-head-row").load(location.href + " #board-head-col");
    				}else{
    					alert("댓글 등록에 실패했습니다.");
    				}
    			}, error : function(e){
    				console.log(e);
    			}
    		})
    	})
    	
    	// 댓글 수정
    	$("#body-comment").on("click", ".mod-commentBtn", function(e){
    		$(e.target).parent(".defaultComment").addClass("d-none");
    		$(e.target).parent().next(".afterComment").removeClass("d-none");
    		$(e.target).parent().prev().children(".comment").attr("readonly", false).focus();
    	})
    	
    	// 댓글 수정 취소
    	$("#body-comment").on("click", ".mod-cancelBtn", function(e){
    		$(e.target).parent(".afterComment").addClass("d-none");
    		$(e.target).parent().prev(".defaultComment").removeClass("d-none");
    		$(e.target).parent().prev().prev().children(".comment").attr("readonly", true);
    	})
    	
    	// 댓글 수정 완료
    	$("#body-comment").on("click", ".mod-completeBtn", function(e){
    		$(e.target).parent(".afterComment").addClass("d-none");
    		$(e.target).parent().prev(".defaultComment").removeClass("d-none");
    		$(e.target).parent().prev().prev(".comment").attr("readonly", true);
    		
    		let comment = $(e.target).parent().prev().prev().children("textarea").val();
    		let seq_comment = $(e.target).val();
    		
    		$.ajax({
    			url : "/comment/modify"
    			, type : "post"
    			, data : {
    				seq_comment : seq_comment
    				, "comment_content" : comment
    			}, success : function(data){
    				if(data === "success"){
    					alert("댓글이 수정되었습니다.");
        				$("#body-comment").load(location.href + " #body-comment");
    					$("#board-head-row").load(location.href + " #board-head-col");
    				}else{
    					alert("댓글 수정에 실패했습니다.");
    				}			
    			}, error : function(e){
    				console.log(e);
    			}
    		})
    	})
    	
    	// 댓글 삭제
    	$("#body-comment").on("click", ".del-commentBtn", function(e){
    		let seq_comment = $(e.target).val();
    		
    		$.ajax({
    			url : "/comment/delete"
    			, type : "post"
    			, data : { seq_comment : seq_comment }
    			, success : function(data){
    				if(data === "success"){
    					alert("댓글이 삭제되었습니다.");
        				$("#body-comment").load(location.href + " #body-comment"); 
        				$("#board-head-row").load(location.href + " #board-head-col");
    				}else{
    					alert("댓글 삭제에 실패했습니다.");
    				}			
    			}, error : function(e){
    				console.log(e);
    			}
    		})
    	})
    	
    </script>
</body>
</html>