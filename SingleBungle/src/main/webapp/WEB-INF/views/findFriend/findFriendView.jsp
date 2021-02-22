<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
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

.ctgr, .titleArea>span, .apply {
	margin-right: 10px;
	margin-bottom: 10px;
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

.name {
	
}

.cursor:hover {
	color: blue;
}

.cursor {
	cursor: pointer;
}

.textarea {
	resize: none;
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
				<span class="float-left ctgr"><h4>맛집</h4></span> <span class="float-left"><h4>여</h4></span> <span class="float-left"><h4>마카오도우라오 훠궈 먹으러 가요</h4></span>
			</div>

			<hr class="hr">

			<div class="titleArea">
				<img src="${contextPath}/resources/images/profile.png" width="30" height="30"> <span>크리스탈</span> <span>조회 : 100</span> <span>2021.02.21 12:05</span> <span>
					<button type="button" id="likeBtn">
						<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
					</button>
				</span>
			</div>

			<br>

			<div class="titleArea">
				<span>지역 : 서울</span> <span>모임장소 : 을지로입구 마카오도우라오</span> <span>모임날짜 : 2021.02.27</span> <span>모임시간 : 미정</span>
			</div>

			<br>

			<div class="titleArea">
				<button type="button" class="btn btn-primary float-right">신고</button>
				<button type="button" class="btn btn-primary float-right apply">참여신청</button>
				<!-- chat button -->
				<button type="button" class="btn btn-primary float-right chat">모집인원 1/4</button>
								
			</div>
			<hr class="hr">

			<!-- Content -->
			<div id="board-content">내용</div>

			<hr>

			<!-- 댓글 -->
			<div class="row bg-light" style="margin-top: 15px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<!-- 1개의 댓글 -->
							<div class="media mt-2">
								<img class="mr-3 rounded-circle" src="${contextPath}/resources/images/profile.png" />
								<div class="media-body">
									<div class="row">
										<div class="col-8 d-flex">
											<h5>솔쨩</h5>
											<span style="color: gray; font-size: 14px;">- 15:00</span>
										</div>
										<div class="col-4">
											<div class="reply float-right">
												<a href="#"><span><i class="fa fa-reply"></i> 답글</span></a> <a href="#"><span><i class="fa fa-reply"></i> 신고</span></a>
											</div>
										</div>
									</div>
									<div class="replyText">영수증 첨부해주세요.</div>
									<div class="float-right" style="font-size: 13px;">
										<a class="replyUpdate"> 수정 </a> <a class="replyDelete"> 삭제 </a>
									</div>

									<div class="media mt-3 reReply">
										<div class="pr-3">
											<img class="rounded-circle" src="${contextPath}/resources/images/profile.png" />
										</div>
										<div class="media-body">
											<div class="row">
												<div class="col-12 d-flex">
													<h6>달마고</h6>
													<span style="color: gray; font-size: 14px;"> - 15:30</span>
												</div>
											</div>
											<div class="replyText">지금 올렸어요</div>
										</div>
									</div>
									<div class="media mt-3">
										<div class="pr-3">
											<img class="rounded-circle" src="${contextPath}/resources/images/profile.png" />
										</div>
										<div class="media-body">
											<div class="row">
												<div class="col-12 d-flex">
													<h6>솔쨩</h6>
													<span style="color: gray; font-size: 14px;">- 15:31</span>
												</div>
											</div>
											<div class="replyText">이미 신고했습니다.</div>
											<div class="float-right" style="font-size: 13px;">
												<a class="replyUpdate"> 수정 </a> <a class="replyDelete"> 삭제 </a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<!-- 댓글 1개 끝나면 밑줄 -->

							<div class="media mt-2">
								<img class="mr-3 rounded-circle" src="${contextPath}/resources/images/profile.png" />
								<div class="media-body">
									<div class="row">
										<div class="col-8 d-flex">
											<h5>크리스탈</h5>
											<span style="color: gray; font-size: 14px;">- 16:00</span>
										</div>
										<div class="col-4">
											<div class="reply float-right">
												<a href="#"><span><i class="fa fa-reply"></i> 답글</span></a> <a href="#"><span><i class="fa fa-reply"></i> 신고</span></a>
											</div>
										</div>
									</div>
									<div class="replyText">?</div>
								</div>
							</div>
							<hr>
							<!-- 댓글 작성창 -->
							<div class="p-2">
								<div class="d-flex flex-row align-items-start">
									<img class="rounded-circle" src="${contextPath}/resources/images/profile.png" width="40">
									<textarea class="form-control ml-1 shadow-none textarea" style="resize: none"> </textarea>
								</div>
								<div class="mt-2 text-right">
									<button class="btn btn-primary btn-sm shadow-none" type="button">Post comment</button>
									<button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 댓글 END -->

			<div>
				<div class="text-center">

					<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
					<c:if test="${empty sessionScope.returnListURL}">
						<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session" />
					</c:if>
					<br> <a class="btn btn-success" href="${sessionScope.returnListURL}">목록으로</a>
					<c:url var="updateUrl" value="${board.boardNo}/update" />

					<!-- 로그인된 회원이 글 작성자인 경우 -->
					<c:if test="${(loginMember != null) && (board.memberId == loginMember.memberId)}">
						<a href="${updateUrl}" class="btn btn-success ml-1 mr-1">수정</a>
						<button id="deleteBtn" class="btn btn-success">삭제</button>
					</c:if>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
		// 채팅창 열기
		$(".chat").on("click", function(){
				window.open('${contextPath}/findFriendChat/chatView', "popup", "width=600, height=700, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
		});
		
	</script>
	
</body>
</html>
