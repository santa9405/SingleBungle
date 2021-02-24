<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 작성</title>

    
    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
        
    <style>
        form{
            margin-top: 50px;
        }
 
    </style>
<body>
<jsp:include page="../common/header.jsp"/>

    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <h4>FAQ 작성</h4>
                <hr>

                <form action="insertAction" method="post">

                    <div class="form-inline mb-2">
                        <label class="input-group-addon mr-3 insert-label">질문</label>
                        <input type="text" class="form-control" id="title" name="boardTitle" size="100%" required>
                    </div><br>

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">카테고리</label>
                        <select   class="form-select" id="category" name="categoryName" style="width: 150px; height: 30px;">
                            <option value="10">이용문의</option>
                            <option value="20">게시판문의</option>
                            <option value="30">회원서비스</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <div>
                            <label for="content">답변</label>
                        </div>
                        <textarea class="form-control" id="summernote" name="boardContent"
                            rows="10" style="resize: none;" required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-secondary mb-3 btn-warning">등록</button>
                        <button type="button" class="btn btn-secondary mb-3">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>