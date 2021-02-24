<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트</title>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>


.boardName {
  margin-right: 40px;
}

.category{
   text-decoration: none;
   color: black;
   line-height : 54px;
}

.likeImg {
  width: 10px;
}

a:link { color: #000; text-decoration: none; }
a:visited { color: #000; }
a:hover{color: gray;}


/*  페이징바 css */
body {
     background-color: #f9f9fa
 }

 .flex {
     -webkit-box-flex: 1;
     -ms-flex: 1 1 auto;
     flex: 1 1 auto
 }

 @media (max-width:991.98px) {
     .padding {
         padding: 1.5rem
     }
 }

 @media (max-width:767.98px) {
     .padding {
         padding: 1rem
     }
 }

 .padding {
     padding: 5rem
 }

 .container {
     margin-top: 100px
 }

 .pagination,
 .jsgrid .jsgrid-pager {
     display: flex;
     padding-left: 0;
     list-style: none;
     border-radius: 0.25rem
 }

 .page-link {
     color: black
 }

 .pagination.pagination-rounded-flat .page-item {
     margin: 0 .25rem
 }

 .pagination.pagination-rounded-flat .page-item .page-link,
 a {
     border: none;
     border-radius: 50px
 }


</style>

<!-- summernote 사용 시 필요한 css 파일 추가 -->
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
 <div class="container">
      <div class="px-lg-5">
    
        <!-- 게시판 이름/카테고리 -->
        <div class="row py-5">
          <div class="col-lg-12 mx-auto">
            <div class="text-black banner">
              <h1 class="boardName float-left">이벤트</h1>
              <a class="category" href="#">공지사항</a> | 
              <a class="category" href="#">이벤트</a> 
            </div>
            <hr>
        </div>
    </div>




        <!-- End -->
    
        <div class="row">
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294929/matthew-hamilton-351641-unsplash_zmvozs.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">신규 회원 이벤트</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
                  

                
                
                
              </div>
            </div>
          </div>
          <!-- End -->
    
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294927/cody-davis-253928-unsplash_vfcdcl.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">Blorange</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End -->
    
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294928/nicole-honeywill-546848-unsplash_ymprvp.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">And She Realized</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End -->
    
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294927/dose-juice-1184444-unsplash_bmbutn.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">DOSE Juice</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End -->
    
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294926/cody-davis-253925-unsplash_hsetv7.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">Pineapple</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End -->
    
          <!-- Gallery item -->
          <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
            <div class="bg-white rounded shadow-sm"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556294928/tim-foster-734470-unsplash_xqde00.jpg" alt="" class="img-fluid card-img-top">
              <div class="p-4">
                <h5> <a href="#" class="text-dark">Yellow banana</a></h5>
                <div class="categoryDetail">
                    <p class="small text-muted mb-0">2021-02-20</p>
                </div>
                <div class="categoryDetail">
                  <p class="small text-muted mb-0">조회수 : 0</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End -->
    
      </div>
      
      <div class="padding">
        <div class="container d-flex justify-content-center">
            <div class="col-md-4 col-sm-6 grid-margin stretch-card">
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

            </div>
        </div>
    </div>


      </div>

      
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>