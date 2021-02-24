<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 관리</title>

    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/db80de430d.js" crossorigin="anonymous"></script>


        <style>
            .flex {
         -webkit-box-flex: 1;
         -ms-flex: 1 1 auto;
         flex: 1 1 auto
     }
    
            @media (max-width:991.98px) {
                .padding {
                    padding: 1.5rem
                }
            }
    
            @media (max-width:767.98px) {
                .padding {
                    padding: 1rem
                }
            }
    /* 
            .padding {
                padding: 5rem
            } */
    
            .container {
                margin-top: 50px;
            }
    
            .pagination,
            .jsgrid .jsgrid-pager {
                display: flex;
                padding-left: 0;
                list-style: none;
                border-radius: 0.25rem
            }
    
            .page-link {
                color: black
            }
    
            .pagination.pagination-rounded-flat .page-item {
                margin: 0 .25rem
            }
    
            .pagination-success .page-item.active .page-link{
                background: #00c689;
                border-color: #00c689
            }
    
            .pagination.pagination-rounded-flat .page-item .page-link,
            a {
                border: none;
                border-radius: 50px
            }
    
    
    
            tr > th, tr > td {
                text-align: center;
            }
    
            #bTitle{
                font-size: 30px;
            }
    
            #bTitle, .tab{
                float: left;
            }
    
            .tab{
                margin-top: 15px;
                margin-left: 3%;
            }
    
            .tab > a { color: #000; background-color: aliceblue;}
            a:link { color: #000; text-decoration: none; }
            a:visited { color: #000; }
            a:hover{color: gray;}
    
    
            .table {
                margin-top: 10px;
            }

            #category{
                width: 20% !important;
            }




        </style>
            
        <script>
            function selectAll(selectAll) {
            const selectReply = document.getElementsByName('ck');
            selectReply.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
            }) 
        }
        </script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
  <jsp:include page="sideMenu.jsp" />
            <div class="col-sm-9">
                <div class="px-lg-5">
    
                    <!-- 게시판 이름/카테고리 -->
                    <div class="row py-5">
                          <h1 class="boardName float-left">신고 게시글 관리</h1>
                    </div>     
                </div>

                <div>
                    <select class="form-control" id="category" style="width: 100px; display: inline-block;">
                        <option>부적절함</option>
                        <option>음란성</option>
                        <option>홍보</option>
                        <option>어쩌구</option>
                        <option>저쩌구</option>
                        <option>긁적</option>
                    </select>
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th><input type="checkbox" name="ck" onclick='selectAll(this)'></th>
                            <th>번호</th>
                            <th>게시판명</th>
                            <th>글번호</th>
                            <th>신고카테고리</th>
                            <th>신고내용</th>
                            <th>신고회원</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="ck"></td>
                            <td>3</td>
                            <td>사고팔고</td>
                            <td>23</td>
                            <td>부적절한 게시글</td>
                            <td>게시판이랑 글내용이 서로 다르네요</td>
                            <td>달마고</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ck"></td>
                            <td>2</td>
                            <td>후기</td>
                            <td>4</td>
                            <td>홍보</td>
                            <td>불법으로 홍보해요ㅡㅡ</td>
                            <td>신이동특</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ck"></td>
                            <td>1</td>
                            <td>친구찾기</td>
                            <td>13</td>
                            <td>음란성 게시글</td>
                            <td>이상한 음란성 게시글을 올렷어요</td>
                            <td>솔이이</td>
                        </tr>

                    </tbody>
                </table>

                <div class="float-right">
                    <button id="deleteBtn" class="btn btn-success">복구</button> 
                    <button id="deleteBtn" class="btn btn-success">삭제</button> 
                </div>
                    <div class="padding">
                        <div class="container d-flex justify-content-center">
                            <div class="col-md-4 col-sm-6 grid-margin stretch-card">
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

                            </div>
                        </div>
                    </div>


                    <div>
                        <div class="text-center" id="searchForm" style="margin-bottom: 100px;">
                         
                            <select name="sk" class="form-control" style="width: 100px; display: inline-block;">
                                <option value="tit">제목</option>
                                <option value="tit">내용</option>
                                <option value="tit">제목 + 내용</option>
                                <option value="tit">닉네임</option>
                            </select> 
                            <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                            <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block;">검색</button>
                        </div>
                    </div>
            </div>

        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
     <script>
    $(function(){
			$("#boardReport").attr('class','nav-link px-4 active bg-primary text-white shadow-sm rounded-pill');
	});
</script>
</body>
</html>