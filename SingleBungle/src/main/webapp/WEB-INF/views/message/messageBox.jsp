<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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




</style>


</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-12" style="padding-left : 26px">
				<span>
					<input type="checkbox" id="allCheck">
				</span>
				<div class="messageBox" style="display: inline-block;">
					<a href="#">받은 쪽지</a>
				</div>
				<div class="messageBox" style="display: inline-block;">
					<a href="#">보낸 쪽지</a>
				</div>
				<div class="float-right" id="deleteBtn" style="display: inline-block; margin-top: 10px;">
					<button class="maincolor-re">삭제</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-stripped">
					<tbody>
						<tr>
							<td><input type="checkbox" /></td>
							<td><b>며네</b></td>
							<td><b>훠궈 먹을때만 친구지???</b></td>
							<td><i class="far fa-envelope"></i><b>읽지않음</b></td>
							<td><b>15:20</b></td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>솔쨩</td>
							<td>이미 신고 들어감. ㅈㅅ</td>
							<td><i class="far fa-envelope-open"></i>읽음</td>
							<td>2021-02-22</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>애긔한솔</td>
							<td>누구세요?</td>
							<td><i class="far fa-envelope-open"></i>읽음</td>
							<td>2021-02-22</td>
						</tr>
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
								<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
								<li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
								<li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
								<li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
								<li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
								<li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>