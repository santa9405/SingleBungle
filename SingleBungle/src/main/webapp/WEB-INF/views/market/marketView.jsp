<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 - 상세 조회</title>
<link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<style>

 .boardName {
   margin-right: 40px;
 }

 .category {
   text-decoration: none;
   color: black;
   line-height: 54px;
 }

 .category:hover{
   text-decoration: none;
   color: rgb(214, 156, 30);
 }
 
	.boardImgArea{
		height: 300px;
	}

	.boardImg{
		width : 100%;
		height: 100%;
		max-width : 100%;
		max-height: 100%;
		
		margin : auto;
	}
	
		.carousel-control-prev-icon {
 		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	}
	
	.carousel-control-next-icon {
  		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	}
	
		/* 이미지 선택 색 변경*/
	.carousel-indicators > li{
		background-color: #ccc !important;
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
		margin-top : 10px;
	}
	
	.itemTitle{
		margin-bottom: 35px;
	}
	
	.itemPrice{
		margin-right: 30px; 
	}
	
	.smallImages{
    margin-right: 8px;
	}
	
	.cnt, .verticalBar{
    line-height: 1;
    margin-bottom : 40px;
	}
	 
	.verticalBar{
		margin : 0 5px 0 5px;
		color: #d6d6d6;
	}
	
	.itemInfoList{
		clear:both; 
		margin-bottom: 30px;
	}
	
	.itemInfoList ul {
		padding-left: 20px;
	}
	
	
	#report{
		padding : 0 8px 0 8px;
	}

   #report span {
    line-height: 2;
   }
   
   .contentArea{
	    min-height: 400px;
   }
	 
   /* TOP3 출력 */
      body {
      background: #f4f4f4;
    }

    .boardName {
      margin-right: 40px;
    }

    .card-img-top{
      height: 15rem;
    }

    .categoryArea, .arrayArea{
      display: inline-block;
    }

    .category, .array{
      text-decoration: none;
      color: black;
      line-height : 54px;
      /*margin-right:5px;*/
    }
    
    .viewArea,.replyArea{
      display: inline-block;
      font-size: 11px;
      margin-right:5px;
    }

    .nickNameArea{
      clear: both;
    }
    .icon {
      width: 13px;
    }
     
     	/* 좋아요 */
	#likeBtn {
    border: 0px solid #ddd;
    background-color: rgba(255, 255, 255, 0);
  }
  
   .text-dark {
  display:block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
	}
  
  .priceArea {
    clear: both;
  }
  
  .popularItemTitle {
    	margin-top: 60px;
  }
  
  .itemInfoList label{
  	width: 95px;
  }
  
  .searchArea {
  	margin : auto;
  }
  
  #searchBtn{
  	background: burlywood;
  }
  
  #searchInput, #searchBtn {
  	border : 1px solid burlywood;
  }
  
   .banner span {
 			color : #c1c0c1a1;
 		}
 		
 	.boardImgArea{
		height: 300px;
	}

	.boardImg{
		width : 100%;
		height: 100%;
		max-width : 460x;
		max-height: 400px;
		margin : auto;
	}
	
	.btnW{
		width: 145px;
		height: 55px;
	}
	
	.like2 {
	background-size : 20px;
	background-image: url('${contextPath}/resources/images/like2.png');
	background-repeat: no-repeat;
}

.seller a {
	text-decoration: none;
	color : orange;
}
  
  
.viewdetail:hover {
	cursor: pointer;
}

</style>


