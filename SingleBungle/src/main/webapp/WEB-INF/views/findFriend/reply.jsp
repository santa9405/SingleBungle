<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 게시판 댓글</title>
<style>

/* 댓글 */
.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #d2d2dc;
}

.media img {
	width: 30px;
	height: 30px;
}

.reReply {
	clear: both;
}

/*  댓글 작성 */
.createReply {
	height: 150px;
	background-color: honeydew;
}

.textArea {
	width: 100%;
	height: 110px;
	resize: none;
	padding: 10px;
}
</style>

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>

	<!-- 댓글 -->
	<div class="row bg-light" style="margin-top: 15px;">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<!-- 댓글 출력 부분 -->
					<div class="replyListArea media mt-2">
						<img class="mr-3 rounded-circle" src="${contextPath}/resources/images/profile.png" />
						<div class="media-body">
							<div class="row">
								<div class="col-8 d-flex">
									<h5>솔쨩</h5>
									<span style="color: gray; font-size: 14px;">- 15:00</span>
								</div>
								<div class="col-4">
									<div class="reply float-right">
										<a href="#"><span> 답글</span></a> <a href="#"><span> 신고</span></a>
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
										<a class="replyUpdate"> 수정 </a> 
										<a class="replyDelete"> 삭제 </a>
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
										<a href="#"><span>답글</span></a>
										<a href="#"><span>신고</span></a>
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
							<img class="rounded-circle" src="${contextPath}/resources/images/profile.png" width="35">
							<textarea class="form-control ml-1 shadow-none textarea" style="resize: none"> </textarea>
						</div>
						<div class="mt-2 text-right">
							<button class="btn btn-primary btn-sm shadow-none" type="button">등록</button>
							<button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 END -->
	
	<script>
	var loginMemberNo = "${loginMember.memberNo};";
	var replyWriter = "${loginMember.memberNo};";
	var friendNo = "${findFriend.friendNo}";
	
	// 페이지 로딩 완료 시 댓글 목록 호출
	$(function(){
		seletReplyList();
	});
	
	// 댓글 목록 불러오기
	function selectReplyList(){
		
		$.ajax({
			url : "${contextPath}/findFriendReply/selectReplyList/" + friendNo,
			type : "post",
			dataType : "json",
			success : function(rList){
				
			var replyListArea = $("#replyListArea");
			
			// 기존 정보 초기화
			replyListArea.html("");
			
			// 댓글 List 반복 접근
			$.each(rList, function(index, item){
				
				// 이미지
				var img = $("<img>").addClass("mr-3 rounded-circle").attr("src", "${contextPath}/resources/images/profile.png");
				
				// 작성자, 작성일 영역
				var mediaBody = $("<div>").addClass("media-body");
				var row = $("<div>").addClass("row");
				var col8 = $("<div>").addClass("col-8 d-flex");
				var nickname = $("<h5>").html(item.nickname);
				var createDt = $("<span>").attr("style", "color: gray").attr("style", "font-size: 14px").html(item.reviewCreateDt);
				
				replyListArea.append(img).append(mediaBody);
				mediaBody.append(row).append(col8).append(nickname).append(createDt);
				
				// 답글, 신고 버튼 영역
				var col4 = $("<div>").addClass("col-4");
				var floatRight = $("<div>").addClass("reply float-right");
				var reply2 = $("<a>").attr("href", "#").text("답글");
				var report = $("<a>").attr("href", "#").text("신고");
				
				// 로그인이 되어 있고, 자신의 글이 아닐 경우에 답글/신고 버튼 추가
				if(loginMemberNo != "" && item.memberNo != replyWriter)
					floatRight.append(reply2).append(report);
					col4.append(floatRight)
				
				// 내용 영역
				var replyText = $("<div>").addClass("replyText").html(item.replyContent);
				
				// 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 수정/삭제 버튼 추가
				if(item.memberNo == loginMemberNo){
					var floatRight2 = $("<div>").addClass("float-right").attr("style", "font-size: 13px");
					var replyUpdate = $("<a>").addClass("replyUpdate").attr("href", "#").text("수정");
					var replyDelete = $("<a>").addClass("replyDelete").attr("href", "#").text("삭제");
					floatRight2.append(replyUpdate).append(replyDelete);
				}
				
			});
				
			}, error : function(){
				console.log("댓글 목록 조회 실패")
			}
			
		});
		
	}
	
	//-----------------------------------------------------------------------------------------
	
	// 댓글 등록
	$("")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 댓글 신고창 열기
	$(".report").on("click", function(){
			window.open('${contextPath}/findFriendReport/reportForm', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
	});
	
	
	
	
	
	</script>

</body>
</html>