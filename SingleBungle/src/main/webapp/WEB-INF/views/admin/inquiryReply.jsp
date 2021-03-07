<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 답변</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

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
							<button class="btn btn-primary btn-sm shadow-none  maincolor1"  id="addReply">등록</button>
							<button class="btn btn-outline-primary btn-sm ml-1 shadow-none maincolor-re1" id="resetReply" type="button">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 END -->
					
					

	<script>
	
	var memberNo = "${loginMember.memberNo}";
	var parentBoardNo = "${inquiry.inquiryNo}";
	var nickName = "${loginMember.memberNickname}";
	
	
		$(function(){
			selectReplyList();
		});
		
		
		
		
		// 댓글 목록 불러오기
		function selectReplyList(){
			
			
			$.ajax({
				url : "${contextPath}/adminReply/selectReplyList/" + parentBoardNo,
				type : "post",
				dataType : "json",
				success : function(rList){
					var replyListArea = $(".replyListArea");

					// 기존 정보 초기화
					replyListArea.html("");
					
					// 댓글 List 반복 접근
					$.each(rList, function(index, item){
						
						var media = $("<div>").addClass("media mt-2").css({"border-bottom-color": "lightgray", "border-bottom-style":"solid", "border-bottom-width":"thin"});
						
						
						
						
						// 작성자, 작성일 영역
						var mediaBody = $("<div>").addClass("media-body");
						var row = $("<div>").addClass("row");
						var col8 = $("<div>").addClass("col-8 d-flex");
						var createDt = $("<span>").css({"color":"gray", "font-size": "12px"}).html(item.replyCreateDt);
						
						
						// 내용 영역
						var replyText = $("<div>").addClass("replyText").css({"margin-bottom":"5px"}).html(item.replyContent);
						
						var floatRight2 = $("<div>").addClass("float-right").attr("style", "font-size: 13px;");
						var replyUpdate = $("<a>").addClass("replyUpdate maincolor2").css({"margin-right":"5px"}).attr("onclick", "showUpdateReply(" + item.replyNo + ", this)").text("수정");
						var replyDelete = $("<a>").addClass("replyDelete maincolor-re2").attr("onclick", "deleteReply(" + item.replyNo + ")").text("삭제");
					
						

						// 댓글의 깊이가 0인 요소 답글 버튼 추가
						/* if(item.replyDepth == 0){
							floatRight.append(reply2);
						} */
						
					});
					
				}, error : function(){
						console.log("댓글 목록 조회 실패")
					}

			});
			
		}
		
		
		
		//------------------------------------------------------------------------------------		
		
		
		
		// 댓글 등록
		$("#addReply").on("click",function(){
			
			if(memberNo != 4){
				swal({icon : "info", title : "관리자만 답글을 작성할 수 있습니다."});
			}else{
				var replyContent = $("#replyContent").val();
				
				if(replyContent.trim().length == 0){
					swal({icon:"info", title:"댓글을 작성해 주세요."});
				}else{
					$.ajax({
						url : "${contextPath}/adminReply/insertReplyList/" + parentBoardNo,
						type : "post",
						data : { "replyContent":replyContent},
						success : function(result){
							if(result>0){
								$(".replyContent").val("");
								swal({icon:"success", title:"댓글이 작성되었습니다."});
								selectReplyList();
							}
						}, error : function(){
							console.log("댓글 작성 실패");
						}
					});
				}
				
			}
			
		});
		
		
		// 댓글 등록 취소
		$("#resetReply").on("click",function(){
			$("#replyContent").val("");
		});


		
		
	//------------------------------------------------------------------------------------		
		
		// 댓글 수정 폼
		
		var beforeReplyRow;
		
		function showUpdateReply(replyNo,el){
			
			
			// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
			if($(".replyUpdateContent").length > 0){
				$(".replyUpdateContent").eq(0).parent().html(beforeReplyRow);
			}		

			
			// 댓글 수정화면 출력 전 요소 저장
			beforeReplyRow = $(el).parent().parent().html();
			
			// 작성되어있던 내용
			var beforeContent = $(el).parent().prev().html();

			// 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
		  // -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
		  beforeContent = beforeContent.replace(/&amp;/g, "&");   
		  beforeContent = beforeContent.replace(/&lt;/g, "<");   
		  beforeContent = beforeContent.replace(/&gt;/g, ">");   
		  beforeContent = beforeContent.replace(/&quot;/g, "\"");   
		  
		  beforeContent = beforeContent.replace(/<br>/g, "\n");   		

		  
		  // 기존 댓글 영역을 삭제하고 textarea를 추가
		  $(el).parent().prev().remove();
		  var textarea = $("<textarea>").addClass("replyUpdateContent").attr("rows", "3").val(beforeContent);
		  $(el).parent().before(textarea);
		  
			// 수정 버튼
		  var updateReply = $("<button>").addClass("btn btn-sm ml-1 mb-4 maincolor1").text("댓글 수정").attr("onclick", "updateReply(" + replyNo + ", this)");
		  
		  // 취소 버튼
		  var cancelBtn = $("<button>").addClass("btn btn-sm ml-1 mb-4 maincolor-re1").text("취소").attr("onclick", "updateCancel(this)");
		  
		  var replyBtnArea = $(el).parent();
		  
		  $(replyBtnArea).empty(); 
		  $(replyBtnArea).append(updateReply); 
		  $(replyBtnArea).append(cancelBtn); 	  
			
		}


		// 댓글 수정
		function updateReply(replyNo, el){
			
			var replyContent = $(el).parent().prev().val();
			
			if(replyContent.trim().length == 0){
				swal({icon : "info", title : "댓글을 입력해주세요."});
			}else{
				$.ajax({
					url : "${contextPath}/adminReply/updateReply/" + replyNo,
					type : "post",
					data : {"replyContent" : replyContent},
					success : function(result){
						
						if(result > 0){
							swal({icon : "success", title : "댓글 수정 성공"});
							selectReplyList();
						}
						
					}, error : function(){
						console.log("댓글 수정 실패");
					}
					
				});
			}
			
		}
		
		
		// 댓글 수정 취소 시 원래대로 돌아가기
		function updateCancel(el){
			$(el).parent().parent().html(beforeReplyRow);
		}

	</script>
</body>
</html>