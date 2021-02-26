<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

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

        #inputId, #inputPw {
            margin-bottom: 10px;
        }

        /* 아이디 찾기, 비밀번호 찾기 왼쪽 정렬 */
        .idpw-left {
            float: left;
        }

        /* 회원가입 오른쪽 정렬 */
        .idpw-right {
            float: right;
        }


        /* sns */
        #sns_signUp {
            margin-top: 50px;
        }

        .sns_text {
            color: #757575;
            font-weight: 400;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .sns_logo {
            width: 45px;
            margin-left: 5px;
        }
    </style>

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>

            <div class="col-md-4">
                <h3 class="login-heading mb-4 text-center">로고,,ㄱ-</h3>
                <form>
                    <div class="form-label-group">
                        <input type="id" id="inputId" class="form-control" placeholder="아이디" required autofocus>
                    </div>

                    <div class="form-label-group">
                        <input type="password" id="inputPw" class="form-control" placeholder="비밀번호" required>
                    </div>

                    <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <label class="custom-control-label" for="customCheck1">아이디 저장</label>
                    </div>
                    <button class="btn btn-primary btn-block btn-login text-uppercase mb-2"
                        type="submit">로그인</button>
                    <div>
                        <div class="idpw-left">
                            <a class="id" href="#">아이디 찾기</a>
                            <a class="pw" href="#">비밀번호 찾기</a>
                        </div>
                        <div class="idpw-right">
                            <a class="signup" href="#">회원가입</a>
                        </div>
                        
                        <br>

                        <div class="text-center" id="sns_signUp">
                            <div class="sns_text">
                                SNS계정 간편 로그인/회원가입
                            </div>
                            <a href="#"><img class="sns_logo" src="img/sns_naver.jpg"></a>
                            <a href="#"><img class="sns_logo" src="img/sns_kakao.jpg"></a>
                        </div>
                    </div>
                </form>

            </div>

            <div class="col-md-4">
            </div>
        </div>
    </div>
</body>

</html>