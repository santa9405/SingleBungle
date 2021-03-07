<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SingleBungle</title>


     <!-- 부트스트랩 사용을 위한 css 추가 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
     integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

 <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
 <!-- 제이쿼리가 항상 먼저여야함 -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
     crossorigin="anonymous"></script>
     
     
<style>
   #freeBoard{
      height: 300px;
   }
   #findFriend{
      height: 170px;

   }

   #market{
      height : 500px;
   }

   #foodBoard, #review{
      height : 350px;
   }


   .images{
      width:40px;
      height: 40px;
   }


         /* 제목 */
         .text-dark{
        display:block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

      }
      
/* 캐러셀 화살표 바 색 변경 */
		.carousel-control-prev-icon {
 		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	}
	
	.carousel-control-next-icon {
  		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	}

</style>
<!-- Custom styles for this template -->
<link href="resources/css/carousel.css" rel="stylesheet">
</head>
<body>
	<!-- jsp 액션 태그를 이용한 동적 include -->
	<jsp:include page="header.jsp" />

	<main role="main">

	    <div class="container">
   <div class="row">
				<div class="col-md-12">
					<!-- 이벤트 배너 -->
					<div class="carousel slide" id="carousel-32703">
						<!-- 배너(이미지) 아래부분에 흰색으로 "ㅡ ㅡ ㅡ" 로 클릭해서 넘어가는 부분 없애기 -->
						<!--             <ol class="carousel-indicators">
               <li data-slide-to="0" data-target="#carousel-32703" class="active">
               </li>
               <li data-slide-to="1" data-target="#carousel-32703">
               </li>
               <li data-slide-to="2" data-target="#carousel-32703">
               </li>
            </ol> -->
						<div class="carousel-inner" style="height: 200px; margin-top: 10px;">
							<div class="carousel-item active">
								<img class="d-block w-100" src="${contextPath}/resources/images/mainImgTest.jpg" />
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-32703" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-32703" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
					</div>


					<div class="row py-2">
						<div class="col-md-7 ">
							<!-- 자유게시판 -->
							<div class="row">
								<div class="col-md-12">
									<h7>자유게시판</h7>
									<div class="wrapper" id="freeBoard">
										<table style="margin: 5px;">
											<c:if test="${empty bList }">
												<tr>
													<td style="text-align: center;">존재하는 게시글이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty bList }">
												<c:forEach var="board" items="${bList}" varStatus="vs">
													<tr>
														<td>
															<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
					                    <c:if test="${board.categoryCode == '11'}">background-color: #9ea9d7;</c:if>
					                    <c:if test="${board.categoryCode == '12'}">background-color: #d2add9;</c:if>
					                    <c:if test="${board.categoryCode == '13'}">background-color: #AFD485;</c:if>
					                    <c:if test="${board.categoryCode == '14'}">background-color: #e1c66d;</c:if>
					                    <c:if test="${board.categoryCode == '15'}">background-color: #ef8694;</c:if>
					                    <c:if test="${board.categoryCode == '16'}">background-color: #f6b06b;</c:if> '>${board.categoryName}</div>
														</td>
														<!-- </tr> -->
														<!-- <tr> -->
														<td><h7> <a href="#" class="text-dark">${board.boardTitle}</a></h7></td>
													</tr>
												</c:forEach>
											</c:if>
										</table>
									</div>
								</div>
							</div>


							<!-- 친구찾기 -->
							<div class="row" style="margin-top: 10px;">
								<div class="col-md-12">
									<h7>친구찾기</h7>

									<div class="wrapper p-1" id="findFriend">

										<table style="margin: 5px;">
											<c:choose>
												<c:when test="${empty fList}">
													<tr>
														<td>작성된 글이 없습니다.</td>
													</tr>
												</c:when>

												<c:otherwise>
													<%-- 조회된 게시글 목록이 있을 때 --%>
													<c:forEach var="friend" items="${fList}">

														<tr>
															<td>
																<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='	
																<c:if test="${friend.categoryNm == '맛집'}">background-color: burlywood;</c:if>	
																<c:if test="${friend.categoryNm == '문화생활'}">background-color: skyblue;</c:if>	
																<c:if test="${friend.categoryNm == '동네친구'}">background-color: coral;</c:if> '>${friend.categoryNm}</div>
															</td>
															<td><h7> <a href="#" class="text-dark">${friend.friendTitle}</a></h7></td>
														</tr>

													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>

									</div>
								</div>
							</div>

							<!-- 사고팔고 -->
							<div class="col-md-5 ">
								<h7>사고팔고</h7>
								<div class="col-md-12" id="market">
								<c:if test="${empty mList}">존재하는 게시글이 없습니다!</c:if></div>
								<c:if test="${!empty mList}">
									<c:forEach var="market" items="${mList}" varStatus="vs">
										<div class="row" id="market">
											<div class="col-xl-4 col-lg-4 col-md-6 mb-4" style="margin-top: 5px;">
												<div class="bg-white">
													<div class="embed-responsive embed-responsive-4by3">
														<img src="/Image/발받침대.png" class="img-fluid card-img-top embed-responsive-item">
													</div>
													<div class="p-2">
														<div class="categoryDetail float-left row_2">
															<p class="small text-muted mb-0">
																<c:if test="${market.transactionCategory == 1}">삽니다</c:if>
																<c:if test="${market.transactionCategory == 2}">팝니다</c:if>
															</p>
															<p class="small text-muted mb-0">${market.categoryNm}</p>
															<div style="clear: both;">
																<a href="#" class="text-dark">${market.marketTitle}</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>


							<!-- 맛집게시판 -->
							<div class="row py-3">
								<div class="col-md-12" id="cafe">
									<h7>맛집게시판</h7>
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
								</div>
							</div>


							<!-- 내돈내산 -->
							<div class="row py-3">
								<div class="col-md-12" id="review">
									<h7>내돈내산</h7>

									<div class="row">
										<c:if test="${empty rList }">
											<div class="col-lg-12">
												<h5 style="text-aline: center;">존재하는 게시글이 없습니다.</h5>
											</div>
										</c:if>


										<c:if test="${!empty rList }">
											<c:forEach var="review" items="${rList}" varStatus="vs">
												<!-- Gallery item -->
												<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
													<div class="bg-white rounded shadow-sm viewdetail">

														<!-- 썸네일 영역 -->
														<div class="embed-responsive embed-responsive-4by3">
															<c:set var="flag" value="true" />
															<c:forEach var="thumbnail" items="${thList}">
																<c:if test="${review.boardNo == thumbnail.parentBoardNo }">
																	<img src="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}" class="img-fluid card-img-top embed-responsive-item">
																	<c:set var="flag" value="false" />
																</c:if>
															</c:forEach>

															<c:if test="${flag=='true'}">
																<img src="${contextPath}/resources/images/ReviewNonImages.png" class="img-fluid card-img-top embed-responsive-item">
															</c:if>
														</div>

														<div class="infoAreaWrapper">
															<h5>
																<a class="text-dark">${review.boardTitle }</a>
															</h5>
															<div class="infoArea ">
																<div class="viewArea float-left">
																	<jsp:useBean id="now" class="java.util.Date" />
																	<fmt:formatDate var="createDate" value="${review.createDate }" pattern="yyyy-MM-dd" />
																	<fmt:formatDate var="today" value="${now }" pattern="yyyy-MM-dd" />
																	<c:choose>
																		<c:when test="${createDate != today }">
																						${createDate }
																					</c:when>
																		<c:otherwise>
																			<fmt:formatDate value="${review.createDate}" pattern="HH:mm" />
																		</c:otherwise>
																	</c:choose>
																</div>
																<div class="viewArea mb-2 float-right">
																	<img class="icon" src="${contextPath}/resources/images/view.png" /> ${review.readCount } &nbsp;

																	<!-- 좋아요  -->
																	<span> <img src="${contextPath}/resources/images/like1.png" width="11" height="11" id="heart" class='likeImgs 
																					<c:forEach var="like" items="${likeInfo}">
																					<c:if test="${like.boardNo == review.boardNo}">like2</c:if>
																					</c:forEach>'> <span class="likeCnt" style="font-size: 12px;">${review.likeCount}</span>
																		</button>
																	</span>
																</div>

															</div>
															<div class="nickNameArea d-flex  align-items-center justify-content-between rounded-pill bg-light px-3 py-2 " style="clear: both;">
																<p class="small mb-0">
																	<span class="font-weight-bold price">${review.nickName }</span>
																</p>
																<div class='badge badge-danger px-3 rounded-pill font-weight-normal' style='
								                            <c:if test="${review.categoryCode == '21'}">background-color: burlywood;</c:if>
								                            <c:if test="${review.categoryCode == '22'}">background-color: #8dbe88;</c:if>
								                            <c:if test="${review.categoryCode == '23'}">background-color: #5d8eb6d5;</c:if>
								                            <c:if test="${review.categoryCode == '24'}">background-color: #d48a9a;</c:if> '>${review.categoryName }</div>
															</div>
														</div>
														<span id="boardNo" style="visibility: hidden">${review.boardNo }</span>
													</div>
												</div>

											</c:forEach>
										</c:if>
										<!-- End -->
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			
	</main>

	<script>
	
	</script>

	<jsp:include page="footer.jsp" />
</body>
</html>