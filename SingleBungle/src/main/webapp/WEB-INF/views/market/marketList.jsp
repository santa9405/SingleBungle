<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 - 메인</title>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
 

  <style>
body {
	background: #f4f4f4;
}

.boardName {
	margin-right: 40px;
}

.category {
	text-decoration: none;
	color: black;
	line-height: 54px;
}

.category:hover {
	text-decoration: none;
	color: rgb(214, 156, 30);
}

.priceArea {
	clear: both;
}

.row_2 {
	margin-bottom: 20px;
}

.writeBtn, .writeBtn:hover {
	text-decoration: none;
	color: white;
}

.text-dark {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/* 좋아요 */
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

.searchArea {
	margin: auto;
}

#searchBtn {
	background: burlywood;
}

#searchInput, #searchBtn {
	border: 1px solid burlywood;
}

/*  페이징바 css */
/* 페이징바 */
.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
}

@media ( max-width :991.98px) {
	.padding {
		padding: 1.5rem;
	}
}

@media ( max-width :767.98px) {
	.padding {
		padding: 1rem;
	}
}

.container {
	margin-top: 100px;
}

.pagination, .jsgrid .jsgrid-pager {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem;
}

.page-link {
	color: black;
}

.pagination.pagination-rounded-flat .page-item {
	margin: 0 .25rem;
}

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689;
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
	x
}

.banner span {
	color: #c1c0c1a1;
}

.marketNo {
	cursor: pointer;
}

.col-md-4 {
	flex: none !important;
	max-width: none !important;
}

.like2 {
	background-size : 15px;
	background-image: url('${contextPath}/resources/images/like2.png');
	background-repeat: no-repeat;
}

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
  <div class="container">
  
    <div class="px-lg-5">
				
				<form action="#" method="GET">
          <div class="input-group mb-4 col-md-8 searchArea">
            <input id="searchInput" type="search" placeholder="상품명 혹은 지역명을 입력하세요." aria-describedby="button-addon6" class="form-control">
            <div class="input-group-append">
              <button id="searchBtn" type="submit" class="btn btn-info"><i class="fa fa-search"></i></button>
            </div>
          </div>
        </form>


			<!-- 게시판 이름/카테고리 -->
			<div class="row py-5 no-gutters">
				<div class="col-lg-12 mx-auto">
					<div class="text-black banner">
						<h1 class="boardName float-left">사고팔고</h1>
						<a class="category cg" href="#">전체</a> <span> |</span> <a
							class="category cg" href="#">팝니다</a> <span> |</span> <a
							class="category cg" href="#">삽니다</a>

						<div class="listTest float-right">
							<a class="category sort" href="#">최신순</a> <span> |</span> <a
								class="category sort" href="#">좋아요순</a> <span> |</span> <a
								class="category sort" href="#">저가순</a> <span> |</span> <a
								class="category sort" href="#">고가순</a>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<!-- End -->

			<div class="row itemArea">
				<!-- Gallery item -->

				<c:if test="${empty mList}">존재하는 게시글이 없습니다!</c:if>
				<c:if test="${!empty mList}">
					<c:forEach var="market" items="${mList}" varStatus="vs">
						<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm no">
								<span style='visibility: hidden;'>${market.marketNo}</span>
								<div class="embed-responsive embed-responsive-4by3">
									<img src="${contextPath}/resources/images/testImg.gif"
										class="img-fluid card-img-top embed-responsive-item marketNo"
										<c:if test="${market.transactionStatus != 1}"> style="opacity: 0.5;" </c:if>>
								</div>
								<div class="p-4">
									<h5>
										<a class="text-dark marketNo">${market.marketTitle}</a>
									</h5>
									<div class="categoryDetail float-left row_2">
										<p class="small text-muted mb-0">
											<c:if test="${market.transactionCategory == 1}">삽니다</c:if>
											<c:if test="${market.transactionCategory == 2}">팝니다</c:if>
										</p>
										<p class="small text-muted mb-0">${market.categoryNm}</p>
									</div>

										

									<!-- 좋아요 버튼 -->
									<span class="float-right">
										<button type="button" id="likeBtn" class="likeBtns">
											<img src="${contextPath}/resources/images/like1.png"
												width="15" height="15" id="heart" class='likeImgs <c:forEach var="like" items="${likeInfo}"><c:if test="${like.marketNo == market.marketNo}">like2</c:if></c:forEach>'>
											<span class="likeCnt">${market.likes}</span>
										</button>
									</span>
									
									
									
									

									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4 priceArea">
										<p class="small mb-0">
											<i class="mr-2"></i><span class="font-weight-bold price">${market.price}
												원</span>
										</p>
										<c:if test="${market.transactionStatus == 1}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #deb887;">거래중</div>
										</c:if>
										<c:if test="${market.transactionStatus == 2}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #e01515ad;">예약중</div>
										</c:if>
										<c:if test="${market.transactionStatus == 3}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #3596ead6;">거래완료</div>
										</c:if>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- End -->
			</div>

			<c:if test="${loginMember != null}">
				<button type="button" class="btn btn-info float-right"><a href="${contextPath}/market/insert" class="writeBtn">글쓰기</a></button>
			</c:if>

			<div class="padding">
				<c:set var="firstPage" value="?cp=1" />
				<c:set var="lastPage" value="?cp=${mpInfo.maxPage}" />

				<fmt:parseNumber var="c1" value="${(mpInfo.currentPage - 1) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
				<c:set var="prevPage" value="?cp=${prev}" />


				<fmt:parseNumber var="c2" value="${(mpInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="?cp=${next}" />



				<div class="container d-flex justify-content-center">
					<div class="col-md-4 col-sm-6 grid-margin stretch-card">
						<nav>
							<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">

								<c:if test="${mpInfo.currentPage > mpInfo.pageSize}">
									<li class="page-item"><a class="page-link" href="${firstPage }" data-abc="true">&laquo;</a></li>
									<li class="page-item"><a class="page-link" href="${prevPage }" data-abc="true">&lt;</a></li>
								</c:if>


								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${mpInfo.startPage}" end="${mpInfo.endPage}">
									<c:choose>
										<c:when test="${mpInfo.currentPage == page }">
											<li class="page-item active"><a class="page-link" data-abc="true">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><a class="page-link" href="?cp=${page}" data-abc="true">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${next <= mpInfo.maxPage}">
									<li class="page-item"><a class="page-link" href="${nextPage }" data-abc="true">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="${lastPage }" data-abc="true">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>

					</div>
				</div>
			</div>


			<div class="row">
        <div class="col-md-12">
          <div class="search">
            <form action="#" method="GET">
            <select  name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
              <option value="title">제목</option>
              <option value="writer">작성자</option>
              <option value="titcont">제목+내용</option>
                <option value="category">카테고리</option>
            </select>
            <input type="text" name="sv" class="form-control " style="width: 25%; display: inline-block;">
            <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
