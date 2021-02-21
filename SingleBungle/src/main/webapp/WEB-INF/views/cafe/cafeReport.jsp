<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 신고접수 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>

</style>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h4>신고접수</h4>

                <form action="reportAction" method="post">

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">제목</label>
                        <input type="text" class="form-control" id="report-title" name="reportTitle" required>
                    </div>

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">신고사유</label>
                        <select	class="form-select" id="category" name="categoryName" style="width: 200px; height: 30px;">
                            <option value="10">욕설, 비방, 차별, 혐오</option>
                            <option value="20">홍보, 영리목적</option>
                            <option value="30">불법 정보</option>
                            <option value="40">음란, 청소년 유해</option>
                            <option value="50">개인 정보 노출, 유포, 거래</option>
                            <option value="60">도배, 스팸</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <div>
                            <label for="content">신고내용</label>
                        </div>
                        <textarea class="form-control" id="report-content" name="reportContent"
                            rows="10" style="resize: none;"></textarea>
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-secondary mb-3 btn-danger">신고</button>
                        <button type="button" class="btn btn-secondary mb-3">취소</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>