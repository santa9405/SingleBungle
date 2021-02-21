<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록하기</title>
<style>
	.boardInfo {
		display: inline-block;
		margin-right: 15px;
	}
	
	.image {
		width: 30px;
		height: 30px;
	}
	
	.viewArea {
		display: inline-block;
		font-size: 11px;
		width: 75px;
		text-align: right;
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

   /* TOP3 출력 */
       body {
       background: #f4f4f4;
     }

     .boardName {
       margin-right: 40px;
     }

     .card-img-top{
       height: 15rem;
     }

     .categoryArea, .arrayArea{
       display: inline-block;
     }

     .category, .array{
       text-decoration: none;
       color: black;
       line-height : 54px;
       margin-right:5px;
     }


     /* 제목 */
     .text-dark{
       display:block;
       overflow: hidden;
       text-overflow: ellipsis;
       white-space: nowrap;

       font-weight: bold;
     }


     /* 좋아요/댓글 */
     .viewArea,.replyArea{
       display: inline-block;
       font-size: 11px;
       margin-right:5px;
     }

     .nickNameArea{
       clear: both;
     }

     .icon {
       width: 13px;
     }
</style>

</head>


<body>
	<jsp:include page="../common/header.jsp" />


	<div class="container">
		<div class="row py-3">
			<div class="col-md-12">
				<h8> 후기게시판 </h8>
				<div class="float-right">
					<button>목록</button>
					<button>신고</button>
				</div>
				<h2 style="margin-top: 5px;">
					<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">생활용품</div>
					제목제목제목
				</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="boardInfo" id="writer">
					<img class="image" src="/Image/profile.png" /> 달마고
				</div>
				<div class="boardInfo" id="createDt" style="color: gray">2021.02.07</div>
				<div class="infoArea float-right">
					<img class="image" src="/Image/view.png"> 0 <span>
						<button type="button" id="likeBtn">
							<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
						</button>
					</span>
				</div>
			</div>
		</div>

		<hr>

		<!-- 게시글 내용 -->
		<div class="row">
			<div class="col-md-12 contentArea">
				어쩌구저쩌구 <br> 글내용<br> 써머노트로 작성<br> 글<br> 사진<br>
			</div>
		</div>

		<!-- 댓글(페이지 연결하기) -->
		<jsp:include page="reviewReply.jsp"></jsp:include>


		<!-- 버튼 -->
		<div class="row float-right mt-3">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<button type="button" class="btn btn-success">수정</button>
						<button type="button" class="btn btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 목록버튼 -->
		<div class="row  py-3" style="clear: both;">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-success">목록으로</button>
			</div>
		</div>

		<h7>후기게시판 인기 게시글</h7>
		<hr>
		<div class="row" style="margin-bottom: 25px;">
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="/Image/발받침대.png" alt="" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="#" /> 0
							</div>
							<div class="replyArea">
								<img class="icon" src="#" /> 0
							</div>
						</div>
						<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(135, 222, 150);">생활용품</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="/Image/발받침대.png" alt="" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="#" /> 0
							</div>
							<div class="replyArea">
								<img class="icon" src="#" /> 0
							</div>
						</div>
						<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(135, 222, 150);">생활용품</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="/Image/발받침대.png" alt="" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="#" /> 0
							</div>
							<div class="replyArea">
								<img class="icon" src="#" /> 0
							</div>
						</div>
						<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(135, 222, 150);">생활용품</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>





	<jsp:include page="../common/footer.jsp" />


</body>
</html>