<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 자유게시판 메인 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>
.boardName { margin-right: 40px; }

.category {
	color: black;
	line-height : 54px;
}

.category:hover {
	text-decoration: none;
	color: rgb(214, 156, 30);
}

#list-table > tbody > tr:hover {
	cursor: pointer;
}
   
/* 검색창 */
.search { 
	text-align: center; 
	margin-top : 50px;
	margin-bottom: 100px;
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
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
				      <!-- 게시판 이름/카테고리 -->
				      <div class="row py-5">
				        <div class="col-lg-12 mx-auto">
				          <div class="text-black banner">
				            <h1 class="boardName float-left">자유게시판</h1>
				                  <a class="category" href="#">전체</a> | 
				                  <a class="category" href="#">여행</a> | 
				                  <a class="category" href="#">영화</a> | 
				                  <a class="category" href="#">일상</a> | 
				                  <a class="category" href="#">경제</a> | 
				                  <a class="category" href="#">반려동물</a> | 
				                  <a class="category" href="#">요리레시피</a>
				
				            <div class="listTest float-right">
				              <a class="category" href="#">최신순</a> |
				              <a class="category" href="#">좋아요순</a>
				            </div>
				            <hr>
				          </div>
				        </div>
				      </div>
				      <!-- End -->

                <table class="table table-hover table-sm" id="list-table">
                    <thead>
                      <tr>
                        <th>글번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>닉네임</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>♡</th>
                      </tr>
                    </thead>
                    <tbody>
											<c:if test="${empty bList }">
												<tr>
													<td colspan="7" style="text-align : center;">존재하는 게시글이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty bList }">
												<c:forEach var="board" items="${bList}" varStatus="vs">
						
													<tr>
														<td>${board.boardNo}</td>
														<td>${board.categoryName}</td>
														<td>${board.boardTitle}</td>
														<td>${board.nickname}</td>
														<td>${board.readCount}</td>
														<td>
															<%-- 날짜 출력 모양 지정 --%>
															<fmt:formatDate var="createDate" value="${board.createDate}" pattern="yyyy-MM-dd"/>
															<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
															<c:choose>
																<c:when test="${createDate != now}">
																	${createDate}
																</c:when>
																<c:otherwise>
																	<fmt:formatDate value="${board.createDate}" pattern="HH:mm"/>
																</c:otherwise>
															</c:choose>
														</td>
														<td>좋아요수(보류)</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
                  </table>
                  <%-- 로그인이 되어있는 경우 --%>
<%-- 									<c:if test="${!empty loginMember }">
									
									</c:if> --%>
									
                  <div class="text-right"><button type="button" class="btn btn-success">글쓰기</button></div>
                  
                  <!--------------------------------- pagination  ---------------------------------->

									<div class="padding">
										<%-- 주소 조합 작업 --%>
										<c:url var="pageUrl" value="${bpInfo.boardType}?"/>
									
										<!-- 화살표에 들어갈 주소를 변수로 생성 -->
										<c:set var="firstPage" value="${pageUrl}cp=1" />
										<c:set var="lastPage" value="${pageUrl}cp=${bpInfo.maxPage}" />
					
										<fmt:parseNumber var="c1" value="${(bpInfo.currentPage - 1) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
										<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
					
					
										<fmt:parseNumber var="c2" value="${(bpInfo.currentPage + 9) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
										<c:set var="nextPage" value="${pageUrl}cp=${next}" />
					
										<div class="container d-flex justify-content-center">
											<div class="col-md-4 col-sm-6 grid-margin stretch-card">
												<nav>
													<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
														<c:if test="${bpInfo.currentPage > bpInfo.pageSize}">
															<!-- 첫 페이지로 이동(<<) -->
															<li class="page-item"><a class="page-link" href="${firstPage }" data-abc="true">&laquo;</a></li>
															<!-- 이전 페이지로 이동 (<) -->
															<li class="page-item"><a class="page-link" href="${prevPage }" data-abc="true">&lt;</a></li>
														</c:if>
														
														<!-- 페이지 목록 -->
														<c:forEach var="page" begin="${bpInfo.startPage}" end="${bpInfo.endPage}">
															<c:choose>
																<c:when test="${bpInfo.currentPage == page }">
																	<li class="page-item active"><a class="page-link" data-abc="true">${page}</a></li>
																</c:when>
					
																<c:otherwise>
																	<li class="page-item"><a class="page-link" href="${pageUrl}cp=${page}" data-abc="true">${page}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														
														<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
														<c:if test="${next <= bpInfo.maxPage}">
															<!-- 다음 페이지로 이동 (>) -->
															<li class="page-item"><a class="page-link" href="${nextPage }" data-abc="true">&gt;</a></li>
															<!-- 마지막 페이지로 이동(>>) -->
															<li class="page-item"><a class="page-link" href="${lastPage }" data-abc="true">&raquo;</a></li>
														</c:if>
													</ul>
												</nav>
					
											</div>
										</div>
									</div>


				<!--        <nav>
                    <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                      <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a></li>
                      <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
                      <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                      <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                      <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                      <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a></li>
                    </ul>
                  </nav> -->
                  
                  <!-- 검색창 -->
                  <div class="search">
                    <form action="#" method="GET">
                    <select name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
                      <option value="title">제목</option>
                      <option value="writer">작성자</option>
                      <option value="titcont">제목+내용</option>
                      <option value="category">카테고리</option>
                    </select>
                    <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                    <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
                    </form>
                  </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		
		$("#list-table td").on("click", function(){
			var boardNo = $(this).parent().children().eq(0).text();
										// td			tr				td			첫번째(게시글번호)
										
			// 게시글 상세조회 요청 주소 조합
			// 게시글 목록 : 	/spring/board/list/1
			// 상세조회 :		/spring/board/1/500
			
			// 절대경로
			// var boardViewURL = "${contextPath}/board/${pInfo.boardType}/"+boardNo;
												//			/spring		/board/					1					/500
												
			// 상대경로
			var boardViewURL = "../${bpInfo.boardType}/"+boardNo;
			
			
			location.href = boardViewURL;
			
		});
    
    </script>
</body>
</html>