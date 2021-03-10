<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1아이디 찾기</title>

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

/* -------------------------------------------------------------- */

/* 버튼 */
.maincolor {
	color: #ffffff !important;
	background-color: #ffaf18 !important;
	border: 1px solid #ffaf18 !important;
}

.maincolor:hover {
	color: #ffffff !important;
	background-color: #ff8500 !important;
	border: 1px solid #ffc823 !important;
}

/* 버튼 반대로 */
.maincolor-re {
	color: #ff8500 !important;
	background-color: #ffffff !important;
	border: 1px solid #ffaf18 !important;
}

.maincolor-re:hover {
	color: #ffffff !important;
	background-color: #ff8500 !important;
	border: 1px solid #ffc823 !important;
}

/* a태그 폰트 */
.maincolor-font {
	color: #ffaf18;
}

.maincolor-font:hover {
	color: #ff8500;
}

.maincolor-font-bk {
	color: #212529;
}

.maincolor-font-bk:hover {
	color: #ff8500;
}

/* 별표 주황색 */
.requiredInput {
	color: #ff8500;
}

/* -------------------------------------------------------------- */
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

#idpw-area {
	width: 100%;
}

#id-area {
	width: 50%;
}

#pw-area {
	width: 50%;
}

/* ------------------------------------------- */
#name-group {
	clear: both;
}

/* 이메일 ---------------------------------------------------------------------- */
.em {
	box-sizing: content-box;
	width: 45%;
	padding-right: 2%;
}

.emg {
	box-sizing: content-box;
	width: 6%;
	padding-right: 2%;
	text-align: center;
}

.em-end {
	padding-right: 0;
}
</style>

</head>

<body>



	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>

			<div class="col-md-4">


				<h3 class="text-center">로고,,ㄱ-</h3>
				<br> <br>


				<h3 class="text-center">아이디 찾기</h3>
				<br>

				<div class="form-row" id="idpw-area">
					<div class="form-group col-md-6" id="id-area">
						<a href="${contextPath}/member/findIdForm">
							<button type="button" class="btn btn-primary btn-block maincolor-re">아이디 찾기</button>
						</a>
					</div>
					<div class="form-group col-md-6" id="pw-area">
						<a href="${contextPath}/member/findPwForm">
							<button type="button" class="btn btn-outline-primary btn-block maincolor-re">비밀번호 찾기</button>
						</a>
					</div>
				</div>
				<hr>

				<br>
				<form action="findIdResultForm" method="post" name="">
					<div class="form-group" id="name-group">
						<label for="name"><span class="requiredInput">*</span> 이름</label> <input type="text" class="form-control" name="memberName" id="name" placeholder="이름을 입력하세요.">
					</div>

					<div class="form-group">
						<label for="email"><span class="requiredInput">*</span> 이메일</label>
						<div class="input-group">
							<div class="em email-1">
								<input type="text" class="form-control email" id="email1" name="memberEmail" placeholder="이메일" required>
							</div>

							<div class="emg email-2">@</div>
							<div class="em email-3 em-end">
								<select class="form-control email" id="email2" name="email2">
									<option id="mailSelect">이메일 선택</option>
									<option>naver.com</option>
									<option>daum.com</option>
									<option>hanmail.com</option>
									<option>gmail.com</option>
									<option>nate.com</option>
								</select>
							</div>
							<div>
								<!-- 이름, 이메일 일치 검사 -->
								<span id="nameMailCheck"></span>
							</div>
						</div>

						<br>

						<!--  -->
						<div class="form-row">
							<div class="col-md-5 verifyBtn">
								<button type="button" class="btn btn-primary form-control maincolor" id="sendMailBtn" name="sendMailBtn">인증번호 전송</button>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control email" id="verifyEmail" placeholder="인증번호 입력" required>
							</div>
							<!-- 인증 확인 체크 -->
							<div id="checkFl">
								<span id="checkKey">&nbsp;</span>
							</div>
						</div>
					</div>


					<hr>
					<button type="submit" class="btn btn-block maincolor" id="nextBtn">다음</button>
				</form>
			</div>

		</div>

		<div class="col-md-4"></div>
	</div>

	<jsp:include page="../common/header.jsp" />

<script>
	

// ajax를 이용한 실시간 이름-이메일 일치 검사 ----------------------------------------------------

// ----------------메일 인증 AJAX(잔산) -------------------------
var key;

$("#sendMailBtn").click(function() {// 메일 입력 유효성 검사
	var name = $("#name").val();
	var mail = $("#email1").val() + "@" + $("#email2").val(); //사용자의 이메일 입력값. 
	var mailId =$("#email1").val(); // 이메일 아이디
	var mailSelect =$("#email2").val(); // 이메일 뒷주소
	
	//console.log("mailId : " + mail);
	//console.log("mail : " + mail);
	//console.log("mailSelect : " + mailSelect);
	
	if (mailId == "" || mailSelect =="이메일 선택") { // 아이디 또는 메일 주소가 입력되지 않았다면
		alert("메일 주소가 입력되지 않았습니다.");
	} else if (name == "") {
		alert("이름이 입력되지 않았습니다.");
	} else {
		$.ajax({ // 아이디-이메일 일치 검사
			type : 'post',
			url : 'nameMailCheck',
			data : {
				'name' : name,
				'mail' : mail
			},
			success : function(result) {
				if (result == 1) { // 아이디-이메일이 같을 경우
					// 아이디 찾기 이메일 발송
					$.ajax({
						type : 'post',
						url : 'FindIdMail',
						data : {
							mail:mail
							},
						success : function(result){
							key = result;
							alert("인증번호가 전송되었습니다.");
						}
					});
				} else { // 아이디-이메일이 틀릴 경우
					swal({
						icon : "error",
						title : "아이디와 비밀번호가 일치하지 않습니다.."
					});
				}
			},
			error : function() {
				console.log("이름, 메일 일치검사 실패");
			}
		});
	}
});

/* 이메일-인증번호 일치 검사 */
$("#verifyEmail").on("propertychange change keyup paste input", function() {
	if ($("#verifyEmail").val() == key) { //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
		$("#checkKey").text("인증 성공!").css("color", "green");
		$("#verifyEmail").css("border", "1px solid #5fcf80");
		isCertification = true; //인증 성공여부 check
	} else {
		$("#checkKey").text("불일치!").css("color", "red");
		$("#verifyEmail").css("border", "1px solid red");
		isCertification = false; //인증 실패
	}
});


/* $("#sendMailBtn").on("click", function() {
	var name = $("#name").val();
	var mail = $("#email1").val() + "@" + $("#email2").val(); //사용자의 이메일 입력값. 
	var mailId =$("#email1").val();
	console.log(name);
	console.log(mail);

	if (mailId == "") {
		alert("메일 주소가 입력되지 않았습니다.");
	} else if (name == "") {
		alert("이름이 입력되지 않았습니다.");
	}

	  else {
		$.ajax({
			type : 'post',
			url : 'nameEmailCheck', // 이름, 이메일 일치 검사
			data : {
				'name' : name,
				'mail' : mail
			},
			success : function(result) {

				console.log(result);
				if (result == 1) {
					swal({
						icon : "success",
						title : "확인"
					});
				} else {
					swal({
						icon : "error",
						title : "일치하지 않습니다.."
					});
				}
			},
			error : function() {
				console.log("이름, 메일 일치검사 실패");
			}
		});
	}
}); */


$("#nextBtn").click(function memberJoinvalidate() {
	if (isCertification == false) {
		alert("메일 인증이 완료되지 않았습니다.");
		return false;
	}
});

/* ---------------------------------- */
</script>

</body>

</html>