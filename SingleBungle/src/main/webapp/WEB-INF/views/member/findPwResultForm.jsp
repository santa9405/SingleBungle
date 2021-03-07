<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>

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

        #idpw-area{
            width:100%;
        }

        #id-area{
            width:50%;
        }
        #pw-area{
            width:50%;
        }

        /* ------------------------------------------- */
        
        #complete-group{
            clear: both;
        }

        .complete1{
            font-size: 35px;
            font-weight: 300;
        }
        .complete2{
            font-size: 20px;
            font-weight: 400;
        }

        #complete-id{
            color: red;
            font-weight: 700;
        }

    </style>

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>
            
            <div class="col-md-4">
                
                <form>

                    <h3 class="text-center">로고,,ㄱ-</h3>
                    <br><br>
                    
                    <h3 class="text-center">비밀번호 찾기</h3>
                    <br>
                    
                    <div class="form-row" id="idpw-area">
                        <div class="form-group col-md-6" id="id-area">
                            <button type="submit" class="btn btn-primary btn-block maincolor-re">아이디 찾기</button>
                        </div>
                        <div class="form-group col-md-6" id="pw-area">
                            <button type="submit" class="btn btn-outline-primary btn-block maincolor-re">비밀번호
                                찾기</button>
                        </div>
                    </div>
                    <hr>
                    
                    <br>

                    <div class="form-group" id="complete-group">

                        <div class="complete1">
                            비밀번호가<br>
                            변경되었습니다.
                        </div>
                        
                        <div class="complete2">
                            새로운 비밀번호로  
                            로그인해주세요.
                        </div>

                    </div>

                    <br>
                    <hr>

                    <button type="submit" class="btn btn-primary btn-block maincolor">로그인</button>


                </form>
            </div>

        </div>

        <div class="col-md-4">
        </div>
    </div>
</body>

</html>