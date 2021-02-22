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
.lead { text-align: right; }
.text-right > a, .text-right > a:hover { color: red; text-decoration: none; }
	
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
                
                <h3>자유게시판</h3>

                <div id="board-area">
                    <!-- 카테고리 -->
                    <h4>[반려동물]

                    <!-- 제목 -->
                    가지랑 산책한 사진~ </h4>
                    <hr>
                </div>

                <div class="lead">
                    <!-- 작성자 (닉네임) -->
					<h6>유자차
				 	조회수 1
                    작성일 2021.02.20</h6>
                    <div class="text-right"><a href="#" onclick="window.open('#','name','resizable=no width=700 height=700');return false">신고</a></div>
				</div>

                <div class="board-content">
                    <br>
                    내용 웅앵웅앵웅<br>
                    웅애웅애웅<br>
                    <br>
                    <br>
                </div>

                <!-- 좋아요 (클릭하기) -->
								<span>
									<button type="button" id="likeBtn">
										<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
									</button>
								</span>
				
								<hr>

                <!-- 댓글(페이지 연결하기) -->
								<jsp:include page="boardReply.jsp"></jsp:include>

                <div class="text-center">
                    <button type="button" class="btn btn-secondary mb-3 btn-success">수정</button>
                    <button type="button" class="btn btn-secondary mb-3 btn-danger">삭제</button>
                    <div class="float-right">
                    <button type="button" class="btn btn-secondary mb-3">목록</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>