</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">

      <!-- 게시판 이름/카테고리 -->
      <div class="row py-5 no-gutters">
							<div class="col-md-12">
							
			<button type="button" class="btn btn-success float-right returnBtn">목록</button>
		</div>
        <div class="col-lg-12 mx-auto">
        	      
          <div class="text-black  banner">
								<h1 class="boardName ">사고팔고</h1>
								<hr>
          </div>
        </div>
      </div>
      <!-- End -->
      

			<div class="row">
				<div class="col-md-6">
						
			<!-- 이미지 출력 -->
            <c:if test="${!empty at}"> 
            <div class="carousel slide boardImgArea" id="board-image">
               
               <!-- 출력되는 이미지 -->
               <div class="carousel-inner">
                  <c:forEach var="at" items="${at}" varStatus="vs">
                  	<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}"/>
                  	
                     <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
                        <img class="d-block w-100 boardImg" id="200" 
                          src="${src}" /><input type="hidden" value="${at.fileNo}">
                     </div>
                  </c:forEach>
               </div> 
               
               <!-- 좌우 화살표 -->
               <a class="carousel-control-prev" href="#board-image" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> 
               <a class="carousel-control-next" href="#board-image" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
            </div>
            </c:if>
            
            
            
				</div>
				
				
				
				<div class="col-md-6 no">
				<span style='visibility: hidden;'>${market.marketNo}</span>
					<div> <h3>[${market.categoryNm}]</h3> </div> 
					<div> <h3 class="itemTitle">${market.marketTitle}</h3> </div>
					<div> <h1 class="itemPrice float-left"><fmt:formatNumber value="${market.price}" pattern="###,###,###,###"/>원</h1> 
						
						 <!-- 본인의 글이면 버튼 나타나게 -->
						 <c:if test="${market.memNo == loginMember.memberNo}"> 
							<div class="badge badge-danger px-1 rounded-pill font-weight-normal btnBadge" <c:if test='${market.transactionStatus == 3}'>style='visibility: hidden;'</c:if>>
								<button class="btnSoldOut reservationBtn" >
									<c:if test="${market.transactionStatus == 1}">예약중으로 변경</c:if>
									<c:if test="${market.transactionStatus == 2}">예약 취소</c:if>
								</button></div>
							<div class="badge badge-info px-1 rounded-pill font-weight-normal btnBadge">
								<button class="btnSoldOut soldOutBtn" <c:if test="${market.transactionStatus == 3}">style='cursor: unset;'</c:if>>
									<c:if test="${market.transactionStatus != 3}">거래완료로 변경</c:if>
									<c:if test="${market.transactionStatus == 3}">거래완료</c:if>
								</button></div>	
						</c:if>				
						<hr> 
					</div>
					
					
						<div>
						 <img class='float-left likeImg smallImages 
						 		<c:forEach var="like" items="${likeInfo}"><c:if test="${like.marketNo == market.marketNo}">like2</c:if></c:forEach>'
						 			 width="20" height="20" src="${contextPath}/resources/images/like1.png"> 
						 <h5 class="likeCnt float-left cnt likes">${market.likes}</h5>
							<h5 class="verticalBar float-left"> | </h5>
						 </div> 
						 
							<div>
						 <img class="float-left readCntImg smallImages" width="20" height="20" src="${contextPath}/resources/images/view.png"> 
						 
						 <h5 class="readCnt float-left cnt">${market.readCount}</h5> 
						 <h5 class="verticalBar float-left"> | </h5>
						 </div>
						  
						<div>
