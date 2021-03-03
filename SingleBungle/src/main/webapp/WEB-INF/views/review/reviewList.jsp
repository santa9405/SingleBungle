<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>

<style>
.boardName {
	margin-right: 40px;
}

.boardTitleBorder {
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

.category:click {
	color: orange;
	text-weight: bold;
}

.viewdetail:hover {
	cursor: pointer;
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

.page-item>a, .page-item>a:hover {
	color: black;
}

.pagination.pagination-rounded-flat .page-item {
	margin: 0 .1rem
}

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
}

.pg {
	flex: none !important;
	max-width: none !important;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
						<a class="category" href="search?ct=0">전체</a> 
						<a class="category" href="search?ct=1">가구</a> 
						<a class="category" href="search?ct=2">생활용품</a> 
						<a class="category" href="search?ct=3">전자기기</a> 
						<a class="category" href="search?ct=4">기타</a>
					</div>
					<div class="arrayArea float-right">
						<a class="array" href="search?sort=1">최신순<img class="icon" src="${contextPath}/resources/images/arrow.png" />
						</a> <a class="array" href="search?sort=2">좋아요순<img class="icon" src="${contextPath}/resources/images/arrow.png" /></a>
					</div>
				</div>
			</div>
		</div>
		<!-- End -->





		<div class="row">
			<c:if test="${empty rList }">
				<div class="col-lg-12">
					<h5 style="text-aline: center;">존재하는 게시글이 없습니다.</h5>
				</div>
			</c:if>


			<c:if test="${!empty rList }">
				<c:forEach var="review" items="${rList}" varStatus="vs">
					<!-- Gallery item -->
					<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
						<div class="bg-white rounded shadow-sm viewdetail">

							<!-- 썸네일 영역 -->
							<div class="embed-responsive embed-responsive-4by3">
								<c:set var="flag" value="true" />
								<c:forEach var="thumbnail" items="${thList}">
									<c:if test="${review.boardNo == thumbnail.parentBoardNo }">
										<img src="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}" class="img-fluid card-img-top embed-responsive-item">
										<c:set var="flag" value="false" />
									</c:if>
								</c:forEach>

								<c:if test="${flag=='true'}">
									<img src="${contextPath}/resources/images/ReviewNonImages.png" class="img-fluid card-img-top embed-responsive-item">
								</c:if>
							</div>

							<div class="p-4">
								<h5>
									<a class="text-dark">${review.boardTitle }</a>
								</h5>
								<div class="infoArea float-right">
									<div class="viewArea mb-2">
										<img class="icon" src="${contextPath}/resources/images/view.png" /> ${review.readCount }
									</div>

								</div>
								<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
									<p class="small mb-0">
										<span class="font-weight-bold price">${review.nickName }</span>
									</p>
									<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
                            <c:if test="${review.categoryCode == '21'}">background-color: burlywood;</c:if>
                            <c:if test="${review.categoryCode == '22'}">background-color: #8dbe88;</c:if>
                            <c:if test="${review.categoryCode == '23'}">background-color: #5d8eb6d5;</c:if>
                            <c:if test="${review.categoryCode == '24'}">background-color: #d48a9a;</c:if> '>${review.categoryName }</div>
								</div>
							</div>
							<span id="boardNo" style="visibility: hidden">${review.boardNo }</span>
						</div>
					</div>

				</c:forEach>
			</c:if>
			<!-- End -->
		</div>



		<!-- 등록하기 버튼 -->

		<!-- 로그인이 되어있고, 회원 2등급 이상일 경우 !=T -->
		<c:if test="${!empty loginMember && loginMember.memberGrade != 'F' }">
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<button type="button" class="btn btn-success float-right" id="insertBoard">등록하기</button>
				</div>
			</div>
		</c:if>


		<!-- 페이징 -->
		<div class="page-content page-container" id="page-content">
			<div class="padding">
				<div class="row container d-flex justify-content-center">
					<div class="col-md-4 col-sm-6 grid-margin stretch-card pg">
						<nav>
							<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">

								<!-- 화살표에 들어갈 주소를 변수로 생성  -->
								<c:set var="firstPage" value="?cp=1" />
								<c:set var="lastPage" value="?cp=${pInfo.maxPage }" />

								<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
								<c:set var="prevPage" value="?cp=${prev}" />


								<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
								<c:set var="nextPage" value="?cp=${next}" />

								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li class="page-item">
										<!-- 첫 페이지로 이동(<<) --> <a class="page-link" href="${firstPage }">&laquo;&laquo;</a>
									</li>

									<li class="page-item">
										<!-- 이전 페이지로 이동 (<) --> <a class="page-link" href="${prevPage }">&laquo;</a>
									</li>
								</c:if>

								<c:forEach var="page" begin="${pInfo.startPage }" end="${pInfo.endPage }">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li class="page-item active"><a class="page-link">${page}</a> <!-- 같은 페이지일때는 클릭이 안 된다.  --></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><a class="page-link" href="?cp=${page}">${page}</a></li>
										</c:otherwise>



									</c:choose>
								</c:forEach>


								<c:if test="${next <=pInfo.maxPage }">
									<li class="page-item"><a class="page-link" href="${nextPage }">&raquo;</a></li>

									<li class="page-item"><a class="page-link" href="${lastPage }">&raquo;&raquo;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

		<!-- 검색창 -->

		<!--  -->
		<form action="search" class="row" id="searchForm" style="margin-bottom: 50px;">
			<div class="col-md-12">
				<div class="search">
					<select name="sk" id="searchOption" style="width: 100px; height: 36px; display: inline-block;">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="titcont">제목+내용</option>
					</select> <input type="text" name="sv" class="form-control " autocomplete="off" style="width: 25%; display: inline-block;">
					<button class="form-control btn btn-success" id="searchBtn" type="submit" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
				</div>
			</div>
			<input type="hidden" name="ct" value="${param.ct }">	<!-- 있으면 값 세팅  -->
			<input type="hidden" name="sort" value="${param.sort }">
		</form>

	</div>
	<jsp:include page="../common/footer.jsp" />


	<!-- 목록으로 버튼에 사용할 URL저장 변수   session scope에 올리기-->
	<c:set var="returnListURL" value="${contextPath}/review/list?cp=${pInfo.currentPage}" scope="session" />


	<script>
		// 상세조회
		$(".viewdetail").on("click", function() {
			var boardNo = $(this).children("span#boardNo").text();

			var boardViewURL = "view/" + boardNo;

			location.href = boardViewURL;
		});

		// 등록하기 버튼
		$("#insertBoard").on("click", function() {

			location.href = "insert";

		});

		// 검색내용 있을 경우 검색창에 해당 내용 저장
		(function() {
			var searchKey = "${param.sk}";
			var searchValue = "${param.sv}";

			// 검색창 option 반복 접근
			$("select[name=sk]>option").each(function(index, item) {

				if ($(item).val() == searchKey) {
					$(item).prop("selected", true);
				}
			});

			// 검색어 입력창에 searchValue 값 출력
			$("input[name=sv]").val(searchValue);

		})();
	</script>
</body>
</html>