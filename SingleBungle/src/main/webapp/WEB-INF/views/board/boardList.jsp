<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 자유게시판 메인 페이지
<%-- 	<c:choose>
		<c:when test="${pInfo.boardType == 1}">자유게시판</c:when>
		<c:when test="${pInfo.boardType == 2}">정보게시판</c:when>
	</c:choose> --%>
</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>

.board-category, .ml-auto { margin: 20px; }

.boardName { margin-right: 40px; }

.category, .category:hover, .array, .array:hover {
	text-decoration: none;
	color: black;
	line-height : 54px;
}

/* 검색창 */
.search { 
	text-align: center; 
	margin-top : 50px;
	margin-bottom: 100px;
}

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

.container { margin-top: 100px; }

.pagination, .jsgrid .jsgrid-pager {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem;
}

.page-link { color: black; }

.pagination.pagination-rounded-flat .page-item { margin: 0 .25rem; }

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689;
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
}

/* */
.board-category:after { 
	content: ""; 
	dispaly: table; 
	clear: both;
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
              <div class="d-flex">
                <div class="board-category">
                  <h1 class="boardName float-left">자유게시판</h1> 
                  <a class="category" href="#">전체</a> | 
                  <a class="category" href="#">여행</a> | 
                  <a class="category" href="#">영화</a> | 
                  <a class="category" href="#">일상</a> | 
                  <a class="category" href="#">경제</a> | 
                  <a class="category" href="#">반려동물</a> | 
                  <a class="category" href="#">요리레시피</a>
                </div>
                <div class="ml-auto">
                  <a class="array" href="#">최신순</a> | 
                  <a class="array" href="#">좋아요순</a>
                </div>
              </div>

                <table class="table table-striped table-sm">
                    <thead>
                      <tr>
                        <th scope="col">글번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">♡</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>제목1</td>
                        <td>작성자1</td>
                        <td>2020.02.19</td>
                        <td>100</td>
                        <td>10</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>제목2</td>
                        <td>작성자2</td>
                        <td>2020.02.19</td>
                        <td>100</td>
                        <td>10</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>제목3</td>
                        <td>작성자3</td>
                        <td>2020.02.19</td>
                        <td>100</td>
                        <td>10</td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="text-right"><button type="button" class="btn btn-success">글쓰기</button></div>
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
                  <div class="search">
                    <form action="#" method="GET">
                    <select name="sk" id="searchOption" style="width:100px; height:36px; display:inline-block;">
                      <option value="title">제목</option>
                      <option value="writer">작성자</option>
                      <option value="titcont">제목+내용</option>
                      <option value="category">카테고리</option>
                    </select>
                    <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                    <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
                    </form>
                  </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>