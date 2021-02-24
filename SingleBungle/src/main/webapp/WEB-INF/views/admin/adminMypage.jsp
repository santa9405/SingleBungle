<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>

    
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

        .table{
            margin-top: 30px;
        }

        span{
            margin-top: 100px;
        }

        #sideMenu{
            margin-top: 50px !important;
            position: relative;
            transition: margin-top 1s ease-in-out 0s, right .5s;
        }

        #sideTitle, #sideText{
            text-align: center;
        }



        .nav-link {
  color: #555;
}

.nav-link:hover {
  background: #f5f5f5;
}




        </style>

</head>
<body>
    
     <div class="container mt-5 pt-5">
        <div class="row">
           <jsp:include page="sideMenu.jsp" />


            
                  
            



            <div class="col-sm-9">
                
                <div class="myBoard">
                    <span><h4>내가 쓴 글</h4></span>

                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>게시판</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>공지사항</td>
                            <td class="boardTitle">공지사항입니다.</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>공지사항</td>
                            <td class="boardTitle">사이트 이용안내</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>FAQ</td>
                            <td class="boardTitle">자주묻는 질문입니다</td>
                            <td>2021-02-20</td>
                        </tr>

                    </tbody>
                </table>

                
                   
                        <div class="container d-flex justify-content-center">
                            <div class="grid-margin stretch-card">
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


                <div class="myReply">
                    <span><h4>내가 쓴 댓글</h4></span>

                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>게시판</th>
                            <th>댓글 남긴 게시글</th>
                            <th>작성일</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>사고팔고</td>
                            <td class="boardTitle">어쩌구입니다....</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>자유게시판</td>
                            <td class="boardTitle">댓글입니다</td>
                            <td>2021-02-20</td>
                        </tr>
                        <tr>
                            <td>후기게시판</td>
                            <td class="boardTitle">댓글 운영... </td>
                            <td>2021-02-20</td>
                        </tr>

                    </tbody>
                </table>

                
                    <div class="padding">
                        <div class="container d-flex justify-content-center">
                            <div class="grid-margin stretch-card">
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
                </div>
            </div>
            
           
        </div>
    </div>
</body>
 <script>
    $(function(){
			$("#myPage").attr('class','nav-link px-4 active bg-primary text-white shadow-sm rounded-pill');
	});
</script>

</html>