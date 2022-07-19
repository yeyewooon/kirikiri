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

.userTable{
	height : 40px;
}

.profile {
	border-radius: 50%;
	background-color: orange;
	width: 25px;
	height: 25px;
}

#profile_img {
	width: 25px;
	height: 25px;
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
	margin-bottom : 10px;
}

.messages::-webkit-scrollbar {
	display: none;
}


#time {
	color: darkgray;
	font-size: 10px;
}

.mymsg{
	margin-top : 10px;
	overflow : hidden;
	margin-left : 35%;
}

.mymsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #fce2ef;
	padding: 10px;
	border-radius: 13px;
	float: right;
}

.mymsg .timename{
	float: right;
	margin-left : 60%;
}

.othermsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #d6ede0;
	padding: 10px;
	border-radius: 13px;
	margin-right : 20%;
}

.inputmsg {
	border-top: 1px solid gray;
}
</style>
</head>
<body>
	<div class="container chatting">
	<input type="text" class="d-none" id="nickname" value="${user_nickname }">
		<div class="row title">
			<div class="col-12 d-flex justify-content-center pt-3">
				<span style="font-size: 30px; color: navy">${tgList[0].group_title}</span> 
				<span style="font-size: 28px;">&nbsp;채팅</span>
			</div>
		</div>
		<div class="row contentBox">
			<div class="col-3 users">
				<p>대화상대 목록(${nickList.size()})</p>
				<table>
					<tbody>
						<c:forEach items="${nickList }" var="user" varStatus="status">
							<tr class="userTable">
								<td>
									<div class="profile me-2">
										<img src="${profileList[status.index]}" id="profile_img">
									</div>
								</td>
								<td>${user.user_nickname}</td>
								<td><div class="circle ms-1"></div></td>
							</tr>
						</c:forEach>
							
					</tbody>
				</table>
			</div>
			<div class="col-9 chatBox">
				<div class="messages">
					<c:forEach items="${gcList }" var="gcList">
						<c:choose>
							<c:when test="${user_nickname eq gcList.user_nickname}">
								<div class="mymsg">
									<div class="timename">
										<span id="time">${gcList.sendDate } &nbsp</span> 
										<span>${gcList.user_nickname }</span>
									</div>
									<div style="clear: both;"></div>
									<div class="msgBox">${gcList.message }</div>
								</div>
								<div style="clear: both;"></div>
							</c:when>
							<c:otherwise>
								<div class="othermsg mt-3">
									<div class="timename">
										<span id="time">${gcList.sendDate } &nbsp</span>
										<span>${gcList.user_nickname }</span>
									</div>
									<div class="msgBox">${gcList.message }</div>
								</div>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				</div>
				<div class="inputmsg d-flex justify-content-center align-items-center">
					<input type="text" id="message" class="form-control w-75 mt-2" autofocus>
					<button type="button" class="btn btn-outline-primary d-flex align-items-center mt-2 ms-4 h-75"
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
		let ws = new WebSocket("ws://192.168.0.17:8090/chat");
		let nickname = $("#nickname").val();
		$("#send").click(function(){
			sendChat();
		})
		$("#message").keypress(function(e){
			if(e.keyCode == 13) sendChat();
		})
		
		// endpoint로부터 전송된 메세지 받기
		// endpoint에서 sendText() 메서드를 실행하면 onmessage 이벤트가 trigger 됨.
		ws.onmessage = function(message){
			console.log(message.data);
			// 넘어 온 json처럼 생긴 문자열을 실제 json형(객체)으로 변환
			let msg = JSON.parse(message.data);
			console.log(msg);
			otherChat(msg);
			$(".messages").scrollTop($(".messages")[0].scrollHeight);

		}
		
		window.onload=function(){
			$(".messages").scrollTop($(".messages")[0].scrollHeight);
		}
		
		//server 시간
		function serverTime(){
			// 1. 현재 시간(Locale)
			const curr = new Date();

			// 2. UTC 시간 계산
			const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);

			// 3. UTC to KST (UTC + 9시간)
			const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
			const kr_curr = new Date(utc + (KR_TIME_DIFF));
			const kr_time = kr_curr.toString();
			var hour = kr_time.substr(16,2);
			var min = kr_time.substr(19,2);
			var ampm = null;
			if(hour<=12){
				if(hour==0){
					ampm = '오전 12:' + min; 
				}else{
					ampm = '오전 ' + kr_time.substr(16,5);
				}
			} else{
				ampm = '오후 ' + (hour-12) + ":" + min;
			}
			
		 	return ampm + "&nbsp";
		}
		

		//채팅 보내는 함수
		function sendChat(){
			let message = $("#message").val();
			if(message != ""){ // message가 빈값이 아닐때만 전송
				$("#message").val(""); //입력창 비우기
				ws.send(message); // 서버의 endpoint에 메세지를 보내는 함수
				
				let div_clear = $("<div>").css("clear", "both");
				
				let span1 = $("<span>").attr("id", "time").html(serverTime());
				let span2 = $("<span>").html(nickname); 
				let div_tn = $("<div>").attr("class", "timename");
				div_tn.append(span1, span2);
				
				let div_msgB = $("<div>").attr("class", "msgBox").html(message);

				let div_mymsg = $("<div>").attr("class", "mymsg");
				div_mymsg.append(div_tn, div_msgB);
				$(".messages").append(div_mymsg, div_clear);
				
				$(".messages").scrollTop($(".messages")[0].scrollHeight);

			}
		}
		
		//메세지 받는 함수
		function otherChat(msg){
			let span1 = $("<span>").attr("id", "time").html(serverTime());
			let span2 = $("<span>").html(msg.user_nickname); 
			let div_tn = $("<div>").attr("class", "timename");
			div_tn.append(span1, span2);
			
			let div_msgB = $("<div>").attr("class", "msgBox").html(msg.message);

			let div_othermsg = $("<div>").attr("class", "othermsg mt-3");
			div_othermsg.append(div_tn, div_msgB);
			$(".messages").append(div_othermsg);
		}
		
	</script>
</body>
</html>