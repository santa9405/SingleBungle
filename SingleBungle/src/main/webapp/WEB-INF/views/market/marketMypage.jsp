<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 한줄평 남기기</title>


  <!--  Styles  -->
  <link rel="stylesheet" href="styles/index.processed.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
  	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  	
  	
  <style>
      /* main-header start */

#mainMenu li > a {
  font-size: 20px;
  letter-spacing: 1px;
  color: black;
  font-weight: 400;
  position: relative;
  z-index: 1;
  text-decoration: none;
}


#mainMenu li:not(:last-of-type) {
  margin-right: 10px;
}

#mainMenu li > a::before {
  position: absolute;
  content: "";
  width: calc(100% - 1px);
  height: 1px;
  background: black;
  bottom: -6px;
  left: 0;

  -webkit-transform: scale(0, 1);
  -ms-transform: scale(0, 1);
  transform: scale(0, 1);
  -webkit-transform-origin: right center;
  -ms-transform-origin: right center;
  transform-origin: right center;
  z-index: -1;

  -webkit-transition: transform 0.5s ease;
  transition: transform 0.5s ease;
}

#mainMenu li > a:hover::before,
#mainMenu li > a.active::before {
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  transform: scale(1, 1);
  -webkit-transform-origin: left center;
  -ms-transform-origin: left center;
  transform-origin: left center;
}

.main-header.fixed-nav #mainMenu li > a::before {
  background: #000;
}

