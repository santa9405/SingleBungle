<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 - 메인</title>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

  <style>
    body {
      background: #f4f4f4;
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


    .priceArea {
      clear: both;
    }

    .row_2 {
      margin-bottom: 20px;
    }

    .writeBtn, .writeBtn:hover {
      text-decoration: none;
      color: white;
    }
    
    .text-dark {
  display:block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

	.boardTitleBorder{
    border-bottom: gray 1px solid;
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

    /*  페이징바 css */
    /* 페이징바 */

    .flex {
      -webkit-box-flex: 1;
      -ms-flex: 1 1 auto;
      flex: 1 1 auto;
    }


    @media (max-width:991.98px) {
      .padding {
        padding: 1.5rem;
      }
    }

    @media (max-width:767.98px) {
      .padding {
        padding: 1rem;
      }
    }

    .container {
      margin-top: 100px;
    }

    .pagination,
    .jsgrid .jsgrid-pager {
      display: flex;
      padding-left: 0;
      list-style: none;
      border-radius: 0.25rem;
    }

    .page-link {
      color: black;
    }

    .pagination.pagination-rounded-flat .page-item {
      margin: 0 .25rem;
    }

    .pagination-success .page-item.active .page-link {
      background: #00c689;
      border-color: #00c689;
    }

    .pagination.pagination-rounded-flat .page-item .page-link {
      border: none;
      border-radius: 50px;
    }
    
    
  </style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
  <div class="container">
    <div class="px-lg-5">

      <!-- 게시판 이름/카테고리 -->
      <div class="row py-5">
        <div class="col-lg-12 mx-auto boardTitleBorder">
          <div class="text-black rounded banner">
            <h1 class="boardName float-left">사고팔고</h1>
            <a class="category" href="#">전체</a> |
            <a class="category" href="#">팝니다</a> |
            <a class="category" href="#">삽니다</a>

            <div class="listTest float-right">
              <a class="category" href="#">최신순</a> |
              <a class="category" href="#">좋아요순</a>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->


      <div class="row">

        <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item" style="opacity: 0.5;">
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
        <!-- End -->
        
                <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item">
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
                <div class="badge badge-danger px-3 rounded-pill font-weight-normal">예약중</div>
              </div>
            </div>
          </div>
        </div>
        <!-- End -->
        
        
        
                <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item">
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
        <!-- End -->
        
        
                <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item" >
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
        <!-- End -->
        
        
                <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item" >
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
        <!-- End -->
        
        
                <!-- Gallery item -->
        <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
          <div class="bg-white rounded shadow-sm">
            <div class="embed-responsive embed-responsive-4by3" >
              <img src="${contextPath}/resources/images/testImg.gif" alt="" class="img-fluid card-img-top embed-responsive-item">
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
        <!-- End -->
        









      </div>

      
      <button type="button" class="btn btn-info float-right"><a href="#" class="writeBtn">글쓰기</a></button>


      <nav>
        <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
          <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a></li>
          <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
          <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
          <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
          <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
          <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a></li>
        </ul>
      </nav>


      
      <div class="row">
        <div class="col-md-12">
          <div class="search">
            <form action="#" method="GET">
            <select  name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
              <option value="title">제목</option>
              <option value="writer">작성자</option>
              <option value="titcont">제목+내용</option>
                <option value="category">카테고리</option>
            </select>
            <input type="text" name="sv" class="form-control " style="width: 25%; display: inline-block;">
            <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
            </form>
          </div>
        </div>
      </div>




    </div>


  </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>