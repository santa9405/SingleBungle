<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>

<style>


.boardName {
	margin-right: 40px;
}

.boardTitleBorder{
 border-bottom: gray 1px solid;
}

.card-img-top {
	height: 15rem;
}

.categoryArea, .arrayArea {
	display: inline-block;
}

.category, .array {
	text-decoration: none;
	color: black;
	line-height: 54px;
	margin-right: 5px;
}

/* 제목 */
.text-dark {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-weight: bold;
}

/* 좋아요/댓글 */
.viewArea, .replyArea {
	display: inline-block;
	font-size: 11px;
	margin-right: 5px;
}

.nickNameArea {
	clear: both;
}

.icon {
	width: 13px;
}

/* 검색창 */
.search {
	text-align: center;
}

/******* 페이징 *******/
.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

#page-content {
	margin-top: 20px;
}

.pagination, .jsgrid .jsgrid-pager {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem
}

.page-item > a, .page-item > a:hover { color: black; }

.pagination.pagination-rounded-flat .page-item {
	margin: 0 .25rem
}

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
}
</style>


<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">


</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">

		<!-- 게시판 이름/카테고리 -->
		<div class="row py-5">
			<div class="col-lg-12 mx-auto boardTitleBorder">
				<div class="text-black banner">
					<h1 class="boardName float-left">후기게시판</h1>
					<div class="categoryArea">
						<a class="category" href="#">전체</a> 
						<a class="category" href="#">가구</a> 
						<a class="category" href="#">생활용품</a> 
						<a class="category" href="#">전자기기</a> 
						<a class="category" href="#">기타</a>
					</div>
					<div class="arrayArea float-right">
						<a class="array" herf="#">최신순</a>
						<img class="icon" src="${contextPath}/resources/images/arrow.png" /> 
						<a class="array" herf="#">좋아요순</a>
						<img class="icon" src="${contextPath}/resources/images/arrow.png" />
					</div>
				</div>
			</div>
		</div>
		<!-- End -->

		<div class="row">
			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png"  class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="${contextPath}/resources/images/view.png" /> 0
							</div>
							<div class="replyArea">
								<img class="icon" src="${contextPath}/resources/images/reply.png" /> 0
							</div>
						</div>
						<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(135, 222, 150);">생활용품</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->

			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png"  class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">깔끔하고 이쁜 선반장</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="${contextPath}/resources/images/view.png" /> 700
							</div>
							<div class="replyArea">
								<img class="icon" src="${contextPath}/resources/images/reply.png" /> 50
							</div>
						</div>
						<div class="nickNameArea d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">가구</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->

			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">에어팟 후기임다</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="/Image/view.png" /> 100,000
							</div>
							<div class="replyArea">
								<img class="icon" src="/Image/reply.png" /> 100,000
							</div>
						</div>
						<div class="nickNameArea d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgba(68, 152, 221, 0.699);">전자기기</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->

			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="/Image/view.png" /> 100,000
							</div>
							<div class="replyArea">
								<img class="icon" src="/Image/reply.png" /> 100,000
							</div>
						</div>
						<div class="nickNameArea d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(245, 91, 125);">기타</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->

			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="/Image/view.png" /> 100,000
							</div>
							<div class="replyArea">
								<img class="icon" src="/Image/reply.png" /> 100,000
							</div>
						</div>
						<div class="nickNameArea d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">생활용품</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->

			<!-- Gallery item -->
			<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png" class="img-fluid card-img-top embed-responsive-item">
					</div>
					<div class="p-4">
						<h5>
							<a href="#" class="text-dark">발받침대 구매 후기</a>
						</h5>
						<div class="infoArea float-right">
							<div class="viewArea">
								<img class="icon" src="/Image/view.png" /> 100,000
							</div>
							<div class="replyArea">
								<img class="icon" src="/Image/reply.png" /> 100,000
							</div>
						</div>
						<div class="nickNameArea d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
							<p class="small mb-0">
								<span class="font-weight-bold price">달마고</span>
							</p>
							<div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">생활용품</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End -->
		</div>



		<!-- 등록하기 버튼 -->
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<button type="button" class="btn btn-success float-right">등록하기</button>
			</div>
		</div>



		<!-- 페이징 -->
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

		<!-- 검색창 -->

		<div class="row" style="margin-bottom: 50px;">
			<div class="col-md-12">
				<div class="search">
					<form action="#" method="GET">
						<select name="sk" id="searchOption" style="width: 100px; height: 36px; display: inline-block;">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="titcont">제목+내용</option>
							<option value="category">카테고리</option>
						</select> <input type="text" name="sv" class="form-control " style="width: 25%; display: inline-block;">
						<button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
					</form>
				</div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>