<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	.boardTitleBorder{
    border-bottom: gray 1px solid;
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
       margin-right:5px;
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

   
  .like {
    background-image: url('${contextPath}/resources/img/like2.png');
    background-repeat: no-repeat;
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
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">

      <!-- 게시판 이름/카테고리 -->
      <div class="row py-5 no-gutters">
							<div class="col-md-12">
							<button type="button" class="btn btn-success float-right">목록</button>
		</div>
        <div class="col-lg-12 mx-auto boardTitleBorder">
        	      
          <div class="text-black rounded banner">
            <h1 class="boardName float-left">사고팔고</h1>
            <a class="category" href="#">전체</a>|
            <a class="category" href="#">팝니다</a>|
            <a class="category" href="#">삽니다</a>

            <div class="listTest float-right">
              <a class="category" href="#">최신순</a>|
              <a class="category" href="#">좋아요순</a>
            </div>
          </div>
        </div>
        <hr>
      </div>
      
      
      <!-- End -->
      



			<div class="row">
				<div class="col-md-6">
						
						            <!-- 이미지 출력 -->
            <c:if test="${!empty fList}"> 
            <div class="carousel slide boardImgArea" id="board-image">
               
               <!-- 이미지 선택 버튼 -->
               <ol class="carousel-indicators">
                  <c:forEach var="file" items="${fList}" varStatus="vs">
                     
                     <li data-slide-to="${vs.index }" data-target="#board-image"  
                           <c:if test="${vs.first}"> class="active" </c:if> 
                     >                      
                     </li>
                  
                  </c:forEach>
               </ol>
               
               
               <!-- 출력되는 이미지 -->
               <div class="carousel-inner">
                  <c:forEach var="file" items="${fList}" varStatus="vs">
                     <div class="carousel-item <c:if test="${vs.first}">active</c:if>">
                        <img class="d-block w-100 boardImg" id="200" 
                           src="${contextPath}/resources/images/testImg.gif">
                     </div>
                  </c:forEach>
               </div> 
               
               <!-- 좌우 화살표 -->
               <a class="carousel-control-prev" href="#board-image" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> 
               <a class="carousel-control-next" href="#board-image" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
            </div>
            </c:if>
            
            
            
				</div>
				
				
				
				<div class="col-md-6">
					<div> <h3>[카테고리]</h3> </div> 
					<div> <h3 class="itemTitle">오래 쓴 mcm 장지갑 팝니다gddfsgfdgfdgfgfsfsgsd.</h3> </div>
					<div> <h1 class="itemPrice float-left">60,000원</h1> 
					
						<div class="badge badge-danger px-1 rounded-pill font-weight-normal btnBadge"><button class="btnSoldOut">예약중으로 변경</button></div>
						<div class="badge badge-info px-1 rounded-pill font-weight-normal btnBadge"><button class="btnSoldOut">거래완료로 변경</button></div>					
						<hr> 
					</div>
					
					
						<div>
						 <img class="float-left likeImg smallImages" width="20" height="20" src="${contextPath}/resources/images/like1.png"> 
						 <h5 class="likeCnt float-left cnt">100</h5>
							<h5 class="verticalBar float-left"> | </h5>
						 </div> 
						 
							<div>
						 <img class="float-left readCntImg smallImages" width="20" height="20" src="${contextPath}/resources/images/view.png"> 
						 <h5 class="readCnt float-left cnt">100</h5> 
						 <h5 class="verticalBar float-left"> | </h5>
						 </div>
						  
						<div>
						 <img class="float-left clockImg smallImages" width="20" height="20" src="${contextPath}/resources/images/clock.png"> 
						 <h5 class="clock float-left cnt">5시간 전</h5> 
						 </div> 
						 
						
							
							<a href="#" class="btn float-right active" id="report" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/siren.png" width="20" height="20" id="siren">
								<span class="siren float-right">신고하기</span> 
							</a>
						
						 
			
					
						<div class="itemInfoList">
							<ul >
								<li class="sellerManor ">
										<label>매너온도</label> <span>35.7℃</span>
								</li>
								
								<li class="sellerLocation ">
									<label>거래지역</label> <span>경기도 호평동</span>
								</li>
								
								<li class="sellerManor ">
									<label>배송비</label> <span>배송비 별도</span>
								</li>
							</ul>
						</div>
						
 						<div>
							<a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/like1.png" width="20" height="20" id="heart">
								<span class="likeCnt cnt">찜하기</span>
							</a>
							
							<a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">
								<img src="${contextPath}/resources/images/message.png" width="20" height="20" id="message"> 
								<span class="messageText">쪽지</span>
							</a>
						</div>
						
						
						<div>
							<a href="#" class="btn btn-warning btn-lg active" role="button" aria-pressed="true">
								<span>수정</span>
							</a>
							
							<a href="#" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">
								<span>삭제</span>
							</a>
						</div>
				</div> 
				
		</div>
		
		<hr>
		
		<!-- 게시글 내용 -->
		<div class="row">
			<div class="col-md-12 contentArea">
				어쩌구저쩌구 <br> 글내용<br> 써머노트로 작성<br> 글<br> 사진<br>
			</div>
		</div>

		<!-- 댓글(페이지 연결하기) -->
		<jsp:include page="marketReply.jsp"></jsp:include>
		
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
		
		
		
		<h5 class="popularItemTitle">사고팔고 인기 게시글</h5>
		<hr>
		<div class="row" style="margin-bottom: 25px;">
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png"  class="img-fluid card-img-top embed-responsive-item">
					</div>
            <div class="p-4">
              <h5> <a href="#" class="text-dark">mcm 장지갑 팝니다.</a></h5>
              <div class="categoryDetail float-left row_2">
                <p class="small text-muted mb-0">전자기기</p>
              </div>
              
              
              
            <!-- 좋아요 버튼 -->
							<span class="float-right">
								<button type="button" id="likeBtn">
									<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
								</button>
							</span>


							<div
                class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4 priceArea">
                <p class="small mb-0"><i class="mr-2"></i><span class="font-weight-bold price">60,000원</span></p>
                <div class="badge badge-info px-3 rounded-pill font-weight-normal">거래완료</div>
              </div>
            </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png"  class="img-fluid card-img-top embed-responsive-item">
					</div>
            <div class="p-4">
              <h5> <a href="#" class="text-dark">mcm 장지갑 팝니다.</a></h5>
              <div class="categoryDetail float-left row_2">
                <p class="small text-muted mb-0">전자기기</p>
              </div>
              
              
              
            <!-- 좋아요 버튼 -->
							<span class="float-right">
								<button type="button" id="likeBtn">
									<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
								</button>
							</span>


							<div
                class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4 priceArea">
                <p class="small mb-0"><i class="mr-2"></i><span class="font-weight-bold price">60,000원</span></p>
                <div class="badge badge-info px-3 rounded-pill font-weight-normal">거래완료</div>
              </div>
            </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="bg-white rounded shadow-sm">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="${contextPath}/resources/images/reviewTestImg.png"  class="img-fluid card-img-top embed-responsive-item">
					</div>
            <div class="p-4">
              <h5> <a href="#" class="text-dark">mcm 장지갑 팝니다.</a></h5>
              <div class="categoryDetail float-left row_2">
                <p class="small text-muted mb-0">전자기기</p>
              </div>
              
              
              
            <!-- 좋아요 버튼 -->
							<span class="float-right">
								<button type="button" id="likeBtn">
									<img src="${contextPath}/resources/images/like1.png" width="15" height="15" id="heart" class='<c:if test="${likes > 0}">like</c:if>'> <span class="likeCnt">100</span>
								</button>
							</span>


							<div
                class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4 priceArea">
                <p class="small mb-0"><i class="mr-2"></i><span class="font-weight-bold price">60,000원</span></p>
                <div class="badge badge-info px-3 rounded-pill font-weight-normal">거래완료</div>
              </div>
            </div>
				</div>
			</div>
		</div>
		
		
</div>
</body>
</html>