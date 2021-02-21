<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록하기</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>


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
		<jsp:include page="ReviewReply.jsp"></jsp:include>


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
	</div>

<jsp:include page="../common/footer.jsp" />


</body>
</html>