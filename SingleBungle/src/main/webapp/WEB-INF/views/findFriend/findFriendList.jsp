<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 게시판 목록조회</title>
<style>
	.boardName {
      margin-right: 10px;
    }

	.category {
      text-decoration : none;
      color : black;
      line-height : 54px;
    }

	.pagination {
   justify-content: center;
	}
	
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
	
	.page-item > a, .page-item > a:hover { color: black; }
	
	.pagination.pagination-rounded-flat .page-item { margin: 0 .25rem; }
	
	.pagination-success .page-item.active .page-link {
		background: #00c689;
		border-color: #00c689;
	}
	
	.pagination.pagination-rounded-flat .page-item .page-link {
		border: none;
		border-radius: 50px;
	}
	
	#searchForm {
	   position: relative;
	}
	
	#searchForm>* {
	   top: 0;
	}
	
	#list-table th {
	   text-align: center;
	}
	
	#list-table td:not(:nth-of-type(3)) {
	   text-align: center;
	}
	
	#list-table td{
		text-align: center;
	}
	
	.list-wrapper{
	   min-height: 540px;
	}
	
	#list-table td:hover{
	   cursor : pointer;
	}
	
	/* 세로 가운데 정렬*/
	#list-table td{
	  vertical-align: middle;
	  /* vertical-align : inline, inline-block 요소에만 적용 가능(td는 inline-block)*/
		
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<body>

	<div class="container my-5">
	
				<!-- 게시판 이름/카테고리 -->
      <div class="row py-5">
        <div class="col-lg-12 mx-auto">
          <div class="text-black banner">
            <h1 class="boardName float-left">친구찾기</h1>
            <a class="category" href="#">전체</a> |
            <a class="category" href="#">맛집</a> |
            <a class="category" href="#">문화생활</a> |
            <a class="category" href="#">동네친구</a>

            <div class="listTest float-right">
              <a class="category" href="#">최신순</a> |
              <a class="category" href="#">좋아요순</a>
            </div>
            <hr>
          </div>
        </div>
      </div>
      <!-- End -->
      
         <div class="list-wrapper">
            <table class="table table-hover table-striped my-5" id="list-table">
               <thead>
                  <tr>
                     <th>게시글 번호</th>
                     <th>지역</th>
                     <th>카테고리</th>
                     <th>제목</th>
                     <th>성별</th>
                     <th>모집인원</th>
                     <th>닉네임</th>
                     <th>조회수</th>
                     <th>작성일</th>
                  </tr>
               </thead>
               
               <%-- 게시글 목록 출력 --%>
               <tbody>
                  <c:choose>
                     <c:when test="${empty iList}">
                        <tr>
                           <td colspan="9">작성된 글이 없습니다.</td>
                        </tr>
                     </c:when>
                     
                     <c:otherwise> <%-- 조회된 게시글 목록이 있을 때 --%>
                        <c:forEach var="instr" items="${iList}">
                           <tr>
                           	  <%-- 강사 번호 --%>
                              <td>${instr.enrollmentNo}</td>
                           	  <%-- 강사 번호 --%>
                              <td>${instr.instr}</td>
                              <%-- 이름 --%>
                              <td>${instr.instrName}</td>
                              
                              <%-- 카테고리 --%>
                              <td>
                              
                              <c:choose>
                              	<c:when test="${instr.ctgrCd == 10}">
                              		외국어
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 20}">
                              		스포츠
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 30}">
                              		사진/영상
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 40}">
                              		공예
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 50}">
                              		요리
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 60}">
                              		미술
                              	</c:when>
                              	<c:when test="${instr.ctgrCd == 70}">
                              		음악
                              	</c:when>
                              </c:choose>
                              
                              </td>
                              
                              <%-- 승인 여부 --%>
                              <td>${instr.permitFl}</td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
         </div>

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
   
</body>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>	
	
	</script>
	
</body>
</html>
