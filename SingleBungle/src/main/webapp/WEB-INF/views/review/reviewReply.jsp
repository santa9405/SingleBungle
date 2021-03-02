<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판 댓글</title>
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

/* 답글/신고 버튼  */

.col-4{
	padding : 0 !important;
}
.reply{
	margin-right : 10px;
}

.btn{
	width: 45px;
	padding : 0 !important;
	
}

/* 댓글 시간 */
.replyTime{
   color: gray; 
   font-size: 14px;
}

/* 수정/삭제버튼  */

.replyUpdateArea{
	width: 25px;
	font-size : 10px !important;
}


/* 댓글 수정삭제 버튼  */


</style>

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>

	<!-- 댓글 -->
	<div class="row bg-light" style="margin-top: 15px;">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12" id="replyListArea">
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
										<button class="btn">답글</button> 
										<button class="btn report">신고</button>
									</div>
								</div>
							</div>
							<div class="replyText">영수증 첨부해주세요.</div>
							<div class="float-right" ">
								<button class="btn btn-sm ml-1 replyUpdateArea"> 수정 </button> 
								<button class="btn btn-sm ml-1 replyUpdateArea"> 삭제 </button>
							</div>

<%-- 							<div class="media mt-3 reReply">
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
							</div> --%>
							
<%-- 							<div class="media mt-3 reReply">
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
										<a class="replyUpdate" href="#"> 수정 </a> 
										<a class="replyDelete" href="#"> 삭제 </a>
									</div>
								</div>
							</div> --%>
						</div>
					</div><!-- 끗 -->
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
										<button>답글</button> 
										<button class="report">신고</button>
									</div>
								</div>
							</div>
							<div class="replyText">?</div>
						</div>
					</div>
					<hr> <!-- 끗 -->
					
					
					
					
					
					
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
						
						
						
						
						
								<!-------------------------------- 페이징 ------------------------------------>
							<div class="page-content page-container" id="page-content">
								<div class="padding">
									<div class="row container d-flex justify-content-center">
										<div class="col-md-4 col-sm-6 grid-margin stretch-card">
											<nav>
												<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
													<li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
							<!-- 페이징 끝 -->

				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 END -->
	
<script>

	var loginMemberId="${loginMember.memberNo}"; // 로그인한 회원 번호
	var replyWriter ="${loginMember.nickName}"; // 로그인한 회원 닉네임
	var parentBoardNo = "{review.boardNo}"; // 게시글 번호
	
	
	// 댓글 (페이징 로딩 완료 시 댓글 목록 호출)
	$(function(){
		selectReplyList();
	});
	
	// 댓글 목록 불러오기
	function selectReplyList(){
		
		$.ajax({
			url : "${contextPath}/review/reply/selectReplyList" + parentBoardNo,
			type : "post",
			dataType : "json",
			success : function(rList){
				
				
				var replyListArea=${"#replyListArea}"} // 댓글 출력 영역
				
				replyListarea.html(""); // 기존 정보 초기화
				
				
				
				
				// 댓글 List반복 접근
				$.each(rList, function(index,item){
					
					// 댓글 출력 영역
					var div1 = $("<div>").addClass("media mt-2");
					
					// 대댓글 영역에 다른 class명 추가
					if(item.replyDepth ==1){
						var reDiv1 = $("<div>").addClass("media mt-3 reReply");
					}
					
					
					// 프로필 출력
					var img = $("<img>").addClass("mr-3 rounded-circle").src("${contextPath}/resources/images/profile.png");
					
					
					// 프로필 제외 전체 감싸주는 div
					var div2 =$("<div>").addClass("media-body");

					// 닉네임, 시간 영역 과 버튼 영역 묶어주는 div
					var div3 =$("<div>").addClass("row");
					
					// 닉네임 시간 div
					var div4 = $("<div>").addClass("col-8 d-flex");
					var nickName = $("<h5>").html(item.nickName); 
					var time = $("<span>").addClass("replyTime").html(item.replyCreateDt); // 시간 출력하고싶음,,조건
					div4.append(nickName, time);
					
					// 버튼 div
					var div5 = $("<div>").addClass("col-4");
					var replyBtnArea = $("<div>").addClass("reply float-right");
					
					
					// 로그인이 되어있고, 대댓글이 아닐 경우 답글 버튼 추가
					if(loginMemberId!="" && item.replyDepth!=1){
						
						var insertBtn = $("button").addClass("btn ").text("답글").attr("onclick", "adChildReplyArea(this,"+ item.parentReplyNo + ")" ); 
						var reportBtn = $("button").addClass("btn report").text("신고");
						
						ReplyBtnArea.append(insertBtn, reportBtn);
					}
					
					// 버튼 영역에 버튼,,추가?
					div5.append(ReplyBtnArea);
					
					// div(class="row") 에 닉넴이랑 버튼 영역 추가
					div3.append(div4, div5);
					
					
					// 댓글 내용
					var rContent =$("<div>").addClass("replyText").html(item.replyContent);
					
					// 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
          if(item.memberId == loginMemberId){
              var replyUpdateArea = $("<div>").addClass("float-right");
              // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
              var showUpdate = $("<button>").addClass("btn btn-sm ml-1 replyUpdateArea").text("수정").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)");
              var deleteReply = $("<button>").addClass("btn btn-sm ml-1 replyUpdateArea").text("삭제").attr("onclick", "deleteReply(" + item.replyNo + ")");
              
              replyUpdateArea.append(showUpdate, deleteReply);
           }

					
					div2.append(div3,rContent,replyUpdateArea);
					div1.append(img,div2);
					
					// 댓글 영역을 화면에 배치
					replyListArea.append(div1);
					
				});
			}, 
			error : function(){
				console.log("댓글 목록 조회 실패");
			}
		});
	}
	
//-----------------------------------------------------------------------------------------













	/* 댓글 신고 */
		$(".replyReport").on("click", function(){
				window.open('${contextPath}/reviewReport/replyReport', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
		});
	</script>
</body>
</html>