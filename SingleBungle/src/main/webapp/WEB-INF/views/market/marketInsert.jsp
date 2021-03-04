<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 - 판매글 작성</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
	.container{
    min-width: 1080px;
	}
	
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
 		margin-right: 12px;
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
 	margin-top : 5px;
 }
 
 
 #locationInput{
 	width : 100%; 
 	margin-top : 1rem;
 	height : 3rem;
 	padding : 0px 1rem;
 	border : 1px solid rgb(195, 194, 204);
 }

	.custom-control-label{
		width: 80px;
		margin-top: 10px;
	}
	
	.itemInputs{
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
	
	.itemImages{
		display: flex;
		width : 856px;
		flex-wrap:  wrap;
		overflow-x : hidden;
	}
	
	.itemImage{
		margin-bottom : 8px;
		width: 202px;
		height: 202px;
		border: 1px solid rgb(230, 229, 239);
		margin-right: 12px;
		list-style-type: none;
		position : relative;
		display: flex;
	}
	
	.image{
		width: 100%;
		height: 100%;
	}
	
	.deleteBtn{
		width : 1.5rem;
		height : 1.5rem;
		background-position : center center;
		background-repeat : no-repeat;
		background-size : 12px 12px;
		background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTYuODQ4IDZsMy43NzYtMy43NzZhLjYuNiAwIDEgMC0uODQ4LS44NDhMNiA1LjE1IDIuMjI0IDEuMzc2YS42LjYgMCAwIDAtLjg0OC44NDhMNS4xNTIgNiAxLjM3NiA5Ljc3NWEuNi42IDAgMSAwIC44NDguODQ5TDYgNi44NDhsMy43NzYgMy43NzZhLjU5OC41OTggMCAwIDAgMS4wMjQtLjQyNS42LjYgMCAwIDAtLjE3Ni0uNDI0TDYuODQ4IDZ6IiBvcGFjaXR5PSIuNjQiLz4KPC9zdmc+Cg==");
		background-color :  rgba(30, 29, 41, 0.32);
		border-radius: 50%;
		position: absolute;
		top : 0.5rem;
		right : 0.5rem;
		outline : none;
		border: none;
	}

	.sumbitArea{
		width: auto;
	}
	
	#submitBtn{
		width : 20%;
		margin : 40px 0 137px 0;
		outline: none;
		float: right;
	}
	
	.radioM{
		margin-right : 35px;
	}
	
	input:focus, textarea:focus {
		outline : 1px solid black;
	}
	
	input:checked{
		outline : none;
	}
	
	.radioArea{
		padding-top : 17px;
	}
	
	.priceArea label {
		margin-top : 8px;
	}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="px-lg-5">
				
				
					<form action="#" method="GET" >
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
				
					
					<form action="insertAction" method="POST" enctype="multipart/form-data" role="form" onsubmit= "return validate();">
					<ul class="insertForm">
					
					<!-- 이미지 -->
						<li class="formRow row borderTop">
							<div class="formList">
								<span>상품이미지<span class="star">*</span> (<span id="imgCnt">0</span>/10) </span>
							</div>
							
							<div class="formContent">
								<ul class="itemImages">
									<li class="itemImageInsert" id="imgInput">
										<label for="images0" class="imgLabel">
											<span>이미지 등록</span></label>
											<input type="file" id="images0" name="images"  style="display: none;" onchange="LoadImg(this);">
									</li>
									
									
								</ul>
							</div>
						</li>
						
						<!-- 상태 -->
						<li class="formRow row">
							<div class="formList">
								<span>분류<span class="star">*</span></span>
							</div>

							<div class="formContent radioArea">
								<div class="itemStatusArea form-check">
									<input type="radio" name="transactionCategory" value="1" class="itemRadio form-check-input" id="buy" checked> <label for="buy" class="radioM">삽니다</label>
									<input type="radio" name="transactionCategory" value="2" class="itemRadio form-check-input" id="sell"> <label for="sell" class="radioM">팝니다</label>
								</div>
							</div>
						</li>
						
						<!-- 제목 -->
						<li class="formRow row">
							<div class="formList">
								<span>제목<span class="star">*</span></span>
							</div>
							
							<div class="formContent titleFlex">
								<div class="titleArea ">
									<input type="text" placeholder="상품 제목을 입력해주세요." class="titleInput" id="title" name="marketTitle" required maxlength="40" minlength="2" required>
									<button id="cancelBtn" type="button"></button>
									<div class="titleCnt">
									<span id="currCnt">0</span>
									<span id="maxCnt">/ 40</span>
								</div>
								</div>
							</div>
						</li>
						
						
						<!-- 카테고리 -->
						<li class="formRow row">
							<div class="formList">
								<span>카테고리<span class="star">*</span></span>
							</div>			
							
							<div class="formContent">
								<select id="SelectCategory" name="categoryCd" class="form-control div large" style="height: 40px">
									<option value="1">디지털/가전</option>
									<option value="2">가구/인테리어</option>
									<option value="3">유아동/유아도서</option>
									<option value="4">생활/가공식품</option>
									<option value="5">스포츠/레저</option>
									<option value="6">여성패션/잡화</option>
									<option value="7">남성패션/잡화</option>
									<option value="8">게임/취미</option>
									<option value="9">뷰티/미용</option>
									<option value="10">반려동물용품</option>
									<option value="11">도서/티켓/음반</option>
									<option value="12">식물</option>
									<option value="13">기타 중고물품</option>
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
									<button type="button" id="currLocation" class="LBtn btn btn-info" onclick="getLocation();">내 위치</button>
								</div>
								<input type="text" placeholder="선호 거래 지역을 입력해주세요.(시군구)" id="locationInput" name="address" class="location" required>
								<span class="errorMsg" id="locationMsg"></span>
							</div>
						</li>
						
						<!-- 상태 -->
						<li class="formRow row">
							<div class="formList">
								<span>상태<span class="star">*</span></span>
							</div>

							<div class="formContent radioArea">
								<div class="itemStatusArea form-check">
									<input type="radio" name="status" value="U" class="itemRadio form-check-input" id="usedStatus" checked> <label for="usedStatus" class="radioM">중고</label>
									<input type="radio" name="status" value="N" class="itemRadio form-check-input" id="newStatus"> <label for="newStatus" class="radioM">새상품</label>
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
									<input type="text" name="price" id="itemPrice" class="priceInput itemInputs" placeholder="숫자만 입력해주세요." required> 원
										<span class="errorMsg" id="priceMsg"></span>
									<input type="radio" name="deliveryCharge" value="F" class="itemRadio" id="including" checked> <label for="including" class="radioM" >택배비 포함</label>
									<input type="radio" name="deliveryCharge" value="N" class="itemRadio" id="noincluding"> <label for="noincluding" class="radioM">택배비 미포함</label>
								</div>
							</div>
						</li>
						
						
						<!-- 설명 -->
						<li class="formRow row">
							<div class="formList">
								<span>설명<span class="star">*</span></span>
							</div>
							
							<div class="formContent titleFlex">
								<textarea rows="6" name="marketContent" placeholder="상품 설명을 입력해주세요.(최소 5글자)" class="itemInfoText" maxlength="2000" minlength="5" required></textarea>
									<div class="titleCnt float-right">
									<span id="ContentCurrCnt">0</span>
									<span id="ContentMaxCnt">/ 2000</span>
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
									<input type="text" name="itemCount" id="itemCount" class="countInput itemInputs"  required /> 개
									<span class="errorMsg" id="countMsgq"></span>
								</div>
							</div>
						</li>
						</ul>
						<div id="sumbitArea">
								<button id="submitBtn" type="submit" class="btn-lg btn-info">등록하기</button>
						</div>
	
					</form>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	

	<script>
	var imgCnt = 0;
	
	if(imgCnt <= 10) {
		function LoadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);

				reader.onload = function(e) {
					var img = '<li class="itemImage"> <img id="img' + imgCnt + '" class="image" name="test1" src="' + e.target.result + '">' +
						'<button type="button" class="deleteBtn" onclick="deleteImg(this);"></button>' + '</li>';
					$(".itemImages").append(img);
					$("#imgCnt").text(++imgCnt); 
					addImgInput();
				}
			}
		}
	}
	
	function addImgInput(){
		var input = '<label for="images' + imgCnt +'" class="imgLabel">' +
								'<span>이미지 등록</span></label>'+
								'<input type="file" id="images' + imgCnt + '" name="images" style="display:none;" onchange="LoadImg(this);">';
		$(".itemImageInsert label").css("display", "none");
		$('.itemImageInsert').append(input);
	}
	
    function deleteImg(value) {
    		$("#imgCnt").text(--imgCnt);
        $(value).parent().remove();
        $(value).remove();
     }
    
    
    $("#title").on("input", function(){
    	var cnt = $(this).val();
    	$("#currCnt").text(cnt.length);
    	
    	if(cnt.length == 40){
    		$("#currCnt").css("color", "red");
    	}
    });
    
    $("#cancelBtn").on("click", function(){
    	$("#title").val("");
    });
    

    $("#itemPrice").on("input", function(){
    	var regexp = /^[0-9]*$/;

    	if($("#itemPrice").val() < 100) {
    			$("#priceMsg").text("100원 이상 입력해주세요.");
    	} else if(!regexp.test($("#itemPrice").val())){
    		alert("숫자만 입력해주세요.");
    		$("#priceMsg").text("숫자만 입력해주세요.");
    		$("#priceMsg").text("숫자만 입력해주세요.");
    	} else{
    		$("#priceMsg").text("");
    	}
    });

    $(".itemInfoText").on("input", function() {
        var cnt = $(this).val();
        $("#ContentCurrCnt").text(cnt.length);

        if (cnt.length >= 2000) {
           $("#ContentCurrCnt").css("color", "red");
        }
     });
     
     
     $("#itemCount").on("input", function(){
     	var regexp = /^[0-9]*$/;
     	if($("#itemCount").val() <= 0) {
     			$("#countMsgq").text("1개 이상 입력해주세요.");
     	} else if(!regexp.test($("#itemCount").val())){
     		alert("숫자만 입력해주세요.");
     		$("#countMsgq").text("숫자만 입력해주세요.");
     		$("#countMsgq").text("숫자만 입력해주세요.");
     	} else{
     		$("#countMsgq").text("");
     	}
     });
     
     
      function validate(){
        if(imgCnt == 0){
           alert("1장 이상의 사진을 등록해주세요.");
           $("#images").focus();
           return false;
        }
        
        if($("#title").val().trim().length == 0){
           alert("제목을 입력해주세요.");
           $("#title").focus();
           return false;
        }
        
        if($("#locationInput").val().trim().length == 0){
           alert("거래지역을 입력해주세요.");
           $("#locationInput").focus();
           return false;
        }
        
        if($("#itemPrice").val().trim().length == 0){
           alert("가격을 입력해주세요.");
           $("#itemPrice").focus();
           return false;
        }
        
        if($(".itemInfoText").val().trim().length == 0){
           alert("상품 설명을 입력해주세요.");
           $(".itemInfoText").focus();
           return false;
        }
        
        if($("#itemCount").val().trim().length == 0){
           alert("상품 개수를 입력해주세요.");
           $(".itemCount").focus();
           return false;
        }
     }
	
      
	</script>

</body>
</html>