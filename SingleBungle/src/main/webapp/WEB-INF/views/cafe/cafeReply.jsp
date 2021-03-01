<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 댓글 페이지</title>

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

/* 페이징바 */
.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
}

@media (max-width:991.98px) {
	.padding {
	    padding: 1.5rem;
	}
}

@media (max-width:767.98px) {
	.padding {
	    padding: 1rem;
	}
}

.container { margin-top: 100px; }

.pagination, .jsgrid .jsgrid-pager {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem;
}

.page-item > a, .page-item > a:hover { color: black; }

.pagination.pagination-rounded-flat .page-item { margin: 0 .25rem; }

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689;
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
}
</style>

</head>
<body>

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
										<a href="#"><span>답글</span></a> <a class="replyReport" href="#"><span>신고</span></a>
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
										<a href="#"><span>답글</span></a> <a class="replyReport" href="#"><span>신고</span></a>
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
							<button class="btn btn-primary btn-sm shadow-none" type="button">등록</button>
							<button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">취소</button>
						</div>
					</div>
					<!-- 페이징바 -->
          <nav>
	          <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
	            <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a></li>
	            <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
	            <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
	            <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
	            <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
	            <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a></li>
	          </ul>
        	</nav>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 END -->
	<script>
   $(".replyReport").on("click", function(){
       window.open('${contextPath}/cafe/cafeReplyReport', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
	 });
	</script>
</body>
</html>