<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
             
            .accordion .card {
                background: none;
                border: none;
            }
            .accordion .card .card-header {
                background: none;
                border: none;
                padding: .4rem 1rem;
                font-family: "Roboto", sans-serif;
            }
            .accordion .card-header h2 span {
                float: left;
                margin-top: 10px;
            }
            .accordion .card-header .btn {
                color: #2f2f31;
                font-size: 1.04rem;
                text-align: left;
                position: relative;
                font-weight: 500;
                padding-left: 2rem;
            }
            .accordion .card-header i {
                font-size: 1.2rem;
                font-weight: bold;
                position: absolute;
                left: 0;
                top: 9px;
            }
            .accordion .card-header .btn:hover {
                color: #ff8300;
            }
            .accordion .card-body {
                color: #324353;
                padding: 0.5rem 3rem;
            }
            .page-title {
                margin: 3rem 0 3rem 1rem;
                font-family: "Roboto", sans-serif;
                position: relative;
            }
            .page-title::after {
                content: "";
                width: 80px;
                position: absolute;
                height: 3px;
                border-radius: 1px;
                background: #73bb2b;
                left: 0;
                bottom: -15px;
            }
            .accordion .highlight .btn {
                color: #74bd30;
            }
            .accordion .highlight i {
                transform: rotate(180deg);
            }

            .accordion{
                clear: both;
            }

            .boardName {
                margin-right: 40px;
            }

            .category{
                text-decoration: none;
                color: black;
                line-height : 54px;
            }

            a:link { color: #000; text-decoration: none; }
            a:visited { color: #000; }
            a:hover{color: gray;}

            .navbar-nav{
                width: 100%;
            }

            /* .nav-item{
                width: 25%;
                text-align: center;
            } */

            .navbar-brand{
                margin-right: 0;
            }
            
            </style>

        <script>
            $(document).ready(function(){
                // Add minus icon for collapse element which is open by default
                $(".collapse.show").each(function(){
                    $(this).prev(".card-header").addClass("highlight");
                });
                
                // Highlight open collapsed element 
                $(".card-header .btn").click(function(){
                    $(".card-header").not($(this).parents()).removeClass("highlight");
                    $(this).parents(".card-header").toggleClass("highlight");
                });
            });
            </script>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            
            <div class="col-md-12">
                <div class="px-lg-5">
    
                    <!-- 게시판 이름/카테고리 -->
                    <div class="row py-5">
                      <div class="col-lg-12 mx-auto">
                        <div class="text-black banner">
                          <h1 class="boardName float-left">문의 게시판</h1>
                          <a class="category" href="#">FAQ</a> | 
                          <a class="category" href="#">1:1 문의</a> 
                        </div>
                        
                    </div>
                </div>

                <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 shadow-sm"> <a href="#" class="navbar-brand font-weight-bold d-block d-lg-none">문의사항</a> <button type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"> <span class="navbar-toggler-icon"></span> </button>
                    <div id="navbarContent" class="collapse navbar-collapse">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item"><a id="megamneu" href="" class="nav-link font-weight-bold text-uppercase">전체</a></li>
                            <li class="nav-item"><a id="megamneu" href="" class="nav-link font-weight-bold text-uppercase">이용문의</a></li>
                            <li class="nav-item"><a id="megamneu" href="" class="nav-link font-weight-bold text-uppercase">게시판문의</a></li>
                            <li class="nav-item"><a id="megamneu" href="" class="nav-link font-weight-bold text-uppercase">회원서비스</a></li>
                        </ul>
                    </div>
                </nav>




                
                <div class="accordion" id="accordionExample">

                    <c:if test="${!empty board }">
                  	<c:forEach var="board" items="${board}" varStatus="vs">
                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h2 class="mb-0">
                                <a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse${board.boardNo}" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fa fa-chevron-circle-down"></i> ${board.boardTitle}
                                </a>
                            </h2>
                        </div>
                        <div id="collapse${board.boardNo}" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <div class="card-body">
                                <% pageContext.setAttribute("newLine", "\n"); %>
								${fn:replace(board.boardContent, newLine , "<br>") }
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                   
                </div>
                <hr>
                <br>
                <a class="btn btn-success float-right" href="../admin/faqInsert">글쓰기</a><br><br>
                <div>
                    <div class="text-center" id="searchForm" style="margin-bottom: 100px;">
                     
                        <select name="sk" class="form-control" style="width: 100px; display: inline-block;">
                            <option value="tit">글제목</option>
                            <option value="con">내용</option>
                            <option value="titcont">제목+내용</option>
                        </select> 
                        <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                        <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block;">검색</button>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>