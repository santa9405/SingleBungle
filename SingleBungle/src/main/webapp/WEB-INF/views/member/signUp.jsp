<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signUp</title>

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

        /* 성별 */
        span{
            margin-right: 20px;
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
            margin-bottom: 20px;
        }
    </style>

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>

            <div class="col-md-4">

                <div class="text-center">

                    <h3 style="margin-bottom:50px;">로고,,ㄱ-</h3>

                    <h3>회원가입</h3>

                    <div class="text-center" id="sns_signUp">
                        <div class="sns_text">
                            SNS계정 간편 로그인/회원가입
                        </div>
                        <a href="#"><img class="sns_logo" src="img/sns_naver.jpg"></a>
                        <a href="#"><img class="sns_logo" src="img/sns_kakao.jpg"></a>
                    </div>


                    <hr>
                </div>



                <form>
                    <div class="form-group">
                        <label for="id">* 아이디</label>
                        <input type="id" class="form-control" id="id" placeholder="아이디를 입력하세요.">
                        <small id="idaaaa" class="form-text text-muted">
                            유효성 웅앵,,
                        </small>
                    </div>

                    <div class="form-group">
                        <label for="pw">* 비밀번호</label>
                        <input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요.">
                    </div>

                    <div class="form-group">
                        <label for="pw2">* 비밀번호 확인</label>
                        <input type="password" class="form-control" id="pw2" placeholder="비밀번호를 한번 더 입력하세요.">
                    </div>

                    <div class="form-group">
                        <label for="name">* 이름</label>
                        <input type="name" class="form-control" id="name" placeholder="이름을 입력하세요.">
                    </div>

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
                                <input type="number" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <input type="number" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">* 이메일</label>
                        <div class="form-row">
                            <div class="col-md-5 email-1">
                                <input type="nickname" class="form-control">
                            </div>
                            <div class="col-md-2 email-2">
                                @
                            </div>
                            <div class="col-md-5 email-3">
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
                        <label for="gender">* 성별</label>
                        <div>
                            <input type="radio" name="gender"> <span>남자</span>
                            <input type="radio" name="gender"> <span>여자</span>
                        </div>
                    </div>

                    <hr>

                    <label for="agree">* 약관동의</label>
                    <div class="form-group agree">
                        <div>
                            <!-- id, for끼리는 이름이 같으면 안된다! -->
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">전체동의</label>
                            </div>

                            <hr>

                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                <label class="custom-control-label" for="customCheck2">만 14세 이상입니다.(필수)</label>
                            </div>
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck3">
                                <label class="custom-control-label" for="customCheck3">이용약관(필수)</label>
                            </div>
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck4">
                                <label class="custom-control-label" for="customCheck4">개인정보처리방침(필수)</label>
                            </div>
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck5">
                                <label class="custom-control-label" for="customCheck5">이벤트,프로모션 알림 메일 및 SMS
                                    수신(선택)</label>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">회원가입 완료</button>

                    <br><br><br><br><br><br>

                </form>
            </div>

        </div>

        <div class="col-md-4">

        </div>
    </div>
</body>

</html>