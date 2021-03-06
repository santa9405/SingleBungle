<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 메인 페이지</title>
<!-- Core theme CSS (includes Bootstrap)-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>

.boardName { margin-right: 40px; }

.category {
	color: black;
	line-height : 54px;
}

.category:hover {
	text-decoration: none;
	color: gray;
}

#img-list:hover, #img-list2:hover, .cafeTitle:hover {
	cursor: pointer;
}

#cafeNo {
	display: none;
}

.infoAreaWrapper{
   padding : 24px 24px 5px 24px;
}

.text-dark {
  display:block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* 좋아요/댓글 */
.viewArea,.replyArea{
  display: inline-block;
  font-size: 11px;
  margin-right: 5px;
}

.nickNameArea{ clear: both; }

.icon { width: 13px; }

/* 검색창 */
.search { 
  text-align: center; 
  margin-top : 50px;
  margin-bottom: 100px;
}

/* 페이징바 */
.col-md-4 {
  flex: none !important;
  max-width: none !important;
}

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
	<jsp:include page="../common/header.jsp"/>
  <div class="container">
   <!--  <div class="px-lg-5"> -->
	      <!-- 게시판 이름/카테고리 -->
	      <div class="row py-5">
	        <div class="col-lg-12 mx-auto">
	          <div class="text-black banner">
	            <h1 class="boardName float-left">맛집게시판</h1>
	                  <a class="category maincolor-font-bk" href="#">전체</a> | 
	                  <a class="category maincolor-font-bk" href="#">맛집추천</a> | 
	                  <a class="category maincolor-font-bk" href="#">혼밥식당</a> | 
	                  <a class="category maincolor-font-bk" href="#">카페</a>
	
	            <div class="listTest float-right">
	              <a class="category maincolor-font-bk" href="#">최신순</a> |
	              <a class="category maincolor-font-bk" href="#">좋아요순</a>
	            </div>
	            <hr>
	          </div>
	        </div>
	      </div>
	      <!-- End -->

		<div class="row">
			<!-- Gallery item -->
			<c:if test="${empty cList }">
         		존재하는 게시글이 없습니다.
      </c:if>
			<c:if test="${!empty cList }">
				<c:forEach var="cafe" items="${cList}" varStatus="vs">
					<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
						<div class="bg-white rounded shadow-sm cafe-list">
							<div class="embed-responsive embed-responsive-4by3">
									<c:set var="flag" value="true" />
									<c:forEach var="th" items="${thList}">
										<c:if test="${th.cafeNo == cafe.cafeNo}">
											<img src="${contextPath}${th.filePath}/${th.fileName}" class="img-fluid card-img-top embed-responsive-item" id="img-list">
											<c:set var="flag" value="false" />
										</c:if>
									</c:forEach>
									<c:if test="${flag == 'true'}">
										<img src="${contextPath}/resources/images/cafeNoImg.jpg" id="img-list2" class="mg-fluid card-img-top embed-responsive-item">
									</c:if>
							</div>

							<div class="p-4">
								<span id="cafeNo">${cafe.cafeNo}</span>
								<h5>
									<a class="text-dark cafeTitle">${cafe.cafeTitle}</a>
								</h5>
								
								<div class="infoArea float-right">
									<div class="viewArea">
										<img class="icon" src="${contextPath}/resources/images/view.png" /> ${cafe.readCount}
									</div>
									<div class="viewArea">
										<img class="icon" src="${contextPath}/resources/images/like1.png" /> ${cafe.likeCount}
									</div>
								</div>
								<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
									<p class="small mb-0">
										<span class="font-weight-bold price">${cafe.nickname}</span>
									</p>
									<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
											<c:if test="${cafe.categoryCode == '1'}">background-color: #9ea9d7;</c:if>
                    	<c:if test="${cafe.categoryCode == '2'}">background-color: #ef8694;</c:if>
                    	<c:if test="${cafe.categoryCode == '3'}">background-color: #e1c66d;</c:if> '>${cafe.categoryName}</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- End -->

		</div>

			<%-- 로그인이 되어있고 회원 2등급 이상일 경우 --%>
			<c:if test="${!empty loginMember && loginMember.memberGrade != 'T' }">
				<a class="btn float-right maincolor" href="${contextPath}/cafe/insert">글쓰기</a>
			</c:if>
      
      <!--------------------------------- pagination  ---------------------------------->
      
	    <c:choose>
				<c:when test="${!empty param.sk && !empty param.sv}">
					<c:url var="pageUrl" value="/search"/>
				
					<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}"/>
				</c:when>

			<c:otherwise>
				<c:url var="pageUrl" value="/list"/>
			</c:otherwise>
		</c:choose>
      
			<div class="padding">
			
				<c:set var="firstPage" value="?cp=1${searchStr}" />
				<c:set var="lastPage" value="?cp=${cpInfo.maxPage}${searchStr}" />

				<fmt:parseNumber var="c1" value="${(cpInfo.currentPage - 1) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
				<c:set var="prevPage" value="?cp=${prev}${searchStr}" />


				<fmt:parseNumber var="c2" value="${(cpInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="?cp=${next}${searchStr}" />

				<div class="container d-flex justify-content-center">
					<div class="col-md-4 col-sm-6 grid-margin stretch-card">
						<nav>
							<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
								<c:if test="${cpInfo.currentPage > cpInfo.pageSize}">
									<!-- 첫 페이지로 이동(<<) -->
									<li class="page-item"><a class="page-link" href="${firstPage }" data-abc="true"><i class="fas fa-angle-double-left"></i></a></li>
									<!-- 이전 페이지로 이동 (<) -->
									<li class="page-item"><a class="page-link" href="${prevPage }" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
								</c:if>
								
								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${cpInfo.startPage}" end="${cpInfo.endPage}">
									<c:choose>
										<c:when test="${cpInfo.currentPage == page }">
											<li class="page-item active"><a class="page-link" data-abc="true">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><a class="page-link" href="?cp=${page}${searchStr}" data-abc="true">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
								<c:if test="${next <= cpInfo.maxPage}">
									<!-- 다음 페이지로 이동 (>) -->
									<li class="page-item"><a class="page-link" href="${nextPage }" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
									<!-- 마지막 페이지로 이동(>>) -->
									<li class="page-item"><a class="page-link" href="${lastPage }" data-abc="true"><i class="fas fa-angle-double-right"></i></a></li>
								</c:if>
							</ul>
						</nav>

					</div>
				</div>
			</div>

			<!-- 검색창 -->
      <div class="search">
        <form action="${contextPath}/cafe/search" method="GET">
        <select name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
          <option value="title">제목</option>
          <option value="writer">작성자</option>
          <option value="titcont">제목+내용</option>
        </select>
        <input type="text" name="sv" class="form-control " style="width: 25%; display: inline-block;">
        <button class="form-control btn maincolor" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
        </form>
      </div>
      
 <!--    </div> -->
  </div>
  <jsp:include page="../common/footer.jsp"/>
  
	<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
	<c:set var="returnListURL" value="${contextPath}/cafe/list/?cp=${cpInfo.currentPage}" scope="session" />
  
  <script>
	// 게시글 상세보기 기능 (jquery를 통해 작업)
	
	$(".cafe-list").on("click", function(){
		var cafeNo = $(this).children(".p-4").children().eq(0).text();
									
		// 상대경로
		var cafeViewURL = "${contextPath}/cafe/" + cafeNo;
		
		// console.log(cafeNo);
		
		location.href = cafeViewURL;
		
	});
	
  </script>
</body>
</html>