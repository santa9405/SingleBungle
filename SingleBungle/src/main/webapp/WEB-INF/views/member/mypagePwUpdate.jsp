<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 수정</title>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	/* 굵기 지정(100, 300, 400, 500, 700) */
	font-size: 16px;
	color: #212529;
	margin: 0;
}

a {
	color: #212529;
}

a:hover {
	text-decoration: none;
}

.agree {
	border: 1px solid #ced4da;
	padding: 15px;
}

/* email */
.email-1 {
	padding-right: 0px;
}

.email-2 {
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}

.email-3 {
	padding-left: 0px;
}

/* 동네 인증 */
.town-1 {
	padding-left: 0px;
	padding-right: 0px;
}

.town-area-1 {
	float: left;
	padding-left: 0px;
	padding-right: 0px;
}

.town-area-2 {
	float: right;
	padding-right: 0px;
}
</style>

</head>

<body>
	<div class="container mt-5 pt-5">
		<div class="row">

			<jsp:include page="sideMenu.jsp" />
			
			
			<!-- 관리자 마이페이지는 9였음, , , ,   -->
			<div class="col-sm-4">

				<div class="text-center">

					<h3>비밀번호 수정</h3>

					<hr>
				</div>



				<form>
					<div class="form-group">
						<label for="pw">* 현재 비밀번호</label> <input type="password" class="form-control" id="nickname" placeholder="현재 비밀번호를 입력하세요.">
					</div>
					<div class="form-group">
						<label for="newPw1">* 새 비밀번호</label> <input type="password" class="form-control" id="nickname" placeholder="새로운 비밀번호를 입력하세요.">
					</div>
					<div class="form-group">
						<label for="newPw2">* 새 비밀번호 확인</label> <input type="password" class="form-control" id="nickname" placeholder="새로운 비밀번호를 한번 더 입력하세요.">
					</div>

					<br>
					<hr>
					<br>

					<button type="submit" class="btn btn-block maincolor">비밀번호 수정</button>

					<br>
					<br>
					<br>
					<br>
					<br>
					<br>

				</form>
			</div>

		</div>

		<div class="col-md-4"></div>
	</div>
	
	<jsp:include page="../common/header.jsp"/>
</body>

 <script>
 	/* 내가 선택한 메뉴에 색 고정하기 */
    $(function(){
			$("#mypagePwUpdate").attr('class','nav-link px-4 active text-white shadow-sm rounded-pill maincolor');
	});
</script>

</html>