<jsp:include page="../common/footer.jsp"/>

<script>
	
/* 	var temp =[];
  temp[0] = "";
  temp[1] = ""; */
  
  var cg;
  var sort;

	$(".marketNo").on("click", function(){
		var marketNo = $(this).closest('.no').children().eq(0).text();
		console.log(marketNo);
		var marketViewURL = "${contextPath}/market/"+marketNo;
		location.href = marketViewURL; 
	});

	
	$(".likeBtns").on("click", function(){
		var marketNo = $(this).closest('.no').children().eq(0).text();
		var likeClassArray = $(this).children().attr('class').split(" ");
		var likeClass = "like1";
		var likeImg = $(this).children(".likeImgs");
		var likeCnt = $(this).children(".likeCnt");
		
	
		if(likeClassArray[1] == "like2") {
			likeClass = "like2"; 
		}
		
		if(likeClass == "like1") {
			$.ajax({
				url : "increaseLike",
				type : "post",
				data : {"marketNo" : marketNo},
				success : function(result){
					if(result > 0) {
						likeCnt.text(Number(likeCnt.text()) + 1);
						likeImg.toggleClass("like2");
					}
				}, 
				error : function(result){
					console.log("ajax 통신 오류 발생");
				}
			});
		} else{
			$.ajax({
				url : "decreaseLike",
				type : "post", 
				data : {"marketNo" : marketNo},
				success : function(result){
					if(result > 0){ // 삭제 성공
						likeCnt.text(Number(likeCnt.text()) - 1);
						likeImg.removeClass("like2");
					}
				},
				error : function(result){
					console.log("ajax 통신 오류 발생");
				}
			});
		}
	});
	
	
/* 	$(".cg").on("click", function(){
		cg ="";
		cg = $(this).text();
		temp[0] = cg;
		console.log(cg);
		console.log(temp);
	});
	
	$(".sort").on("click", function(){
		sort ="";
		sort = $(this).text();
		temp[1] = sort;
		console.log(sort);
		console.log(temp);
	});
 */



</script>
</body>
</html>