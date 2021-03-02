<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 게시판 상세조회</title>
<style>
#board-area {
	margin-bottom: 100px;
}

#board-content {
	padding-bottom: 150px;
}

#date-area {
	font-size: 12px;
	line-height: 12px
}

#date-area>p {
	margin: 0
}

.boardImgArea {
	height: 300px;
}

.boardImg {
	width: 100%;
	height: 100%;
	max-width: 300px;
	max-height: 300px;
	margin: auto;
}

#content-main {
	margin: 100px auto;
}

/* 이미지 화살표 색 조정
	-> fill='%23000' 부분의 000을
	   RGB 16진수 값을 작성하여 변경 가능 
	 */
.carousel-control-prev-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E")
		!important;
}

.carousel-control-next-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E")
		!important;
}

.ctgr, .titleArea>span, .chat, .apply {
	margin-right: 10px;
	margin-bottom: 10px;
}

.image {
	width: 30px;
	height: 30px;
}

.personnel {
	line-height: 35px;
}

#likeBtn {
	border: 0px solid #ddd;
	background-color: rgba(255, 255, 255, 0);
}

.likeCnt {
	color: #6c757d;
}

.like {
	background-image: url('${contextPath}/resources/img/like2.png');
	background-repeat: no-repeat;
}

.hr {
	clear: both;
}

body {
	background: #eee;
}

.date {
	font-size: 11px;
}

.comment-text {
	font-size: 12px;
}

.fs-12 {
	font-size: 12px;
}

.shadow-none {
	box-shadow: none;
}

.cursor:hover {
	color: blue;
}

.cursor {
	cursor: pointer;
}

.media img {
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container" id="content-main">

		<div>
			<div>
				<h2 style="margin-top: 5px;">
					<%-- 카테고리 스타일 지정 --%>
					<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
						<c:if test="${findFriend.categoryNm == '맛집'}">background-color: burlywood;</c:if> 
						<c:if test="${findFriend.categoryNm == '문화생활'}">background-color: skyblue;</c:if>
						<c:if test="${findFriend.categoryNm == '동네친구'}">background-color: coral;</c:if> '>${findFriend.categoryNm}</div>
					<%-- 성별 스타일 지정 --%>
					<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
						<c:if test="${findFriend.gender == 'W'}">background-color: rgba(68, 152, 221, 0.699);</c:if> 
						<c:if test="${findFriend.gender == 'M'}">background-color: rgb(135, 222, 150);</c:if> 
						<c:if test="${findFriend.gender == 'F'}">background-color: rgb(245, 91, 125);</c:if> '>
						
						<c:if test="${findFriend.gender == 'W'}">여</c:if>
						<c:if test="${findFriend.gender == 'M'}">남</c:if>
						<c:if test="${findFriend.gender == 'F'}">무관</c:if>
						</div>
						
					${findFriend.friendTitle}
				</h2>
			</div>

			<hr class="hr">

			<div class="titleArea row mb-3 form-row">
				<div class="col-md-1">
					<img src="${contextPath}/resources/images/profile.png" width="30" height="30"> <span>${findFriend.nickname}</span>
				</div>

				<div class="col-md-9">
					<div class="boardInfo" id="createDt" style="color: gray">2021.02.24 12:05</div>
				</div>

				<div class="col-md-2">
					<div class="float-right">

						<img class="image" src="${contextPath}/resources/images/view.png"> ${findFriend.readCount}
						<button type="button" id="likeBtn">
							<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
						</button>
					</div>
				</div>
			</div>

			<div class="titleArea row mb-3 form-row">
				<div class="col-md-12">
					<img src="${contextPath}/resources/images/placeholder.png" width="20" height="20">
					<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='background-color: burlywood;'>${findFriend.location1}</div>&nbsp;&nbsp;
					<span>${findFriend.location2}</span>&nbsp;&nbsp;
					<img src="${contextPath}/resources/images/friendCalendar.png" width="17" height="17"><span>${findFriend.meetingDate}</span>&nbsp;&nbsp;
					<img src="${contextPath}/resources/images/friendClock.png" width="17" height="17"><span>${findFriend.meetingTime}</span>
				</div>
			</div>

			<!-- <div class="titleArea row mb-3 form-row">
				<div class="col-md-12">
					
				</div>
			</div> -->

			<br>

			<div class="titleArea">
				<button type="button" class="btn btn-primary float-right report">신고</button>
				<button type="button" class="btn btn-primary float-right apply">참여신청</button>
				<!-- chat button -->
				<button type="button" class="btn btn-primary float-right chat">모집인원 1/4</button>

			</div>
			<hr class="hr">

			<!-- Content -->
			<div id="board-content">${findFriend.friendContent}</div>
			

			<hr>

			<jsp:include page="reply.jsp" />

			<div>
				<div class="text-center">

					<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
					<c:if test="${empty sessionScope.returnListURL}">
						<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session" />
					</c:if>
					
					<br> 
					<a class="btn btn-success" href="${sessionScope.returnListURL}">목록으로</a>
					
					<c:url var="updateUrl" value="${findFriend.friendNo}/update" />

					<!-- 로그인된 회원이 글 작성자인 경우 -->
					<c:if test="${(loginMember != null) && (findFriend.memNo == loginMember.memberNo)}">
						<a href="${updateUrl}" class="btn btn-success ml-1 mr-1">수정</a>
						<button id="deleteBtn" class="btn btn-success">삭제</button>
					</c:if>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
		// 게시글 신고창 열기
		$(".report")
				.on(
						"click",
						function() {
							window
									.open(
											'${contextPath}/findFriendReport/reportForm',
											"popup",
											"width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
						});

		// 채팅창 열기
		$(".chat")
				.on(
						"click",
						function() {
							window
									.open(
											'${contextPath}/findFriendChat/chatView',
											"popup",
											"width=600, height=700, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
						});
	</script>

</body>
</html>
