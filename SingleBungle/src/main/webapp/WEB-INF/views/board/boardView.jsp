<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 자유게시판 상세조회 페이지</title>
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
	
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h8>자유게시판</h8>
								<div class="float-right">
									<button type="button" class="btn btn-secondary mb-3 btn-success">목록</button>
									<button type="button" class="btn btn-secondary mb-3 btn-danger report">신고</button>
								</div>
								
                <div id="board-area">
                    <!-- 카테고리 -->
                    <h2><div class="badge badge-danger px-3 rounded-pill font-weight-normal" style="background-color: burlywood;">반려동물</div>

                    <!-- 제목 -->
                    	가지랑 산책한 사진~</h2>
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
								<jsp:include page="boardReply.jsp"></jsp:include>

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
									<div class="col-md-12 text-center">
										<button type="button" class="btn btn-success">목록으로</button>
									</div>
								</div>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
   $(".report").on("click", function(){
       window.open('${contextPath}/board/report', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
	 });
	</script>
</body>
</html>