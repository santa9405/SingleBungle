<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보</title>


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

        .pagination-success .page-item.active .page-link {
            background: #00c689;
            border-color: #00c689
        }

        .pagination.pagination-rounded-flat .page-item .page-link,
        a {
            border: none;
            border-radius: 50px
        }

        tr>th,
        tr>td {
            text-align: center;
        }

        .table {
            margin-top: 30px;
        }

        span {
            margin-top: 100px;
        }

        #sideMenu {
            margin-top: 50px !important;
            position: relative;
            transition: margin-top 1s ease-in-out 0s, right .5s;
        }

        #sideTitle,
        #sideText {
            text-align: center;
        }

        .nav-link {
            color: #555;
        }

        .nav-link:hover {
            background: #f5f5f5;
        }

        .profile {
            width: 100%;
        }

        .profile td{
            text-align: left;
        }

        .profile-area-left{
            /* text-align: center; */
            color: #ffaf18;
            font-weight: 500;
        }

        .boardTitle>img {
            width: 50px;
            height: 50px;
        }

        .board-list {
            margin: 100px auto;
        }
       

    </style>
</head>

<body>

    <div class="container mt-5 pt-5">
        <div class="row">

            <jsp:include page="sideMenu.jsp" />




            <div class="col-sm-9">

                <div class="myBoard form-group row">
                    <div class="col-sm-3">
                        <img class="img-thumbnail" src="${contextPath}/resources/images/profile.png">
                    </div>
                    <div class="col-sm-9">
                        <!-- <div style="margin-bottom:10px;">
                            닉네임 : 소리아
                        </div>
                        <div style="margin-bottom:10px;">관심사 : 독서, 어쩌구</div>
                        <div style="margin-bottom:10px;">성별 : 여자</div>
                        <div style="margin-bottom:10px;">동네인증이 되지 않았습니다. <button>인증하기</button></div> -->

                        <table class="profile">
                            
                                    <tr>
                                        <td class="profile-area-left">닉네임</td>
                                        <td class="boardTitle">${loginMember.memberNickname}</td>
                                        <td class="profile-area-left">이메일</td>
                                        <td class="boardTitle">${loginMember.memberEmail}</td>
                                    </tr>
                                    <tr>
                                        <td class="profile-area-left">성별</td>
                                        <td class="boardTitle">${loginMember.memberGender}</td>
                                        <td class="profile-area-left">전화번호</td>
                                        <td class="boardTitle">${loginMember.memberPhone}</td>
                                    </tr>
                                    <%-- <tr>
                                        <td class="profile-area-left">매너온도</td>
                                        <td class="boardTitle">${loginMember.memberRating}</td>
                                        <td class="profile-area-left"></td>
                                        <td class="boardTitle"></td>
                                    </tr> --%> 
                                    <%-- 
                                    <tr>
                                        <td colspan="4">
					                        <c:if test="${loginMember.memberCertifiedFl == 'N'}">
					                                                 동네인증이 되지 않았습니다. 
					                        </c:if>
					                        <c:if test="${loginMember.memberCertifiedFl == 'Y'}">
					                                                 동네인증이 되었습니다.
					                        </c:if>
					                                           
                                            <button type="submit" class="btn btn-primary">동네인증</button>
                                        </td>
                                    </tr>
                                    --%>
                        </table>
                    </div>
                    <!-- <div class="col-sm-4">
                        <div style="margin-bottom:10px;">이메일 : soria@naver.com</div>
                        <div style="margin-bottom:10px;">전화번호 : 010-1111-22222</div>
                        <div style="margin-bottom:10px;">매너온도 : 100C </div>
                    </div> -->
                    
                </div>


                <div class="myReply">
                    <span>
                        <h4>좋아요한 글 보기</h4>
                    </span>


                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>게시판</th>
                                <th>댓글 남긴 게시글</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        
                        

                        <tbody>
                        <c:if test="${empty boardList }">
                   			<tr>
								<td colspan="6">존재하는 게시글이 없습니다.
							</tr>
		                   </c:if>
		                   <c:if test="${!empty boardList }">
		                  	<c:forEach var="board" items="${boardList}" varStatus="vs">

                            <tr>
                                <td>${board.type }</td>
                                <td class="boardTitle">${board.boardTitle }</td>
                                <td>${board.createDt}</td>
                            </tr>
                            
							</c:forEach>
							</c:if>
                        </tbody>
                    </table>


                    <div class="padding">
                        <div class="container d-flex justify-content-center">
                            <div class="grid-margin stretch-card">
                                <nav>
                                    <ul
                                        class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="myReply">
                    <span>
                        <h4>내가 쓴 글</h4>
                    </span>


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
                                    <ul
                                        class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="myReply">
                    <span>
                        <h4>내가 쓴 댓글</h4>
                    </span>


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
                                    <ul
                                        class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- ---------------------------------두번째웅앵--------------------------------------------- -->
                <div  class="myLike">
                        <span>
                            <h4>내가 찜한 목록</h4>
                        </span>

                    <table class="table table-hover table-striped" id="list-table">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                 <td>1</td>
                                <td class="boardTitle">
                                    <!----------------- 썸네일 부분 -----------------> 
                                    <img src="img/sns_kakao.jpg"> 제목입니다 어쩌구
                                </td>
                                 <td>달마고</td>
                                <td>작성자</td>
                            </tr>

                            <tr>
                                <td>1</td>
                               <td class="boardTitle">
                                   <!----------------- 썸네일 부분 -----------------> 
                                   <img src="https://res.cloudinary.com/mhmd/image/upload/v1556294928/tim-foster-734470-unsplash_xqde00.jpg"> 제목입니다 어쩌구
                               </td>
                                <td>달마고</td>
                               <td>작성자</td>
                           </tr>

                           <tr>
                            <td>1</td>
                           <td class="boardTitle">
                               <!----------------- 썸네일 부분 -----------------> 
                               <img src="https://res.cloudinary.com/mhmd/image/upload/v1556294927/dose-juice-1184444-unsplash_bmbutn.jpg"> 제목입니다 어쩌구
                           </td>
                            <td>달마고</td>
                           <td>작성자</td>
                       </tr>
                        </tbody>
                    </table>
                    <div class="padding">
                        <div class="container d-flex justify-content-center">
                            <div class="grid-margin stretch-card">
                                <nav>
                                    <ul
                                    class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>


                 <!-- ------------------------------------------------------------------------------ -->
                

        </div>
    </div>
    </div>

    <jsp:include page="../common/header.jsp"/>
  
 <script>
 
	/* 내가 선택한 메뉴에 색 고정하기 */
    $(function(){
			$("#myPage").attr('class','nav-link px-4 active text-white shadow-sm rounded-pill maincolor');
	});
</script>
</body>

</html>