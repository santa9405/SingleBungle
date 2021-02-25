<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 채팅</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

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
								<div class="">
									<input placeholder="Write a message">
								</div>
								<div align="right">
									<button type="button" class="btn btn-light">전송</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		
	</script>
</body>
</html>