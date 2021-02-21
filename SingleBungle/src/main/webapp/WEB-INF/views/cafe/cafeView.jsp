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
.lead { text-align: right; }
.text-right > a { color: red; text-decoration: none; }

/* 댓글 부분 */
#replyContentArea { width: 94.5%; }

#replyContentArea > textarea {
	resize: none;
	width: 100%;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h3>맛집게시판</h3>

                <div id="board-area">
                    <!-- 카테고리 -->
                    <h4>[카페]

                    <!-- 제목 -->
                    연남동 분위기 좋은 카페 추천합니다. </h4>
                    <hr>
                </div>

                <div class="lead">
                    <!-- 작성자 (닉네임) -->
					<h6>유자차
				 	조회수 1
                    좋아요 1
                    작성일 2021.02.20</h6>
                    <div class="text-right"><a href="#" onclick="window.open('#','name','resizable=no width=700 height=700');return false">신고</a></div>
				</div>

                <!-- 지도 api 넣기 -->
                <div>
                    음식점 위치 - 지도 api 부분 - <br>
                    ㅜㅜ<br>
                </div>
                <div class="board-content">
                    <br>
                    내용 웅앵웅앵웅<br>
                    웅애웅애웅<br>
                    <br>
                    <br>
                </div>

                <!-- 좋아요 (클릭하기) -->
                <div id="like-area">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                        <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                    </svg>
                </div>

                <hr>

                <!-- 댓글(페이지 연결하기) -->
								<jsp:include page="cafeReply.jsp"></jsp:include>

                <div class="text-center">
                    <button type="button" class="btn btn-secondary mb-3 btn-success">수정</button>
                    <button type="button" class="btn btn-secondary mb-3 btn-danger">삭제</button>
                    <div class="text-right">
                    <button type="button" class="btn btn-secondary mb-3">목록</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>