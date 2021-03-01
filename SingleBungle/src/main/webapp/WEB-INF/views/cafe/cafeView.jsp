<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 상세조회 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>
#img-list:hover, .cafeTitle:hover {
	cursor: pointer;
}

.boardInfo {
	display: inline-block;
	margin-right: 15px;
}

.image {
	width: 30px;
	height: 30px;
}

.text-dark {
  display:block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

#cafeNo {
	display: none;
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

/* 인기 게시글 */
.nickNameArea{ clear: both; }

.icon { width: 13px; }

.viewArea,.replyArea{
  display: inline-block;
  font-size: 11px;
  margin-right:5px;
}

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h8>맛집게시판</h8>
								<div class="float-right">
									<button type="button" class="btn btn-secondary mb-3 btn-success insert-list">목록</button>
									<button type="button" class="btn btn-secondary mb-3 btn-danger report">신고</button>
								</div>

                <div id="board-area">
                    <!-- 카테고리 -->
                    <h2>
                    <div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
                    <c:if test="${cafe.categoryCode == '1'}">background-color: rgba(68, 152, 221, 0.699);</c:if>
                    <c:if test="${cafe.categoryCode == '2'}">background-color: rgb(245, 91, 125);</c:if>
                    <c:if test="${cafe.categoryCode == '3'}">background-color: burlywood;</c:if> '>${cafe.categoryName}</div>
                    
                    <!-- 제목 -->
                    ${cafe.cafeTitle}</h2>
                    <hr>
                </div>

								<div class="row">
									<div class="col-md-12">
										<div class="boardInfo" id="writer">
											<img class="image" src="${contextPath}/resources/images/profile.png" /> ${cafe.nickname}
										</div>
										<div class="boardInfo" id="createDt" style="color: gray">${cafe.createDate}</div>
										<div class="infoArea float-right">
											<img class="image" src="${contextPath}/resources/images/view.png"> ${cafe.readCount} <span>
												<button type="button" id="likeBtn">
													<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">${cafe.likeCount}</span>
												</button>
											</span>
										</div>
									</div>
								</div>
								
                <div class="board-content">
<%--                 	<!-- 이미지 부분 -->
									<c:if test="${!empty attachmentList}">
					
										<div class="carousel slide m-3" id="carousel-325626">
					
											<div class="carousel-inner boardImgArea">
					
												<c:forEach var="at" items="${attachmentList}" varStatus="vs">
													<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
					
													<div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
														<img class="d-block w-100 boardImg" src="${src}" />
														<input type="hidden" value="${at.fileNo}">
													</div>
												</c:forEach>
											</div> --%>
                
                	<!-- Content -->
                	<%-- JSTL을 이용한 개행문자 처리 --%>
				
									<% pageContext.setAttribute("newLine", "\n"); %>
									${fn:replace(cafe.cafeContent , newLine, "<br>")}
                
                </div>
				
								<hr>

                <!-- 댓글(페이지 연결하기) -->
								<jsp:include page="cafeReply.jsp"></jsp:include>

								<!-- 버튼 -->
								<div class="row float-right mt-3">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-12">
												<!-- 로그인된 회원이 글 작성자인 경우 -->
<%-- 												<c:if test="${(loginMember != null) && (cafe.memberId == loginMember.memberId)}"> --%>
												<button type="button" class="btn btn-success updateBtn">수정</button>
												<button type="button" class="btn btn-danger deleteBtn">삭제</button>
<%-- 												</c:if> --%>
											</div>
										</div>
									</div>
								</div>
						
								<!-- 목록버튼 -->
								<div class="row  py-3" style="clear: both;">
									<div class="col-md-12 text-center">
										<button type="button" class="btn btn-success insert-list">목록으로</button>
									</div>
								</div>
                
		<h7>맛집게시판 인기 게시글</h7>
		<hr>
        <div class="row">
        
        	<c:if test="${!empty cafeList }">
						<c:forEach var="cafe" items="${cafeList}" varStatus="vs">
				
          <!-- Gallery item -->
	        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
	          <div class="bg-white rounded shadow-sm cafe-list">
	            <div class="embed-responsive embed-responsive-4by3" id="img-list">
	              <img src="${contextPath}/resources/images/cafeTestImg.png" class="img-fluid card-img-top embed-responsive-item">
	            </div>
	            <div class="p-4">
	            <span id="cafeNo">${cafe.cafeNo}</span>
	              <h5> <a class="text-dark cafeTitle">${cafe.cafeTitle}</a></h5>
	              <div class="infoArea float-right">
	                <div class="viewArea">
	                  <img class="icon" src="${contextPath}/resources/images/view.png"/> ${cafe.readCount}
	                </div>
	                <div class="viewArea">
	                  <img class="icon" src="${contextPath}/resources/images/like1.png" /> ${cafe.likeCount}
	                </div>
	              </div>
	              <div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
	                <p class="small mb-0"><span class="font-weight-bold price">${cafe.nickname}</span></p>
	                
									<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
									<c:if test="${cafe.categoryCode == '1'}">background-color: rgba(68, 152, 221, 0.699);</c:if>
                  <c:if test="${cafe.categoryCode == '2'}">background-color: rgb(245, 91, 125);</c:if>
                  <c:if test="${cafe.categoryCode == '3'}">background-color: burlywood;</c:if> '>${cafe.categoryName}</div>
	                
	              </div>
	            </div>
	          </div>
	        </div>
	      </c:forEach>
			</c:if>
      <!-- End -->
          
       </div>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
	
		<script>
   $(".report").on("click", function(){
       window.open('${contextPath}/cafe/cafeReport', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
	 });
   
	// 목록버튼
	$(".insert-list").on("click", function(){
		location.href = "${sessionScope.returnListURL}";
	});
	
	// 수정버튼
	$(".updateBtn").on("click", function(){
		location.href = "${contextPath}/cafe/${cafe.cafeNo}/update";
	});
	
	// 삭제버튼
	$(".deleteBtn").on("click", function(){
		if(confirm("삭제 하시겠습니까?")){
	         location.href = "${contextPath}/cafe/${cafe.cafeNo}/delete";
	  }
	});
	
	// 조회수 top3 게시글 상세보기 기능 (jquery를 통해 작업)
	$(".cafe-list").on("click", function(){
		var cafeNo = $(this).children(".p-4").children().eq(0).text();
									
		// 상대경로
		var cafeViewURL = "${contextPath}/cafe/" + cafeNo;
		
		location.href = cafeViewURL;
		
	});
	
	</script>
	
	
</body>
</html>