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

/* 좋아요 이미지 */
#image {
	width: 16px;
	height: 16px;
	margin-top : -5px;
	margin-left : -3px;
}
   
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
                        <th><img id="image" src="${contextPath}/resources/images/like2.png"></th>
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
														<td>
														<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
				                    <c:if test="${board.categoryCode == '11'}">background-color: rgba(68, 152, 221, 0.699);</c:if>
				                    <c:if test="${board.categoryCode == '12'}">background-color: gray;</c:if>
				                    <c:if test="${board.categoryCode == '13'}">background-color: rgb(135, 222, 150);</c:if>
				                    <c:if test="${board.categoryCode == '14'}">background-color: navy;</c:if>
				                    <c:if test="${board.categoryCode == '15'}">background-color: rgb(245, 91, 125);</c:if>
				                    <c:if test="${board.categoryCode == '16'}">background-color: burlywood;</c:if> '>${board.categoryName}</div>
														</td>
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
														<td>${board.likeCount}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
                  </table>
									<%-- 로그인이 되어있는 경우 --%>
									<%-- <c:if test="${!empty loginMember }"> --%>
										<a class="btn btn-success float-right" href="${contextPath}/board/insert">글쓰기</a>
									<%-- </c:if> --%>
									
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
										<c:set var="lastPage" value="?cp=${bpInfo.maxPage}${searchStr}" />
					
										<fmt:parseNumber var="c1" value="${(bpInfo.currentPage - 1) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
										<c:set var="prevPage" value="?cp=${prev}${searchStr}" />
					
					
										<fmt:parseNumber var="c2" value="${(bpInfo.currentPage + 9) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
										<c:set var="nextPage" value="?cp=${next}${searchStr}" />
					
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
																	<li class="page-item"><a class="page-link" href="?cp=${page}${searchStr}" data-abc="true">${page}</a></li>
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
									
									
                  
                  <!-- 검색창 -->
                  <div class="search">
                    <form action="${contextPath}/board/search" method="GET">
                    <select name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
                      <option value="title">제목</option>
                      <option value="writer">작성자</option>
                      <option value="titcont">제목+내용</option>
                    </select>
                    <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                    <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
                    </form>
                  </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
		<c:set var="returnListURL" value="${contextPath}/board/list/?cp=${bpInfo.currentPage}" scope="session" />
    
    <script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		
		$("#list-table td").on("click", function(){
			var boardNo = $(this).parent().children().eq(0).text();

			var boardViewURL = "${contextPath}/board/" + boardNo;
			
			location.href = boardViewURL;
			
		});
		
		// 검색 내용이 있을 경우 검색창에 해당 내용을 작성해두는 기능
		(function(){
			var searchKey = "${param.sk}";
			var searchValue = "${param.sv}";
			$("select[name=sk] > option").each(function(index, item){
				if( $(item).val() == searchKey ){
					$(item).prop("selected", true);
				}
			});
			$("input[name=sv]").val(searchValue);
		})();
		
		
		
		// 카테고리 정렬
		
		$(function(){
    	$("button").on('click',function(){
    			var kind = $(this).val();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
    			$.ajax({
    				 				url : "${contextPath}/board/list", // 이 주소로 
    	              type : "post", // 포스트 방식으로 보내는데
    	              cache: false,
    	              headers: {"cache-control":"no-cache", "pragma": "no-cache"},
    	              data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
    	              success : function(data){ 
    	                 console.log(data);
    	                
    	                 $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
    	              },
    	              error : function(data){
    	            	 alert('error');
    	               
    	              }//error
    			})//ajax
    		});//click
    });//ready
		
		
		
    </script>
</body>
</html>