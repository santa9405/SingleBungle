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
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
	<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   	<style>
	
   	</style>
</head>
<body id="page-top">

	<a class="nav-link" href="${contextPath}/findFriend/insert">친구찾기 게시글 작성</a>
	<a class="nav-link" href="${contextPath}/findFriend/list">친구찾기 목록 조회</a>
	<a class="nav-link" href="${contextPath}/findFriend/view">친구찾기 상세 조회</a>
	
	<a class="nav-link" href="${contextPath}/board/insert">자유게시판 게시글 작성</a>
	<a class="nav-link" href="${contextPath}/board/list">자유게시판 목록 조회</a>
	<a class="nav-link" href="${contextPath}/board/view">자유게시판 상세 조회</a>
	<a class="nav-link" href="${contextPath}/board/update">자유게시판 게시글 수정</a>
	
	<a class="nav-link" href="${contextPath}/cafe/insert">맛집게시판 게시글 작성</a>
	<a class="nav-link" href="${contextPath}/cafe/list">맛집게시판 목록 조회</a>
	<a class="nav-link" href="${contextPath}/cafe/view">맛집게시판 상세 조회</a>
	<a class="nav-link" href="${contextPath}/cafe/update">맛집게시판 게시글 수정</a>
	
	<a class="nav-link" href="${contextPath}/market/list" style="color:orange;">사고팔고 목록 조회</a>
	<a class="nav-link" href="${contextPath}/market/view" style="color:orange;">사고팔고 상세 조회</a>
	<a class="nav-link" href="${contextPath}/market/insert" style="color:orange;">사고팔고 판매글 작성</a>


	<a class="nav-link" href="${contextPath}/review/list">후기게시판 목록 조회</a>
	<a class="nav-link" href="${contextPath}/review/view">후기게시판 상세 조회</a>
	<a class="nav-link" href="${contextPath}/review/insert">후기게시판 게시글 등록</a>
	<a class="nav-link" href="${contextPath}/message/message">쪽지테스트(임시)</a>
	
    
   	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/resume-scripts.js"></script>
	
	
</body>
</html>