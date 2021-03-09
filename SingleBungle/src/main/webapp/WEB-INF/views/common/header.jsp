<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>Spring Project</title>
	
	
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
	
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
   
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
		<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   	<style>
   	* {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		/* 굵기 지정(100, 300, 400, 500, 700) */
		font-size: 16px;
		color: #212529;
		margin: 0;
	}
	
	button:focus {
	border : none;
	outline : none;
}
	
	a {
        color: #212529;
    }

    a:hover {
    	text-decoration: none;
    }
		
	/* 메인 색(주황)--------------------------------------- */
    /* 버튼(기본) : 주황 바탕, 흰 글씨 */
    .maincolor{
        color: #ffffff !important; 
        background-color:#ffaf18 !important;
        border: 1px solid #ffaf18 !important;
    }
    .maincolor:hover{
        color: #ffffff !important; 
        background-color:#ff8500 !important;
        border: 1px solid #ffc823 !important;
    }

    /* 버튼 반대로 : 흰 바탕, 주황 테두리 */
    .maincolor-re{
            color: #ff8500 !important;
            background-color: #ffffff !important;
            border: 1px solid #ffaf18 !important;
    }
    .maincolor-re:hover{
        color: #ffffff !important; 
        background-color:#ff8500 !important;
        border: 1px solid #ffc823 !important;
    }

    /* 폰트 : 주황색, 호버시 더찐한 주황색 */
    .maincolor-font{
        color:#ffaf18;
    }
    .maincolor-font:hover{
        color:#ff8500;
    }
	
	/* 폰트 : 검정글씨, 호버시 주황색 */
    .maincolor-font-bk{
        color:#212529;
    }
    .maincolor-font-bk:hover{
        color:#ff8500;
    }

    /* 별표 주황색 */
    .requiredInput{ color : #ff8500; }
    /* 메인 색(주황)--------------------------------------- */
    
    /* 세컨드 (파랑)--------------------------------------- */
    /* 
      700: #007bff
      600: #008fff
      500: #009eff
    */
    /* 세컨드 (파랑)--------------------------------------- */
	
   	</style>
   	
</head>
<body id="page-top">

	<c:if test="${!empty swalTitle}">
		<script>
			swal({icon : "${swalIcon}",
				 title : "${swalTitle}",
				 text : "${swalText}"});
		</script>
	</c:if>
	
	<%-- ---------------------- 로그인(임시) ---------------------- --%>
	<c:choose>
		<%-- 로그인이 되어있지 않은 경우 --%>
		<c:when test="${empty sessionScope.loginMember }">
     		<a class="nav-link" href="${contextPath}/member/login">Login</a>
		</c:when>
		
		<c:when test="${loginMember.memberGrade == 'G'}">
     		<a class="nav-link" href="${contextPath}/admin/adminMypage" style="display:inline">${loginMember.memberName}</a>
	      	<a class="nav-link" href="${contextPath}/member/logout">Logout</a>
		</c:when>
		
		<%-- 로그인이 되어있는 경우 --%>
		<c:otherwise>
			${loginMember.memberGrade} 등급
			<br>
			
	      	<a class="nav-link" href="${contextPath}/member/mypage" style="display:inline">${loginMember.memberName}</a>
	      	<a class="nav-link" href="${contextPath}/member/logout">Logout</a>
		</c:otherwise>
	</c:choose>
	
	~(˘▾˘~)(~˘▾˘)~ ~(˘▾˘~)(~˘▾˘)~ ~(˘▾˘~)(~˘▾˘)~
	<br>
	<%-- ---------------------- 로그인(임시) ---------------------- --%>
	
	
	<a class="nav-link" href="${contextPath}/findFriend/insert">친구찾기 게시글 작성</a>
	<a class="nav-link" href="${contextPath}/findFriend/list">친구찾기 목록 조회</a>
	
	<a class="nav-link" href="${contextPath}/board/list" style="color:navy;">자유게시판 목록 조회</a>
	
	<a class="nav-link" href="${contextPath}/cafe/list" style="color:hotpink;">맛집게시판 목록 조회</a>
	
	<a class="nav-link" href="${contextPath}/market/list" style="color:orange;">사고팔고 목록 조회</a>
	<a class="nav-link" href="${contextPath}/market/mypage" style="color:orange;">사고팔고 마이페이지</a>
	<a class="nav-link" href="${contextPath}/market/modal" style="color:orange;">사고팔고 모달</a>


	<a class="nav-link" href="${contextPath}/review/list" style="color:green;">후기게시판 목록 조회</a>
	<a class="nav-link" href="${contextPath}/message/messageBoxS" style="color:green;">보낸쪽지함(임시)</a>
	<a class="nav-link" href="${contextPath}/message/messageBoxR" style="color:green;">받은쪽지함(임시)</a>
	
	<a class="nav-link" href="${contextPath}/admin/eventList" style="color:pink;">이벤트 게시판</a>
	<a class="nav-link" href="${contextPath}/admin/noticeList" style="color:pink;">공지사항 게시판</a>
	<a class="nav-link" href="${contextPath}/admin/faqView" style="color:pink;">자주묻는 질문</a>
	<a class="nav-link" href="${contextPath}/admin/inquiryList" style="color:pink;">1:1 문의 목록</a>
	
	<a class="nav-link" href="${contextPath}/member/login">로그인</a>
	<a class="nav-link" href="${contextPath}/member/signUp">회원가입</a>
	<a class="nav-link" href="${contextPath}/member/mypage">마이페이지</a>
	<a class="nav-link" href="${contextPath}/member/mypageFindId1">아이디찾기1</a>
	<a class="nav-link" href="${contextPath}/member/mypageFindId2">아이디찾기2</a>
	<a class="nav-link" href="${contextPath}/member/mypageFindPw1">비밀번호찾기1</a>
	<a class="nav-link" href="${contextPath}/member/mypageFindPw2">비밀번호찾기2</a>
	<a class="nav-link" href="${contextPath}/member/mypageFindPw3">비밀번호찾기3</a>
	<a class="nav-link" href="${contextPath}/member/mypageInfoUpdate">내 정보 수정</a>
	<a class="nav-link" href="${contextPath}/member/mypagePwUpdate">비밀번호 수정</a>
	
	
    
   	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/resume-scripts.js"></script>
	
	
</body>
</html>