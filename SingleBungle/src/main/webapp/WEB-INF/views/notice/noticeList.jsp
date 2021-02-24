<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

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

        .pagination-success .page-item.active .page-link,
        a {
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
            margin-top: 100px;
        }

    </style>

</head>

<body>
<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div>
                    <p id="bTitle">공지사항</p>
                    <div class="tab">
                        <a id="notice" href="#">공지사항</a> |
                        <a id="event" href="#">이벤트</a>

                </div>
                    
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class="boardTitle">싱글벙글 이용수칙입니다.</td>
                            <td>0</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td class="boardTitle">싱글벙글 이용수칙입니다.</td>
                            <td>0</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td class="boardTitle">싱글벙글 이용수칙입니다.</td>
                            <td>0</td>
                            <td>2021-02-20</td>
                        </tr>

                    </tbody>
                </table>

                <a class="btn btn-success float-right" href="#">글쓰기</a>

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