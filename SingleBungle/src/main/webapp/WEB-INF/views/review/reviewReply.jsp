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

/* 답글 */
.childReply{
	padding-left: 50px;  
}

.childReplyArea{
	padding-top : 30px;
	width : 100%;
  text-align: right;
}

.childReplyContent{
	resize: none;  
	width : 100%; 
}

.replyUpdateContent {
	resize: none;
	width: 100%;
}
</style>

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

</head>


<body>


	<!-- 댓글 -->
	<div class="row bg-light" style="margin-top: 15px;">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
				
					<!-- 댓글 출력 부분 -->
					<div class="replyListArea">
							
					</div>
		
					<!-- 댓글 작성창 -->
					<div class="p-2">
						<div class="d-flex flex-row align-items-start">
							<img class="rounded-circle" src="${contextPath}/resources/images/profile.png" width="35">
							<textarea class="form-control ml-1 shadow-none textarea" id="replyContent" style="resize: none"> </textarea>
						</div>
						<div class="mt-2 text-right">
							<button class="btn btn-primary btn-sm shadow-none" id="addReply">등록</button>
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
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fas fa-angle-double-left"></i></a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
													<li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
													<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fas fa-angle-double-right"></i></a></li>
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

	var replyWriter ="${loginMember.memberNickname}"; // 로그인한 회원 닉네임

	var loginMemberNo="${loginMember.memberNo}"; // 로그인한 회원 번호
	var parentBoardNo = "{review.boardNo}"; // 게시글 번호

	
	
	// 댓글 (페이징 로딩 완료 시 댓글 목록 호출)
	$(function(){
		selectReplyList();
	});
	
	// 댓글 목록 불러오기
	function selectReplyList(){
		
		$.ajax({
			url : "${contextPath}/reviewReply/selectReplyList/" + parentBoardNo,
			type : "post",
			dataType : "json",
			success : function(rList){
				
				console.log(rList)
				
				var replyListArea = $(".replyListArea"); // 댓글 출력 영역
				
				replyListArea.html(""); // 기존 정보 초기화
				
				
				
				
				// 댓글 List반복 접근
				$.each(rList, function(index,item){
					
					// 댓글 출력 영역
					var media = $("<div>").addClass("media mt-2");
					
						
					// 프로필 출력
					var img = $("<img>").addClass("mr-3 rounded-circle").src("${contextPath}/resources/images/profile.png").attr("style", "width: 30px;").attr("style", "height: 30px;");
					
					
					// 프로필 제외 전체 감싸주는 div
					var mediaBody =$("<div>").addClass("media-body");

					// 닉네임, 시간 영역 과 버튼 영역 묶어주는 div
					var row =$("<div>").addClass("row");
					
					// 닉네임 시간 div
					var col8 = $("<div>").addClass("col-8 d-flex");
					var nickName = $("<h5>").html(item.nickName); 
					var createDt = $("<span>").attr("style", "color: gray;").attr("style", "font-size: 14px;").html(item.replyCreateDt);

					
					// 답글, 신고 버튼 영역
					var col4 = $("<div>").addClass("col-4");
					var floatRight = $("<div>").addClass("reply float-right");
					var reply2 = $("<a>").addClass("childReply").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")").text("답글");
					var report = $("<a>").attr("href", "#").text("신고");
					
					// 내용 영역
					var replyText = $("<div>").addClass("replyText").html(item.replyContent);
					
					var floatRight2 = $("<div>").addClass("float-right").attr("style", "font-size: 13px;");
					var replyUpdate = $("<a>").addClass("replyUpdate").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)").text("수정");
					var replyDelete = $("<a>").addClass("replyDelete").attr("onclick", "deleteReply(" + item.replyNo + ")").text("삭제");
				
					// 밑줄
					var hr = $("<hr>");
					
					
					// 댓글의 깊이가 1인 요소는 별도의 스타일을 지정할 수 있도록 클래스 추가
					if(item.replyDepth == 1){
						img.addClass("childReply");
						mediaBody.addClass("childReply");
					}
					
					// 댓글의 깊이가 0인 요소 신고 버튼 추가
					if(item.replyDepth == 0){
						reply2.append(report);
					}
					
					
					// 로그인이 되어 있고, 자신의 글이 아닐 경우에 답글 버튼 추가
					if(memNo != "" && item.memNo != memNo){
						col8.append(nickname).append(createDt);
						floatRight.append(reply2);
						col4.append(floatRight);
						row.append(col8).append(col4);
						mediaBody.append(row);
						mediaBody.append(replyText);
						media.append(img).append(mediaBody);
						replyListArea.append(media).append(hr);
				
					// 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 수정/삭제 버튼 추가
					}else if(item.memNo == memNo){
						col8.append(nickname).append(createDt);
						row.append(col8);
						mediaBody.append(row);
						mediaBody.append(replyText);
						floatRight2.append(replyUpdate).append(replyDelete);
						mediaBody.append(floatRight2);
						media.append(img).append(mediaBody);
						replyListArea.append(media).append(hr);

					}
					
				});
			}, 
			error : function(){
				console.log("댓글 목록 조회 실패");
			}
		});
	}
	
//-----------------------------------------------------------------------------------------


	// 댓글 등록
	$("#addReply").on("click", function(){
		console.log(loginMemberNo)
		// 로그인 되어있는지 확인
		if(loginMemberNo==""){
			swal({icon:"info", title :"로그인 후 이용해 주세요."});
		}else{
			var replyContent = $("#replyContent").val(); //작성된 댓글 내용을 얻어와 저장
			
			if(replyContent.trim().length ==0){ // 댓글 작성되지 않은 경우
				swal({icon:"info", title:"댓글을 입력해 주세요."});
			}else{ // 로그인 O, 댓글 작성 O인 경우
				$.ajax({
					url : "${contextPath}/reviewReply/insertReply/" + parentBoardNo,
					type : "post",
					data : {"loginMemberNo" : loginMemberNo, "replyContent":replyContent},
					success : function(result){
						if(result>0){
							$("#replyContent").val(""); // 작성한 댓글 내용을 삭제
							swal({icon : "success", title:"댓글 등록 성공"});
							selectReplyList(); // 다시 목록 조회
						}
					},
					error : function(){
						console.log("댓글 작성 실패");
					}
				});
			}
		}
	});
	












	/* 댓글 신고 */
		$(".replyReport").on("click", function(){
				window.open('${contextPath}/reviewReport/replyReport', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
		});
	</script>
</body>
</html>