<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 - 판매글 작성</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>




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

 .searchArea {
 	margin : auto;
 }
 
 #searchBtn{
 	background: burlywood;
 }
 
 #searchInput, #searchBtn {
 	border : 1px solid burlywood;
 }
 
 #requiredText{
 	color : red;
 	font-size : 16px;
 	margin-left : 30px;
 }
 
 .star{
 	color : red;
 }
 
 .formContent *{
 	list-style: none; 
 }
 
 .formContent{
    padding-left: 20px;
 }
 
 .insertForm {
    padding-left: 0px;
 }
 
 .borderTop {
 	border-top : 1px solid black;
 }
 
 .itemImages {
    padding-left: 0px;
 }
 
 .itemImageInsert{
 		width: 202px;
 		height: 202px;
 		position: relative;
 		border : 1px solid rgb(230, 229, 239);
 		display: flex;
 		align-items : center;
 		justify-content: center;
 		flex-direction: column;
 		color : rgb(155, 153, 169);
 		font-size : 1rem;
 		margin-right: 1rem;
 		box-sizing: border-box;
 }
 
 
 .itemImageInsert label {
 		width: 100%; 
 		height:100%;
 		cursor: pointer;
 		text-align : center;
 		line-height: 16;
 		background-image: url("${contextPath}/resources/images/camera.png");
 		background-size: auto;
 		background-position: center center;
 		background-repeat : no-repeat;
 		opacity: 0.5;
 }
 
 .banner span {
 	color : #c1c0c1a1;
 }
 
 .formRow{
 	border-bottom : 1px solid rgb(220, 219, 228);
 	padding : 32px 0 32px 0;
 }
 
 .formList{
 	width : 10.5rem;
 	font-size : 18px;
 	padding-top : 14px;
 }
 
 .titleFlex{
 	flex : 1 1 0%;
 }
 
 .titleArea{
 	display: flex;
 	width : 80%;
 	align-items: center;
 }
 
 .titleInput{
 	width: 100%;
 	padding : 0px 1rem;
 	border : 1px solid rgb(195, 194, 204);
 	height : 3rem;
 }
 
 .titleCnt{
 	width: 10%;
 	margin-left : 20px;
 }
 
 
 /* 취소 버튼  */
 #cancelBtn{
 	position : absolute;
 	right : 27%;
 	background-position: center center;
 	background-repeat: no-repeat;
 	background-size : 22px 22px;
 	width : 2rem;
 	height: 2rem;
 	background-image: url("${contextPath}/resources/images/cancel.png");
 	background-color: transparent;
 	outline : none;
 	border : 0;
 }
 
 .errorMsg{
 	color : #e67d10;
 	font-size : 14px;
 	display: block;
 }
 
 
 #locationInput{
 	width : 100%; 
 	margin-top : 1rem;
 	background : rgb(244, 244, 250);
 	height : 3rem;
 	padding : 0px 1rem;
 	border : 1px solid rgb(195, 194, 204);
 }

	.custom-control-label{
		width: 80px;
		margin-top: 10px;
	}
	
	#itemPrice{
		height : 3rem;
		padding : 0px 1rem;
		border : 1px solid rgb(195, 194, 204);
	}
	
	.itemInfoText{
		padding: 1rem;
		resize: none;
		line-height: 1.35;
		border : 1px solid rgb(195, 194, 204);		
		width: 100%;
	}



