<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 채팅</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>

<style>
body {
	background: #eee;
}

.decor-default {
	background-color: #ffffff;
}

.chat .avatar {
	width: 40px;
	height: 40px;
	position: absolute;
}

.chat .avatar img {
	display: block;
	border-radius: 20px;
	height: 100%;
}

.chat .avatar .status.off {
	border: 1px solid #5a5a5a;
	background: #ffffff;
}

.chat .avatar .status.online {
	background: #4caf50;
}

.chat .avatar .status.busy {
	background: #ffc107;
}

.chat .avatar .status.offline {
	background: #ed4e6e;
}

.chat-users .user .status {
	bottom: 0;
	left: 28px;
}

.chat .avatar .status {
	width: 10px;
	height: 10px;
	border-radius: 5px;
	position: absolute;
}

.chat-users .user .name {
	font-size: 14px;
	font-weight: bold;
	line-height: 20px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.chat-users .user .mood {
	font: 200 14px/20px "Raleway", sans-serif;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

/*****************CHAT BODY *******************/
.chat-body h6 {
	font-size: 20px;
	margin: 0 0 20px;
}

.chat-body {
	padding-left : 10px;
	padding-right : 10px;
	padding-top : 10px;
	padding-bottom : 20px;
}

.chat-body .answer.left {
	padding: 0 0 0 58px;
	text-align: left;
	float: left;
}

.chat-body .answer {
	position: relative;
	max-width: 600px;
	overflow: hidden;
	clear: both;
}

.chat-body .answer.left .avatar {
	left: 0;
}

.chat-body .answer .avatar {
	bottom: 36px;
}

.chat .avatar {
	width: 40px;
	height: 40px;
	position: absolute;
}

.chat .avatar img {
	display: block;
	border-radius: 20px;
	height: 100%;
}

.chat-body .answer .name {
	font-size: 14px;
	line-height: 36px;
}

.chat-body .answer.left .avatar .status {
	right: 4px;
}

.chat-body .answer .avatar .status {
	bottom: 0;
}

.chat-body .answer.left .text {
	background: #ebebeb;
	color: #333333;
	border-radius: 8px 8px 8px 0;
}

.chat-body .answer .text {
	padding: 12px;
	font-size: 16px;
	line-height: 26px;
	position: relative;
}

.chat-body .answer.left .text:before {
	left: -30px;
	border-right-color: #ebebeb;
	border-right-width: 12px;
}

.chat-body .answer .text:before {
	content: '';
	display: block;
	position: absolute;
	bottom: 0;
	border: 18px solid transparent;
	border-bottom-width: 0;
}

.chat-body .answer.left .time {
	padding-left: 12px;
	color: #333333;
}

.chat-body .answer .time {
	font-size: 16px;
	line-height: 36px;
	position: relative;
	padding-bottom: 1px;
}
/*RIGHT*/
.chat-body .answer.right {
	padding: 0 58px 0 0;
	text-align: right;
	float: right;
}

.chat-body .answer.right .avatar {
	right: 0;
}

.chat-body .answer.right .avatar .status {
	left: 4px;
}

.chat-body .answer.right .text {
	background: burlywood;
	color: #ffffff;
	border-radius: 8px 8px 0 8px;
}

.chat-body .answer.right .text:before {
	right: -30px;
	border-left-color: burlywood;
	border-left-width: 12px;
}

.chat-body .answer.right .time {
	padding-right: 12px;
	color: #333333;
}

/**************ADD FORM ***************/
.chat-body .answer-add {
	clear: both;
	position: relative;
	margin: 20px -20px -20px;
	padding: 20px;
	background: burlywood;
}

.chat-body .answer-add input {
	border: none;
	background: none;
	display: block;
	width: 88%;
	float: left;
	font-size: 16px;
	line-height: 40px;
	padding: 0;
	color: #ffffff;
}

.chat input {
	-webkit-appearance: none;
	border-radius: 0;
}

.chat-body .answer-add .answer-btn-1 {
	background:
		url("http://91.234.35.26/iwiki-admin/v1.0.0/admin/img/icon-40.png")
		50% 50% no-repeat;
	right: 56px;
}

.chat-body .answer-add .answer-btn {
	display: block;
	cursor: pointer;
	width: 36px;
	height: 36px;
	position: absolute;
	top: 50%;
	margin-top: -18px;
}

.chat-body .answer-add .answer-btn-2 {
	background:
		url("http://91.234.35.26/iwiki-admin/v1.0.0/admin/img/icon-41.png")
		50% 50% no-repeat;
	right: 20px;
}

.chat input::-webkit-input-placeholder {
	color: #fff;
}

.chat input:-moz-placeholder { /* Firefox 18- */
	color: #fff;
}

.chat input::-moz-placeholder { /* Firefox 19+ */
	color: #fff;
}

.chat input:-ms-input-placeholder {
	color: #fff;
}

.chat input {
	-webkit-appearance: none;
	border-radius: 0;
}

#inputChatting{
   width : 90%;
   resize : none;
}
</style>
</head>
<body>

	<div>
		<div class="row no-gutters">
			<div class="content col-sm-12">
				<div class="chat" style="overflow: hidden; outline: none;" tabindex="5001">
					<div class="decor-default">
						<div class="chat-body">
							<h6>참여인원</h6>
							<div class="answer left">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status offline"></div>
								</div>
								<div class="name">며네</div>
								<div class="text">몇 시에 만나요?</div>
								<div class="time">5분전</div>
							</div>
							<div class="answer right">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status offline"></div>
								</div>
								<div class="name">달마고</div>
								<div class="text">저녁 어때요?</div>
								<div class="time">5분전</div>
							</div>
							<div class="answer left">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status online"></div>
								</div>
								<div class="name">크리스탈</div>
								<div class="text">저녁 좋아요</div>
								<div class="time">5분전</div>
							</div>
							<div class="answer right">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status busy"></div>
								</div>
								<div class="name">달마고</div>
								<div class="text">8시에 만나요</div>
								<div class="time">3분 전</div>
							</div>
							<div class="answer right">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status off"></div>
								</div>
								<div class="name">달마고</div>
								<div class="text">아니다 8시 30분에 만나요</div>
								<div class="time">3분 전</div>
							</div>
							<div class="answer left">
								<div class="avatar">
									<img src="${contextPath}/resources/images/profile.png" alt="User name">
									<div class="status offline"></div>
								</div>
								<div class="name">며네</div>
								<div class="text">좋아요</div>
								<div class="time">2분 전</div>
							</div>

							<div class="answer-add">
								<div class="input-area">
									<textarea id="inputChatting" rows="3"></textarea>
									<!-- <input id="inputChatting" placeholder="메세지를 입력해주세요."> -->
								</div>
								<div align="right">
									<button id="send" class="btn btn-light">전송</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>	

	<script>
		// ------------------------------------ WebSocket ------------------------------------
		
		var chattingSock; // SockJS를 이용한 WebSoket객체 저장 변수 선언
		
		// 로그인이 되어 있을때만
		// 서버측 /chat 이라는 주소로 통신을 할 수 있는 WebSocket
		<c:if test="${!empty loginMember}">
			chattingSock = new SockJS("${contextPath}/chat");
		</c:if>
		
		// 로그인한 회원이 채팅 입력 후 보내기 버튼을 클릭한 경우 채팅 내용이 서버로 전달됨
		// (전달할 내용 : 로그인한 회원의 닉네임 + 입력한 채팅 + 채팅 시간 )
	
		var nickname = "${loginMember.memberNickname}";
		var memberNo = "${loginMember.memberNo}";
		
		/* $("#inputChatting").keyup(function(e){
			if(e.keyCode == 13){
				if(e.shiftKey === false){
					$("#send").click();
				}
			}
		}); */
		
		$("#send").on("click", function(){
			
			console.log(nickname);
			
			if(nickname == ""){
				alert("로그인 후 이용해주세요");
			}else{
				
				var chat = $("#inputChatting").val();
				
				if(chat.trim().length == 0){
					alert("채팅을 입력해 주세요.");
				}else{
					
					var obj = {};
					obj.nickname = nickname;
					obj.chat = chat;
					
					var date = new Date();
					var time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
					obj.time = time;
					
					
					// 작성자와 채팅 내용이 담긴 obj 객체를 JSON 형태로 변환하여 웹소켓 핸들러로 보내기
					chattingSock.send( JSON.stringify(obj) );
					
					$("#inputChatting").val("");
					
				}
				
			}
			
		});
		
		// WebSocket 객체 chattingSock이 서버로부터 받은 메세지가 있을 경우 수행되는 콜백 함수
		chattingSock.onmessage = function(event){
			
			var obj = JSON.parse(event.data);
			
			var answerRight = $("<div>").addClass("answer right");
			
			var answerLeft = $("<div>").addClass("answer Left");
			
			var avatar = $("<div>").addClass("avatar");
			
			var image = $("imag").attr("src", "${contextPath}/resources/images/profile.png")
									.attr("alt", "User name");
			
			avatar.append(image);
			
			//var writer = obj.memberName;
			var chat = obj.chat.replace(/\n/g, "<br>");
			var time = obj.createDt;
			
			var name = $("<div>").addClass("name").text(nickname);
			var text = $("<div>").addClass("text").text(chat);
			var time = $("<div>").addClass("time").text(time);
			
			if(obj.memberNo == memberNo){
				answerRight.append(avatar).append(name).append(text).append(time);
			}else{
				answerLeft.append(avatar).append(name).append(text).append(time);
			}
			
			// 채팅 입력 시 스크롤을 가장 아래로 내리기
			$(".chat-body").scrollTop($(".chat-body")[0].scrollHeight);
			
		};
		
	</script>
</body>
</html>