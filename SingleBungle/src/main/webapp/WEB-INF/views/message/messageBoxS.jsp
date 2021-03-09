<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<style>
.messageBox {
	width: 100px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}


/* 검색창 */
.search {
	text-align: center;
}

/******* 페이징 *******/
.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

#page-content {
	margin-top: 20px;
}

.pagination, .jsgrid .jsgrid-pager {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem
}

.page-item > a, .page-item > a:hover { color: black; }

.pagination.pagination-rounded-flat .page-item {
	margin: 0 .25rem
}

.pagination-success .page-item.active .page-link {
	background: #00c689;
	border-color: #00c689
}

.pagination.pagination-rounded-flat .page-item .page-link {
	border: none;
	border-radius: 50px;
}

.messageBox{
	border-radius : 15px;
	margin : 0 0 10px 20px;
}




#messageTable td:hover {
	cursor: pointer;
}

</style>


</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-12" style="padding-left : 26px">

				<div class="messageBox" style="display: inline-block; color: #ffaf18;	border:1px solid #ffaf18; ">
					<a href="#">받은 쪽지</a>
				</div>
				<div class="messageBox" style="display: inline-block; background-color :#ffaf18 ; ">
					<span>보낸 쪽지</span>
				</div>
				<div class="float-right" id="deleteBtn" style="display: inline-block; margin-top: 10px;">
					<button class="maincolor-re">삭제</button>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class="table table-stripped" id="messageTable" style="text-align : center;" >
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>받는 사람</th>
							<th>내용</th>
							<th>보낸 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty mList }">
							<tr>
								<td colspan="4"> 보낸 쪽지가 없습니다.</td>
							</tr>
						</c:if>
						
						<c:if test="${!empty mList }">
							<c:forEach var="message" items="${mList}" varStatus="vs">
								<tr>
									<td><input class="checkbox"  type="checkbox" name="checkbox" value="${message.messageNo }"></td>
									<td>${message.receiveNickName}</td>
									<td>${message.messageContent}</td>
									<td>
									<%-- 날짜 출력 모양 지정 --%>
									<fmt:formatDate var="createDate" value="${message.createDt }" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
									<c:choose>
										<c:when test="${createDate != now}">
											${createDate }
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${message.createDt }" pattern="HH:mm"/>
										</c:otherwise>
									</c:choose>									
									</td>
									<td><input type="hidden" value="${message.messageNo }"></td>
								</tr>							
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		
		
				<!-- 페이징 -->
		<div class="page-content page-container" id="page-content">
			<div class="padding">
				<div class="row container d-flex justify-content-center">
					<div class="col-md-4 col-sm-6 grid-margin stretch-card">
						<nav>
							<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
								<c:url var="pageUrl" value="?"/>
								<c:set var="firstPage" value="${pageUrl}cp=1" />
								<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage }" />

								<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
								<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


								<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
								<c:set var="nextPage" value="${pageUrl}cp=${next}" />

								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li class="page-item"><a class="page-link maincolor-re1" href="${firstPage }" data-abc="true"><i class="fas fa-angle-double-left"></i></a></li>
									<li class="page-item"><a class="page-link maincolor-re1" href="${prevPage }" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
								</c:if>

								<c:forEach var="page" begin="${pInfo.startPage }" end="${pInfo.endPage }">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li class="page-item active">
												<a class="page-link">${page}</a> <!-- 같은 페이지일때는 클릭이 안 된다.  -->
											</li>
										</c:when>

										<c:otherwise>
											<li class="page-item">
												<a class="page-link maincolor-re1" href="${pageUrl}cp=${page}">${page}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${next <=pInfo.maxPage }">
										<li class="page-item"><a class="page-link maincolor-re1" href="${nextPage }" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
										<li class="page-item"><a class="page-link maincolor-re1" href="${lastPage }" data-abc="true"><i class="fas fa-angle-double-right"></i></a></li>
								</c:if>
								

							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 쪽지 읽기  -->		
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<button class="btn" data-toggle="modal" data-backdrop="static" data-target="#readMessage" >쪽지 읽기</button>
</div>


<div id="readMessage" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">받는사람 : ${review.memberNo}</h5>	
			</div>
			<div class="modal-body">
				<div class="messageArea" style="border: 1px solid black;height: 150px;"></div>
			</div>
			<div class="modal-footer" >
                
                <div class="col"><button type="button" class="btn btn-reset btn-block" data-dismiss="modal"><span class="plan">닫기</span></button></div>
			</div>
		</div>
	</div>
</div>
<!-- 쪽지 읽기 -->		
	
	
		<jsp:include page="../common/footer.jsp" />
		
		<script>
		
		
			$("#messageTable td").on("click",function()){
				
				var messageNo = $(this).parent.children().eq(4).children().val();
				
				console.log(messageNo);
				
				
				href = "#readMessage";
				
			}
			
			
			// 체크박스 전체선택
			$("#checkAll").on("change", function() {
				if($(this).prop("checked")){
					$(".checkbox").prop("checked", true);
				}
				else {
					$(".checkbox").prop("checked", false);
				}
			});
		
		</script>

</body>
</html>