</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="px-lg-5">
				
				
					<form action="#" method="GET">
						<div class="input-group mb-4 col-md-8 searchArea">
							<input id="searchInput" type="search" placeholder="상품명 혹은 지역명을 입력하세요." aria-describedby="button-addon6" class="form-control" >
							<div class="input-group-append">
								<button id="searchBtn" type="submit" class="btn btn-info">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>


					<!-- 게시판 이름/카테고리 -->
					<div class="row py-5 no-gutters">
						<div class="col-lg-12 mx-auto">
							<div class="text-black banner">
								<h1 class="boardName float-left">사고팔고</h1>
								<a class="category" href="#">전체</a> <span>|</span> <a class="category" href="#">팝니다</a> <span>|</span> <a class="category" href="#">삽니다</a>

								<div class="listTest float-right">
									<a class="category" href="#">최신순</a> <span>|</span> <a class="category" href="#">좋아요순</a> <span>|</span> <a class="category" href="#">저가순</a> <span>|</span> <a class="category" href="#">고가순</a>
								</div>
								<hr>
							</div>
						</div>
					</div>
					<!-- End -->
					
					
					<h2>기본정보  <span id="requiredText">*필수정보</span> </h2> 
				
					
					<form action="#" method="POST">
					<ul class="insertForm">
					
					<!-- 이미지 -->
						<li class="formRow row borderTop">
							<div class="formList">
								<span>상품이미지<span class="star">*</span> (0/10) </span>
							</div>
							
							<div class="formContent">
								<ul class="itemImages">
									<li class="itemImageInsert">
										<label for="imagesInput">
											<!-- <img id="camera" src="${contextPath}/resources/images/camera.png"/> -->
											<span>이미지 등록</span></label>
											<input id="imagesInput" name="imagesInput" type="file" style="display: none;">
									</li>
									
								</ul>
							</div>
						</li>
						
						<!-- 제목 -->
						<li class="formRow row">
							<div class="formList">
								<span>제목<span class="star">*</span></span>
							</div>
							
							<div class="formContent titleFlex">
								<div class="titleArea ">
									<input type="text" placeholder="상품 제목을 입력해주세요." class="titleInput" value="">
									<button id="cancelBtn" type="button"></button>
									
									<div class="titleCnt">
									<span id="currCnt">10</span>
									<span id="maxCnt">/ 40</span>
								</div>
								</div>
								<span class="errorMsg" id="titleMsg">미친놈아!</span>
								
							</div>
						</li>
						
						
						<!-- 카테고리 -->
						<li class="formRow row">
							<div class="formList">
								<span>카테고리<span class="star">*</span></span>
							</div>			
							
							<div class="formContent">
								<select id="Select1" class="selectpicker" style="height: 30px">
									<option value="야">야</option>
									<option value="되냐?">되나?</option>
								</select>
							</div>
						</li>
						
						<!-- 거래지역 -->
						<li class="formRow row">
							<div class="formList">
								<span>거래지역<span class="star">*</span></span>
							</div>
							
							<div class="formContent titleFlex">
								<div class="locationBtnArea mb-20">
									<button type="button" id="currLocation" class="LBtn btn btn-info">내 위치</button>
									<button type="button" id="currLocation" class="LBtn btn btn-primary">주소 검색</button>
								</div>
								<input type="text" readonly placeholder="선호 거래 지역을 검색해주세요." id="locationInput" class="location">
							</div>
						</li>
						
						<!-- 상태 -->
						<li class="formRow row">
							<div class="formList">
								<span>상태<span class="star">*</span></span>
							</div>

							<div class="formContent">
								<div class="itemStatusArea">
									<input type="radio" name="itemStatus" value="U" class="itemRdio status" id="usedStatus"> <label for="usedStatus">중고</label>
									<input type="radio" name="itemStatus" value="N" class="itemRdio status" id="newStatus"> <label for="newStatus">새상품</label>
								</div>
							</div>
						</li>
						
						<!-- 가격 -->
						<li class="formRow row">
							<div class="formList">
								<span>가격<span class="star">*</span></span>
							</div>

							<div class="formContent">
								<div class="priceArea">
									<input type="text" name="itemPrice" id="itemPrice" class="priceInput" placeholder="숫자만 입력해주세요."> 원
										<span class="errorMsg" id="priceMsg">미친놈아!</span>
									<input type="radio" name="delivery" value="F" class="itemRdio" id="including"> <label for="including">택배비 포함</label>
									<input type="radio" name="delivery" value="N" class="itemRdio" id="noincluding"> <label for="noincluding">택배비 미포함</label>
								</div>
							</div>
						</li>
						
						
						<!-- 설명 -->
						<li class="formRow row">
							<div class="formList">
								<span>설명<span class="star">*</span></span>
							</div>
							
							<div class="formContent titleFlex">
								<textarea rows="6" placeholder="상품 설명을 입력해주세요." class="itemInfoText"></textarea>
								<span class="errorMsg" id="infoTextMsg" style="display: contents;">미친놈아!</span>
									<div class="titleCnt float-right">
									<span id="currCnt">10</span>
									<span id="maxCnt">/ 2000</span>
								</div>
							</div>
						</li>
						
					<!-- 수량 -->
						<li class="formRow row">
							<div class="formList">
								<span>수량<span class="star">*</span></span>
							</div>

							<div class="formContent">
								<div class="priceArea">
									<input type="number" name="itemPrice" id="itemPrice" class="priceInput" value="1"> 개
								</div>
							</div>
						</li>
					</ul>
					</form>
					






				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>

	</script>

</body>
</html>