<%-- 						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate var="createDt" value="${market.createDt}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="today" value="${now }" pattern="yyyy-MM-dd" />  --%>
						 <img class="float-left clockImg smallImages" width="20" height="20" src="${contextPath}/resources/images/clock.png"> 
						 <h5 class="clock float-left cnt">${createDt - today}</h5> 
						 </div> 
						 
						

							<button  type="button" class="btn float-right btn-sm mb-3 report" id="report" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/siren.png" width="20" height="20" id="siren">
								신고하기
							</button>
						
						 
			
					
						<div class="itemInfoList">
							<ul >
								<li class="seller">
										<label>판매자</label> <a href='${contextPath}/market/mypage/${market.memNo}'>${market.nickname}</a>
										
								</li>
								
								<li class="itemStatus">
									<label>상태</label> 
									<span>
										<c:if test="${market.status == 'U'}">중고</c:if>
										<c:if test="${market.status == 'N'}">새상품</c:if>
									</span>
								</li>
								
								<li class="itemDelivery">
									<label>배송비</label> 
									<span>
										<c:if test="${market.deliveryCharge == 'F'}">배송비 포함</c:if>
										<c:if test="${market.deliveryCharge == 'N'}">배송비 별도</c:if>
									</span>
								</li>
								
								<li class="sellerLocation ">
									<label>거래지역</label> <span>경기도 호평동</span>
								</li>
							</ul>
						</div>
						
						
						<!-- 좋아요(찜하기) -->
 						<div>
							<a class="btn btn-primary btn-lg btnW likeBtn active" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/like1.png" width="20" height="20" id="heart"
									class='likeImgs <c:if test="${likeCheck == 1}">like2</c:if>'>
								<span class="likeCnt cnt">
									<c:if test="${likeCheck == 1}">찜하기 취소</c:if>
									<c:if test="${likeCheck != 1}">찜하기</c:if>
								</span>
							</a>
							
							
							<a href="#" class="btn btn-secondary btn-lg btnW active" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/message.png" width="20" height="20" id="message"> 
								<span class="messageText">쪽지</span>
							</a>
							
							<a href="#" class="btn btn-info btn-lg btnW" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/message.png" width="20" height="20" id="deal"> 
								<span class="messageText">거래신청</span>
							</a>
						</div>
						
						<c:if test="${market.memNo == loginMember.memberNo}"> 
						<div style="margin-top : 10px;">
							<a class="btn btn-warning btn-lg btnW active" role="button" aria-pressed="true"
								 href="${contextPath}/market/update/${market.marketNo}">
								<span>수정</span>
							</a>
							
							<a  class="btn btn-danger btn-lg btnW active MdeleteBtn" role="button" aria-pressed="true"
									href="${contextPath}/market/delete/${market.marketNo}">
								<span>삭제</span>
							</a>
						</div>
						</c:if>
				</div> 
				
		</div>
		
		<hr>
		
		<!-- 게시글 내용 -->
		<div class="row">
			<div class="col-md-12 contentArea">
			<% pageContext.setAttribute("newLine", "\n"); %>
				${fn:replace(market.marketContent , newLine, "<br>")}
			</div>
		</div>

		<!-- 댓글(페이지 연결하기) -->
		<jsp:include page="marketReply.jsp"></jsp:include>
		
				<!-- 버튼 -->
		<div class="row float-right mt-3">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
					<c:if test="${market.memNo == loginMember.memberNo}"> 
						<button type="button" class="btn btn-success updateBtn">수정</button>
						<button type="button" class="btn btn-danger MdeleteBtn">삭제</button>
					</c:if>
					</div>
				</div>
			</div>
		</div>

		<!-- 목록버튼 -->
		<div class="row  py-3" style="clear: both;">
			<div class="col-md-12 text-center ">
				<c:if test="${empty sessionScope.returnListURL}"> 
					<c:set var="returnListURL" value="/list" scope="session"/>
				</c:if>   
				<button type="button" class="btn btn-success returnBtn">목록으로</button>
				
			</div>
		</div>
		
		
		
		<h5 class="popularItemTitle">사고팔고 인기 게시글</h5>
		<hr>


			<div class="row itemArea">
				<!-- Gallery item -->

				<c:if test="${empty marketList}">존재하는 게시글이 없습니다!</c:if>
				<c:if test="${!empty marketList}">
					<c:forEach var="market" items="${marketList}" varStatus="vs">
						<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm viewdetail">
								<span style='visibility: hidden;'>${market.marketNo}</span>
								<div class="embed-responsive embed-responsive-4by3">
							
									<c:forEach items="${thList}" var="th">
									<c:if test="${th.parentMarketNo == market.marketNo}">
									<img src="${contextPath}/${th.filePath}/${th.fileName}" 
										class="img-fluid card-img-top embed-responsive-item marketNo"
										<c:if test="${market.transactionStatus != 1}"> style="opacity: 0.5;" </c:if>>
									</c:if>
									</c:forEach>
								</div>
								<div class="p-4">
									<h5>
										<a class="text-dark marketNo">${market.marketTitle}</a>
									</h5>
									<div class="categoryDetail float-left row_2">
										<p class="small text-muted mb-0">
											<c:if test="${market.transactionCategory == 1}">삽니다</c:if>
											<c:if test="${market.transactionCategory == 2}">팝니다</c:if>
										</p>
										<p class="small text-muted mb-0">${market.categoryNm}</p>
									</div>

										

									<!-- 좋아요 버튼 -->
									<span class="float-right">
								
											<img src="${contextPath}/resources/images/like1.png"
												width="20" height="20" id="heart" class='likeImgs <c:forEach var="like" items="${likeInfo}"><c:if test="${like.marketNo == market.marketNo}">like2</c:if></c:forEach>'>
											<span class="likeCnt">${market.likes}</span>
					
									</span>
									
									
									
									

									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4 priceArea">
										<p class="small mb-0">
											<i class="mr-2"></i><span class="font-weight-bold price"> <fmt:formatNumber value="${market.price}" pattern="###,###,###,###"/>
												원</span>
										</p>
										<c:if test="${market.transactionStatus == 1}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #deb887;">거래중</div>
										</c:if>
										<c:if test="${market.transactionStatus == 2}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #e01515ad;">예약중</div>
										</c:if>
										<c:if test="${market.transactionStatus == 3}">
											<div
												class="badge badge-info px-3 rounded-pill font-weight-normal"
												style="background-color: #3596ead6;">거래완료</div>
										</c:if>

									</div>
								</div>
								<span id="marketNo"  style="visibility: hidden">${market.marketNo}</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- End -->
			</div>
		
	
		

	<script>
	
	// 인기 게시글 상세 조회
		$(".viewdetail").on("click",function(){
		var marketNo = $(this).children("span#marketNo").text();
		
		var marketViewURL = marketNo;
		
		location.href = marketViewURL;
	});
	
	
	
	// 목록으로 버튼
	$(".returnBtn").on("click", function(){
		location.href = "${sessionScope.returnListURL}"
	});
	
	// 수정 버튼
	$(".updateBtn").on("click", function(){
		location.href = "${contextPath}/market/update/${market.marketNo}"
	});
	
	// 삭제버튼
	$(".MdeleteBtn").on("click", function(){
		var result = confirm("삭제 하시겠습니까?");
		
		if(result==true){
			location.href = "${contextPath}/market/delete/${market.marketNo}";
		}
	});
	
	$(".likeBtn").on("click", function(){
		var marketNo = $(this).closest('.no').children().eq(0).text();
		var likeClassArray = $(this).children().attr('class').split(" ");
		var likeClass = "like1";
		var likeImg = $(this).children(".likeImgs");
		var likeCnt = $(".likes");
		var likedelete = $(this).children(".cnt");
		
	
		if(likeClassArray[1] == "like2") {
			likeClass = "like2"; 
		}
		
		if(likeClass == "like1") {
			$.ajax({
				url : "increaseLike",
				type : "post",
				data : {"marketNo" : marketNo},
				success : function(result){
					if(result > 0) {
						likeCnt.text(Number(likeCnt.text()) + 1);
						likedelete.text("찜하기 취소");
						likeImg.toggleClass("like2");
					}
				}, 
				error : function(result){
					console.log("ajax 통신 오류 발생1");
				}
			});
		} else{
			$.ajax({
				url : "decreaseLike",
				type : "post", 
				data : {"marketNo" : marketNo},
				success : function(result){
					if(result > 0){ // 삭제 성공
						likeCnt.text(Number(likeCnt.text()) - 1);
						likeImg.removeClass("like2");
						likedelete.text("찜하기");
					}
				},
				error : function(result){
					console.log("ajax 통신 오류 발생2");
				}
			});
		}
	});
	
	console.log("");
	var status = ${market.transactionStatus};
	// 예약중으로 변경
	$(".reservationBtn").on("click", function(){
		var marketNo = ${market.marketNo};
		
		if(status == 1){
		$.ajax({
			url : "reservation/2",
			data : {"marketNo" : marketNo},
			type : "post",
			success : function(result){
				if(result > 0) {
					$(".reservationBtn").text("예약 취소");
					status = 2;
				} 
			}, error : function(result){
				console.log("ajax 통신 실패");
			}
		});
		}
		
		
		if(status == 2){
			$.ajax({
				url : "reservation/1",
				data : {"marketNo" : marketNo},
				type : "post",
				success : function(result){
					if(result > 0) {
						$(".reservationBtn").text("예약중으로 변경");
						status = 1;
					}
				}, error : function(result){
					console.log("ajax 통신 실패");
				}
			});
			}
	});

		$(".soldOutBtn").on("click", function(){
			var marketNo = ${market.marketNo};
			
			if(status == 1 || status == 2){
				$.ajax({
					url : "reservation/3",
					data : {"marketNo" : marketNo},
					type : "post",
					success : function(result){
						if(result > 0) {
							//$(".reservationBtn").attr("disabled");
							$(".reservationBtn").parent().remove();
							$(".soldOutBtn").text("거래완료").css("cursor", "unset");
							status = 3;
						}
					}, error : function(result){
						console.log("ajax 통신 실패");
					}
				});
				}
		});
	
		
		
		// 신고하기
		$(".report").on("click", function(){
			window.name = "parentWindow";
			 window.open('${contextPath}/market/marketReport/${market.marketNo}', "popup", "width=550, height=650, toolbars=no, scrollbars=no, menubar=no left=1000 top=200");
		});

		

	</script>
		
</body>
</html>