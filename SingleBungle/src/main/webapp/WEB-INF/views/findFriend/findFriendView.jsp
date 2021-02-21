<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	#board-area{ margin-bottom:100px;}
	#board-content{ padding-bottom:150px;}
	#date-area{font-size: 12px; line-height: 12px}
	#date-area>p{margin: 0}
 
	.boardImgArea{
		height: 300px;
	}              

	.boardImg{
		width : 100%;
		height: 100%;
		
		max-width : 300px;
		max-height: 300px;
		
		margin : auto;
	}
	
	#content-main{ margin: 100px auto;}
	
	/* 이미지 화살표 색 조정
	-> fill='%23000' 부분의 000을
	   RGB 16진수 값을 작성하여 변경 가능 
	 */
	.carousel-control-prev-icon {
 		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	}
	
	.carousel-control-next-icon {
  		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	}
	
	.ctgr {
    margin-right: 10px;
	}
	
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
	
	.hr {
		clear : both;
	}
	
	body {
    background: #eee;
	}
	
	.date {
	    font-size: 11px;
	}
	
	.comment-text {
	    font-size: 12px;
	}
	
	.fs-12 {
	    font-size: 12px;
	}
	
	.shadow-none {
	    box-shadow: none;
	}
	
	.name {
	}
	
	.cursor:hover {
	    color: blue;
	}
	
	.cursor {
	    cursor: pointer;
	}
	
	.textarea {
	    resize: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container" id="content-main">

		<div>
			<div>
				<span class="float-left ctgr"><h4>맛집</h4></span>
				<span class="float-left"><h4>여</h4></span>
				<span class="float-left"><h4>마카오도우라오 훠궈 먹으러 가요</h4></span>
			</div>
			
			<hr class="hr">
			 
			<div>
				<img src="#" width="30" height="30">
				<span>닉네임</span>
				<span>조회수</span>
				<span>작성일</span>
				<span>
					<button type="button" id="likeBtn">
                  <img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
          </button>
        </span>
			</div>
			
			<div>
				<span>지역</span>
				<span>서울</span>
				<span>모임장소 : </span>
				<span>모임날짜 : </span>
				<span>모임시간 : </span>
			</div>
			
			
			<div>
				<span>모집인원 : </span>
				<button type="button" class="btn btn-primary">참여신청</button>
				<button type="button" class="btn btn-primary">신고</button>
			</div>
			
			<hr class="hr">
			
			<!-- Content -->
			<div id="board-content">
			내용
			</div>
				
				<hr>
				
				<div class="d-flex justify-content-center row">
        <div class="col-md-12">
            <div class="d-flex flex-column comment-section">
                <div class="bg-white p-2">
                    <div class="d-flex flex-row user-info"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40">
                        <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">닉네임</span><span class="date text-black-50">작성일</span></div>
                    </div>
                    <div class="mt-2">
                        <p class="comment-text">댓글 내용</p>
                    </div>
                </div>
                <div class="bg-light p-2">
                    <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40"><textarea class="form-control ml-1 shadow-none textarea"></textarea></div>
                    <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none" type="button">Post comment</button><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button></div>
                </div>
            </div>
        </div>
    </div>
				</div>

				<div>
					<div class="text-center">
					
						<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
						<c:if test="${empty sessionScope.returnListURL}">
							<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session"/>
						</c:if>
						<br>
						<a class="btn btn-success" href="${sessionScope.returnListURL}">목록으로</a>
	                	<c:url var="updateUrl" value="${board.boardNo}/update" />
	                	
	                	<!-- 로그인된 회원이 글 작성자인 경우 -->
						<c:if test="${(loginMember != null) && (board.memberId == loginMember.memberId)}">
							<a href="${updateUrl}" class="btn btn-success ml-1 mr-1">수정</a>
							<button id="deleteBtn" class="btn btn-success">삭제</button> 
						</c:if> 
					</div>
				</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>	
	
		// 게시글 삭제
		
		
	</script>
</body>
</html>
