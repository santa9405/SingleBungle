<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>

    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">

    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- 부트스트랩 사용을 위한 라이브러리 추가 (반드시 jQuery가 항상 먼저여야한다. 순서 중요!) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

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
        .email-1{
            padding-right: 0px;
        }
        .email-2{
            text-align: center;
            padding-left: 0px;
            padding-right: 0px;
        }
        .email-3{
            padding-left: 0px;
        }

        /* 동네 인증 */
        .town-1{
            padding-left: 0px;
            padding-right: 0px;
        }


        .town-area-1{
            float: left;
            padding-left: 0px;
            padding-right: 0px;
        }

        .town-area-2{
            float: right;
            padding-right: 0px;
        }

    </style>

</head>

<body>
    <div class="container">
        <div class="row">
        
           	<jsp:include page="sideMenu.jsp" />

            <div class="col-md-4">

                <div class="text-center">

                    <h3 style="margin-bottom:50px;">로고,,ㄱ-</h3>

                    <h3>내 정보 수정</h3>

                    <hr>
                </div>



                <form>

                    <div class="form-group">
                        <label for="nickname">* 닉네임</label>
                        <input type="nickname" class="form-control" id="nickname" placeholder="닉네임을 입력하세요.">
                    </div>

                    <div class="form-group">
                        <label for="number">* 전화번호</label>
                        <div class="form-row">
                            <div class="col-md-4">
                                <select class="form-control">
                                    <option>010</option>
                                    <option>011</option>
                                    <option>016</option>
                                    <option>017</option>
                                    <option>019</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="nickname" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <input type="nickname" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">* 이메일</label>
                        <div class="form-row">
                            <div class="col-md-5 email-1">
                                <input type="nickname" class="form-control">
                            </div>
                            <div class="col-md-1 email-2">
                                @
                            </div>
                            <div class="col-md-6 email-3">
                                <select class="form-control">
                                    <option>이메일 선택</option>
                                    <option>naver.com</option>
                                    <option>daum.com</option>
                                    <option>hanmail.com</option>
                                    <option>gmail.com</option>
                                    <option>nate.com</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="town">* 동네 인증하기</label>
                        <div class="form-row">
                            <div class="col-md-8 town-area-1">
                                <input type="nickname" class="form-control town-1">
                            </div>
                            <div class="col-md-4 town-area-2">
                                <button type="submit" class="btn btn-primary btn-block">인증하기</button>
                            </div>
                        </div>
                    </div>

                    <br>
                    <br>
                    <hr>
                    <br>

                    <button type="submit" class="btn btn-primary btn-block">정보 수정 완료</button>

                    <br><br><br><br><br><br>

                </form>
            </div>

        </div>

        <div class="col-md-4">

        </div>
    </div>
</body>

</html>