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
    margin-right: 30px;
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
	
	.btnSoldOut, .btnSoldOut:focus {
		outline : none;
		background : none;
		border : none;
		color : white;
		font-weight: bold;
	}
	
	.btnBadge {
		border : 1px solid #ffc0cb00;
	}

	.listWrapper div {
	 		margin-bottom : 10px;
	}

	.boardInfo_detail{
		margin-right : 10px;
		font-weight: bold;
	}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container" id="content-main">

		<div class="content">
			<div>
				<span class="float-left ctgr"> <h3>[여성패션/잡화]</h3> </span>
				<span class="float-left"> <h3>얼마 안 쓴 MCM 장지갑 팝니다</h3> </span>
				<div class="statusArea float-right">
				<div class="badge badge-danger px-1 rounded-pill font-weight-normal btnBadge"><button class="btnSoldOut">예약중으로 변경</button></div>
				<div class="badge badge-info px-1 rounded-pill font-weight-normal btnBadge"><button class="btnSoldOut">거래완료로 변경</button></div>
				</div>
			</div>
			
			<hr class="hr">
			
			 
			 
			<div class="listWrapper">
			<div class="userInfo">
					<img src="${contextPath}/resources/images/profile.png" width="30" height="30">
					<span>인간자바</span>
			</div>
			<div class="boardInfo">
				<span class="boardInfo_detail">조회수 <span class="readCount">100</span> </span>
				<span class="boardInfo_detail">2021.02.21 18:13</span>
			</div>
			
			<div class="boardInfo float-left">
				<span class="boardInfo_detail">가격 <span class="itemPrice">60,000원</span></span>
				<span class="boardInfo_detail">지역 <span class="location">경기도</span></span>
				<span class="boardInfo_detail">상세주소 <span class="location_detail">호평동</span></span>
			</div>
				
				
				<!-- 좋아요 버튼 -->
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
	$(".btnSoldOut").hover(function(){
		$(this).parent().css("border", "1px solid pink");
	}, function(){
		$(this).parent().css("border", "1px solid #ffc0cb00");
	});
		
	</script>
</body>
</html>
