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
									<button type="button" class="btn btn-secondary mb-3 btn-success">목록</button>
									<button type="button" class="btn btn-secondary mb-3 btn-danger report">신고</button>
								</div>

                <div id="board-area">
                    <!-- 카테고리 -->
                    <h2><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">카페</div>

                    <!-- 제목 -->
                    	연남동 분위기 좋은 카페 추천합니다. </h2>
                    <hr>
                </div>

								<div class="row">
									<div class="col-md-12">
										<div class="boardInfo" id="writer">
											<img class="image" src="${contextPath}/resources/images/profile.png" /> 유자차
										</div>
										<div class="boardInfo" id="createDt" style="color: gray">2021.02.23</div>
										<div class="infoArea float-right">
											<img class="image" src="${contextPath}/resources/images/view.png"> 0 <span>
												<button type="button" id="likeBtn">
													<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">10</span>
												</button>
											</span>
										</div>
									</div>
								</div>
								
                <div class="board-content">
                    <br>
                    내용 웅앵웅앵웅<br>
                    웅애웅애웅<br>
                    <br>
                    <br>
                </div>
				
								<hr>

                <!-- 댓글(페이지 연결하기) -->
								<jsp:include page="cafeReply.jsp"></jsp:include>

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
                
		<h7>맛집게시판 인기 게시글</h7>
		<hr>
        <div class="row">
          <!-- Gallery item -->
	        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
	          <div class="bg-white rounded shadow-sm">
	            <div class="embed-responsive embed-responsive-4by3">
	              <img src="${contextPath}/resources/images/cafeTestImg.jpg" class="img-fluid card-img-top embed-responsive-item">
	            </div>
	            <div class="p-4">
	              <h5> <a href="#" class="text-dark">연남동 분위기 좋은 카페 추천합니다.</a></h5>
	              <div class="infoArea float-right">
	                <div class="viewArea">
	                  <img class="icon" src="${contextPath}/resources/images/view.png"/> 0
	                </div>
	                <div class="replyArea">
	                  <img class="icon" src="${contextPath}/resources/images/reply.png" /> 0
	                </div>
	              </div>
	              <div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
	                <p class="small mb-0"><span class="font-weight-bold price">유자차</span></p>
	                <div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">카페</div>
	              </div>
	            </div>
	          </div>
	        </div>
          <!-- End -->
    
          <!-- Gallery item -->
	        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
	          <div class="bg-white rounded shadow-sm">
	            <div class="embed-responsive embed-responsive-4by3">
	              <img src="${contextPath}/resources/images/cafeTestImg.jpg" class="img-fluid card-img-top embed-responsive-item">
	            </div>
	            <div class="p-4">
	              <h5> <a href="#" class="text-dark">라멘 좋아하는데 여긴 안가봤다?</a></h5>
	              <div class="infoArea float-right">
	                <div class="viewArea">
	                  <img class="icon" src="${contextPath}/resources/images/view.png"/> 0
	                </div>
	                <div class="replyArea">
	                  <img class="icon" src="${contextPath}/resources/images/reply.png" /> 0
	                </div>
	              </div>
	              <div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
	                <p class="small mb-0"><span class="font-weight-bold price">달마고</span></p>
	                <div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgb(245, 91, 125);">맛집추천</div>
	              </div>
	            </div>
	          </div>
	        </div>
          <!-- End -->
    
          <!-- Gallery item -->
	        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
	          <div class="bg-white rounded shadow-sm">
	            <div class="embed-responsive embed-responsive-4by3">
	              <img src="${contextPath}/resources/images/cafeTestImg.jpg" class="img-fluid card-img-top embed-responsive-item">
	            </div>
	            <div class="p-4">
	              <h5> <a href="#" class="text-dark">홍대 혼술집 추천해요</a></h5>
	              <div class="infoArea float-right">
	                <div class="viewArea">
	                  <img class="icon" src="${contextPath}/resources/images/view.png"/> 0
	                </div>
	                <div class="replyArea">
	                  <img class="icon" src="${contextPath}/resources/images/reply.png" /> 0
	                </div>
	              </div>
	              <div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
	                <p class="small mb-0"><span class="font-weight-bold price">유자차</span></p>
	                <div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: rgba(68, 152, 221, 0.699);">혼밥식당</div>
	              </div>
	            </div>
	          </div>
	        </div>
          <!-- End -->
       </div>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
	
		<script>
   $(".report").on("click", function(){
       window.open('${contextPath}/cafe/report', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
	 });
	</script>
	
</body>
</html>