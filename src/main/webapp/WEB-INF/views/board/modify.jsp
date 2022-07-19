<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- summernote -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
    <style>
    	* {
            box-sizing: border-box;
            font-family: 'OTWelcomeRA';
        }
        
        /* header 반응형 */
        @media (max-width : 768px) {
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

        @media (min-width : 768px) {
            #navibar {
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

        #logoImg {
            width: 50%;
        }
        
        /* header 반응형 끝 */
        
    	/* contents 영역 */
        #head{
            background-color: #d2e3ec;
            height: 100px;
        }
        #head>h1{
            margin-top: 20px;
        }
        label {
            margin-top: 5px;
        }
        
        /* 눈누 폰트 */
		@font-face {
			font-family: 'OTWelcomeRA';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
				format('woff2');
			font-weight: normal;
			font-style: normal;
		}
		
		@font-face {
			font-family: '양진체';
			src:
				url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		/* summernote에 추가할 눈누 */
		@font-face {
		    font-family: 'EarlyFontDiary';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EarlyFontDiary.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		.dropdown-toggle::after {
            display: none;
        }
		
	</style>
</head>
<body>
	<div class="container">
        <div id="head" class="row text-center align-items-center mb-5">
            <h1>글 수정</h1>
        </div>
        
        <form id="modifyForm" action="/board/modify" method="post">
        	<!-- 임시로 아이디, 닉네임 넣어주기 -->
        	<div class="d-none">
        		<input type="text" name="user_email" value="abc123">
        		<input type="text" name="user_nickname" value="테스트맨1">
        	</div>
        	
        	<div class="d-none">
        		<input type="text" id="seq_board" name="seq_board" value="${modMap.boardDTO.seq_board}">
        	</div>
	        <div class="row mt-4 text-center">
	            <div class="col-1">
	                <label class="form-label fs-5">분류</label>
	            </div>
	            <div class="col-2">
	                <select name="board_category" class="form-select" aria-label="유형">
	                    <option selected>선택</option>
	                    <option value="공지">공지</option>
	                    <option value="일반">일반</option>
	                    <option value="후기">후기</option>
	                </select>
	            </div>
	            <div class="col-1">
	                <label class="form-label fs-5">제목</label>
	            </div>
	            <div class="col-8">
	                <input type="text" id="title" name="board_title" class="form-control" value="${modMap.boardDTO.board_title}">
	            </div>
	        </div>
			
	        <div class="row mt-4">
				<textarea id="summernote" name="board_content">${modMap.boardDTO.board_content}</textarea>
	        </div>
	        
	        <div class="row my-4 justify-content-center">
	            <div class="col-auto">
	                <button type="button" id="cancelBtn" class="btn btn-secondary">취소</button>
	            </div>
	            <div class="col-auto">
	                <button type="button" id="submitBtn" class="btn btn-primary">수정 완료</button>
	            </div>
	        </div>
        </form>
        
	</div>
	
	
	<script>
		/* summernote */
		$(document).ready(function() {
			var fontList = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','EarlyFontDiary', '맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'];
			$('#summernote').summernote({
				  height: 450, // 에디터 높이
				  minHeight: 300, // 최소 높이
				  maxHeight: 550, // 최대 높이
				  focus: true, // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR", // 한글 설정
				  placeholder: '최대 1000자까지 작성 가능합니다.', //placeholder 설정
				  toolbar: [
						// [groupName, [list of button]]
						['fontname', ['fontname']], // 글꼴
						['fontsize', ['fontsize']], // 글자 크기
						// 굵기, 기울임꼴, 밑줄, 취소선, 서식 지우기
					    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
					 	// 글자 색
					    ['color', ['forecolor', 'color']],
					 	// 그림첨부, 링크만들기, 동영상첨부
					    ['insert',['picture', 'link', 'video']],
					    // 글머리, 번호매기기, 문단정렬
					    ['para', ['ul', 'ol', 'paragraph']],
					    // 줄간격
					    ['height', ['height']],
						// 표 만들기
					    ['table', ['table']],
					 	// 코드보기, 확대해서보기, 도움말
					    ['view', ['codeview', 'help']]
				  ],
				  // 추가한 글꼴
				  fontNames: fontList,
				  // 추가한 폰트 사이즈
				  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				  fontNamesIgnoreCheck: fontList,
				  callbacks: {
					  onImageUpload : function(files, editor, welEditable){
						  // 파일 업로드(다중 업로드를 위해 반복문 사용)
						  for (var i = files.length - 1; i >= 0; i--) {
							  uploadSummernoteImageFile(files[i], this);
						  }
					  }
				  }
			});
			
			// 주기적으로 감지할 대상 요소 선정
			let target = document.querySelector(".note-editable");
			
			// DOM의 어떤 부분을 감시할지를 옵션 설정
			let config = { 
				childList: true, // 자식노드 추가/제거 감지
				subtree : true, // 대상 노드의 자식 뿐만 아니라 손자 이후로 모두 감시
			};
			
			// 옵저버 인스턴스 생성, 콜백함수 설정
			let observer = new MutationObserver(function(mutationList){ // 타겟에 변화가 일어나면 콜백함수를 실행하게 된다.
				//console.log(mutationList);
				for(let mutation of mutationList){
					if(mutation.removedNodes.length == 1){
						if(mutation.removedNodes[0].src != null) {
							let img = mutation.removedNodes[0].src;
							//console.log(img);
							let src = img.replace("http://localhost/boardFile/", "")
							//console.log(src);
							$.ajax({
								url : "/board/delImg"
								, type : "post"
								, data : {"src" : src}
								, success : function(data){
									console.log(data);
								}, error : function(e){
									console.log(e);
								}
							})
						}
					}
				}
			}); 

			// 감지 시작
			observer.observe(target, config);
		});
		
		// summernote 이미지 업로드 function
		function uploadSummernoteImageFile(file, editor){
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data
				, type : "POST"
				, enctype: "multipart/form-data"
				, url : "/board/summernoteImg"
				, contentType : false
				, processData : false
				, success : function(data){
					$(editor).summernote("editor.insertImage", data.url);
				}, error : function(e){
					console.log(e);
				}
			});
		}
		
		let imgArr = new Array();
		// 작성 완료 버튼
		$("#submitBtn").on("click", function(){
			if($("#title").val() === ""){
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return;
			}
			if($("#summernote").summernote("isEmpty")){
				alert("내용을 입력해 주세요.");
				return;
			}
			
			let content = $("#summernote").summernote("code");
			let regImg = /(<img[^>]+src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g;
			let src;
			while(regImg.test(content)){
				src = RegExp.$2.replace("/boardFile/", "");
				imgArr.push(src);
			}
			console.log(imgArr);
			console.log(imgArr.length);
			
			if(imgArr.length !== 0){
				for(let i = 0; i < imgArr.length; i++){
					let inputImg = $("<input>").attr({
						"type" : "hidden"
						, "class" : "imgs"
						, "name" : "imgs[]"
						, "value" : imgArr[i]
					});
					$("#modifyForm").append(inputImg);
				};
			}
			
			$("#modifyForm").submit();
		});
		
		// 취소 버튼
		$("#cancelBtn").on("click", function(){
			location.href = "/board/toDetailView?seq_board="+${modMap.boardDTO.seq_board};
		})
		
	</script>
</body>
</html>