.main-header {
  top: 25px;
  left: 0;
  z-index: 99;
  width: 100%;
  -webkit-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.main-header.fixed-nav {
  top: 0;
  background: black;
  -webkit-box-shadow: 0 8px 12px -8px rgba(0, 0, 0, 0.09);
  box-shadow: 0 8px 12px -8px rgba(0, 0, 0, 0.09);
  -webkit-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.main-header.fixed-nav .navbar-brand > img:last-of-type {
  display: block;
}

.main-header.fixed-nav .navbar-brand > img:first-of-type {
  display: none;
}
.navbar-brand {
   display: none;
  color: black;
}
.main-header .navbar-brand img {
  max-width: 40px;
  animation: fadeInLeft 0.4s both 0.4s;
}
/* main-header end */
@media (max-width: 991px) {
  /*header starts*/

  .collapse.in {
    display: block !important;
    padding: 0;
    clear: both;
  }

  .navbar-toggler {
    margin: 0;
    padding: 0;
    width: 40px;
    height: 40px;
    position: absolute;
    top: 25px;
    right: 0;
    border: none;
    border-radius: 0;
    outline: none !important;
  }

  .main-header .navbar {
    float: none;
    width: 100%;
    padding-left: 0;
    padding-right: 0;
    text-align: center;
  }

  .main-header .navbar-nav {
    margin-top: 70px;
  }

  .main-header .navbar-nav li .nav-link {
    text-align: center;
    padding: 20px 15px;
    border-radius: 0px;
  }

  /**/
  .main-header .navbar-toggler .icon-bar {
    background-color: black;
    margin: 0 auto 6px;
    border-radius: 0;
    width: 30px;
    height: 3px;
    position: absolute;
    right: 0;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
  }

  .main-header .navbar .navbar-toggler .icon-bar:first-child {
    margin-top: 3px;
  }

  .main-header .navbar-toggler .icon-bar-1 {
    width: 10px;
    top: 0px;
  }

  .main-header .navbar-toggler .icon-bar-2 {
    width: 16px;
    top: 12px;
  }

  .main-header .navbar-toggler .icon-bar-3 {
    width: 20px;
    top: 21px;
  }

  .main-header .current .icon-bar {
    margin-bottom: 5px;
    border-radius: 0;
    display: block;
  }

  .main-header .current .icon-bar-1 {
    width: 18px;
  }

  .main-header .current .icon-bar-2 {
    width: 30px;
  }

  .main-header .current .icon-bar-3 {
    width: 10px;
  }

  .main-header .navbar-toggler:hover .icon-bar {
    background-color: black;
  }

  .main-header .navbar-toggler:focus .icon-bar {
    background-color: black;
  }

  /*header ends*/
}



.reviewContentArea{
	margin : 20px 0px;
	white-space: pre-wrap;
	line-height: 1.5;
	padding : 0;
	border : 0;
	vertical-align: baseline;
	text-align: left;
}

.marketViewGo{
	margin : 10px 0px;
	color : rgb(33, 33, 33);
	text-decoration: none;
	cursor : pointer;
	background-color: transparent;
}

.marketViewBtn{
	padding : 0px 10px;
	height: 30px;
	border : 1px solid rgb(238, 238, 238);
	display: flex;
	align-items : center;
	justify-content : center;
	font-size : 13px;
	background  : rgb(255, 255, 255);
	color : rgb(102, 102, 102);
}

.navbar-nav a {
	cursor: pointer;
}

.navbar-nav span {
	font-size: 20px;
	font-weight: initial;
}

.spec{
	float : left;
}



  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
							<div class="col-md-2">
				</div>
				<div class="col-md-8">
					 <header class="main-header">
    <div class="container">
      <nav class="navbar navbar-expand-lg main-nav px-0">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar icon-bar-1"></span>
                        <span class="icon-bar icon-bar-2"></span>
                        <span class="icon-bar icon-bar-3"></span>
                    </button>
        <div class="m-auto" id="mainMenu">
          <ul class="navbar-nav ml-auto text-uppercase f1">
          	 <li>
              <span>${nickname} 님의</span>
            </li>
            <li>
              <a >판매 내역</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <!-- /.container -->
  </header>
					
					<c:if test="${empty mList}">존재하는 게시글이 없습니다!</c:if>
					<c:if test="${!empty mList}">
						<c:forEach var="market" items="${mList}" varStatus="vs">
					<div class="row text-center">
					<div class="col-md-6" style="width: 30%; float:none; margin:0 auto">
					<div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded view">
                        <div class="d-flex flex-row ">
                        <span class="viewMarketNo" style='visibility: hidden;'>${market.marketNo}</span>
                        <c:forEach items="${thList}" var="th">
                        <c:if test="${ th.parentMarketNo == market.marketNo}">
                        <img class="rounded" src="${contextPath}/${th.filePath}/${th.fileName}"  width="70" >
                        </c:if>
                        </c:forEach>
                            <div class="ml-2"><span class="font-weight-bold d-block">${market.marketTitle}</span>
                            <span class="spec"><fmt:formatNumber value="${market.price}" pattern="###,###,###,###"/>원</span></div>
                        </div>
                    </div>
                    <hr>
         <!--            <div class="btnArea">
                        <button type="button" id="reportBtn" class="reviewBtn btn btn-secondary btn-lg btn-block" data-toggle="modal" data-target="#exampleModal">후기 남기기</button>
                    </div> -->
                    </div>
                    
  
                    
           </div>
           </c:forEach>
           </c:if>
           
           
                    
                    
    <%--       <div class="row">
					<div class="col-md-8" style="width: 30%; float:none; margin:0 auto">
					<hr>
         	<div class="reviewArea">
						<div class="reviewerArea">
							<a href="#" class="reviewerNickname">인간자바</a>
							<span class="createDt">2021.02.12</span>
						</div>
						<div class="star">
							<img src="${contextPath}/resources/images/star.png" width="16">
							<img src="${contextPath}/resources/images/star.png" width="16">
							<img src="${contextPath}/resources/images/star.png" width="16">
						</div>
						<div class="marketView">
							<a href="#" class="marketViewGo">
								<button class="marketViewBtn" width="6" height="10">3일 사용한 안마기 팝니다.</button> 
							</a>
						</div>
						
						
						<div class="reviewContentArea">3일 사용이라 했는데 더 사용하신 것 같아요;;</div>
						
						</div>
						<hr>
						</div>
						
					</div>    --%>
            
							                  <div class="padding">
				<c:set var="firstPage" value="?cp=1" />
				<c:set var="lastPage" value="?cp=${mpInfo.maxPage}" />

				<fmt:parseNumber var="c1" value="${(mpInfo.currentPage - 1) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
				<c:set var="prevPage" value="?cp=${prev}" />


				<fmt:parseNumber var="c2" value="${(mpInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="?cp=${next}" />



				<div class="container d-flex justify-content-center">
					<div class="col-md-4 col-sm-6 grid-margin stretch-card">
						<nav>
							<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">

								<c:if test="${mpInfo.currentPage > mpInfo.pageSize}">
									<li class="page-item"><a class="page-link" href="${firstPage }" data-abc="true">&laquo;</a></li>
									<li class="page-item"><a class="page-link" href="${prevPage }" data-abc="true">&lt;</a></li>
								</c:if>


								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${mpInfo.startPage}" end="${mpInfo.endPage}">
									<c:choose>
										<c:when test="${mpInfo.currentPage == page }">
											<li class="page-item active"><a class="page-link" data-abc="true">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><a class="page-link" href="?cp=${page}" data-abc="true">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${next <= mpInfo.maxPage}">
									<li class="page-item"><a class="page-link" href="${nextPage }" data-abc="true">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="${lastPage }" data-abc="true">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>

					</div>
				</div>
			</div>
				</div>
				
				
								<div class="col-md-2">
								
				</div>
			</div>
	
		</div>
		
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>

	
	
	
	





  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <!-- Scripts -->
  <script src="scripts/index.js"></script>
  
  <script>
	
  $(".view").on("click", function(){
	  location.href = "../" + ${market.marketNo};
  });
  </script>
</body>
</html>