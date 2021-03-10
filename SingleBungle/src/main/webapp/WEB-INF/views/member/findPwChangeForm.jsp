<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2비밀번호 찾기</title>

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

        a:hover {
            text-decoration: none;
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

        /* ---------------------------------------------------------- */
        .complete1{
            font-size: 35px;
            font-weight: 300;
        }
        
        .complete2{
            font-size: 20px;
            font-weight: 400;
        }

    </style>

</head>

<body>

	<jsp:include page="../common/header.jsp" />

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
                        	<a href="${contextPath}/member/findIdForm">
	                            <button type="button" class="btn btn-primary btn-block maincolor-re">아이디 찾기</button>
                        	</a>
                        </div>
                        <div class="form-group col-md-6" id="pw-area">
	                        <a href="${contextPath}/member/findPwForm">
	                            <button type="button" class="btn btn-outline-primary btn-block maincolor-re">비밀번호                                찾기</button>
	                        </a>
                        </div>
                    </div>
                    <hr>
                    
                    <br>
                    <div>
                        <div class="complete1">
                            본인인증이<br>
                            완료되었습니다.
                        </div>
                        <div class="complete2">
                            비밀번호를 재설정해주세요.
                        </div>
                    </div>
                    <br><br>

                    <div class="form-group">
                        <label for="pw">* 새 비밀번호</label>
                        <input type="password" class="form-control" id="pw" placeholder="새 비밀번호를 입력하세요.">
                    </div>

                    <div class="form-group">
                        <label for="pw2">* 새 비밀번호 확인</label>
                        <input type="password" class="form-control" id="pw2" placeholder="새 비밀번호를 한번 더 입력하세요.">
                    </div>


                    <br>
                    <hr>

                    <button type="submit" id="changeBtn" class="btn btn-primary btn-block maincolor">비밀번호 변경</button>
                </form>
            </div>

        </div>

        <div class="col-md-4">
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>