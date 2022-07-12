<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
	font-family: 'OTWelcomeRA';
	font-size : 11px;
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

.chatting {
	border: 1px solid darkgrey;
	height: 590px;
	border-radius: 10px;
}

.title {
	border-bottom: 1px solid darkgrey;
	height: 10%;
	background-color: #d2e3ec;
	border-start-start-radius: 10px;
	border-start-end-radius: 10px;
}

.contentBox {
	height: 90%;
}

.users {
	border-right: 1px solid darkgrey;
	height: 100%;
	background-color: rgb(246, 246, 246);
}

.users>p {
	font-size: 15px;
	text-align: center;
	padding-top: 8px;
	color: darkolivegreen;
	border-bottom: 1px solid gray;
}

.profile {
	border-radius: 50%;
	background-color: orange;
	width: 20px;
	height: 20px;
}

#profile_img {
	width: 20px;
	height: 20px;
	border-radius: 50%;
}

.circle {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background-color: orange;
	margin-bottom: 50%;
}

.contentBox {
	font-size: 11px;
}

.chatBox {
	height: 100%;
}

.messages {
	height: 90%;
	overflow-y: scroll;
	-ms-overflow-style: none;
}

.messages::-webkit-scrollbar {
	display: none;
}

.mymsg {
	float: right;
}

#time {
	color: darkgray;
	font-size: 10px;
}

.mymsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #fce2ef;
	padding: 10px;
	border-radius: 13px;
}

.othermsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #d6ede0;
	padding: 10px;
	border-radius: 13px;
}

.inputmsg {
	border-top: 1px solid gray;
}
</style>
</head>
<body>
	<div class="container chatting">
		<div class="row title">
			<div class="col-12 d-flex justify-content-center pt-3">
				<span style="font-size: 30px; color: navy">${tglist}</span> 
				<span style="font-size: 28px;">&nbsp;채팅</span>
			</div>
		</div>
		<div class="row contentBox">
			<div class="col-3 users">
				<p>대화상대 목록</p>
				<table class="mt-3">
					<tbody>
						<c:forEach items="${nickList }" var="user" varStatus="status">
							<tr>
								<td>
									<div class="profile me-2">
										<img src="${profileList.sys_name[status.index]}" id="profile_img">
									</div>
								</td>
								<td>${nickList.user_nickname}</td>
								<td><div class="circle ms-1"></div></td>
							</tr>
						</c:forEach>
							
							
							
					</tbody>
				</table>
			</div>
			<div class="col-9 chatBox">
				<div class="messages">
					<div class="mymsg mt-3">
						<div class="timename">
							<span id="time">10:00 AM &nbsp;</span> <span>나나나</span>
						</div>
						<div class="msgBox">아아ㅏ아ㅏ아ㅏ아ㅏㅏ</div>
					</div>
					<div style="clear: both;"></div>
					<div class="othermsg mt-3">
						<div class="timename">
							<span id="time">10:00 AM &nbsp;</span> <span>김예원</span>
						</div>
						<div class="msgBox">아아ㅏ아ㅏ아ㅏ아ㅏㅏ</div>
					</div>

					<div class="mymsg mt-3">
						<div class="timename">
							<span id="time">10:00 AM &nbsp;</span> <span>나나나</span>
						</div>
						<div class="msgBox">아아ㅏ아ㅏ아ㅏ아ㅏㅏ</div>
					</div>
					<div style="clear: both;"></div>


				</div>
				<div
					class="inputmsg d-flex justify-content-center align-items-center">
					<input type="text" id="message" class="form-control w-75 mt-2">
					<button type="button"
						class="btn btn-outline-primary d-flex align-items-center mt-2 ms-4 h-75"
						id="send">send</button>
				</div>
			</div>

		</div>
	</div>
	
	<script>
		// home.jsp 페이지가 로드됐을 때 바로 WebSocket 접속이 이뤄져 스트림이 생성되고
		// 그 후 작성하여 보낸 메세지가 요청이 되거나, 다른 접속자가 보낸 메세지를 응답받을 수 있게 만듦.
		// 웹소켓 객체 생성할때 반드시 서버의 ip 주소값은 실제 ip 주소를 이용
		// 포트번호 다르면 :포트번호/chat
		let ws = new WebSocket("ws://192.168.35.109/group/toChat");
		
		$("#send").click(function(){
			let message = $("#message").val();
			if(message != ""){ // message가 빈값이 아닐때만 전송
				$("#message").val(""); //입력창 비우기
				ws.send(message); // 서버의 endpoint에 메세지를 보내는 함수
				
			}
		})
		
		// endpoint로부터 전송된 메세지 받기
		// endpoint에서 sendText() 메서드를 실행하면 onmessage 이벤트가 trigger 됨.
		ws.onmessage = function(message){
			console.log(message.data);
			// 넘어 온 json처럼 생긴 문자열을 실제 json형(객체)으로 변환
			let msg = JSON.parse(message.data);
			console.log(msg);
			
			let msgDiv = $("<div>").append(msg.message);
			$(".messages").append(msgDiv);
		}
		
	</script>
</body>
</html>