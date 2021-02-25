<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 수정 페이지</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>
	.insert-label {
		display: inline-block;
		width: 80px;
		line-height: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h4>맛집게시판 수정</h4>

                <form action="updateAction" method="post">

                    <div class="form-group row">
                        <label class="input-group-addon col-sm-1 insert-label">제목</label>
                        <div class="col-sm-11">
                        	<input type="text" class="form-control" id="title" name="cafeTitle" value="${cafe.cafeTitle}" required>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="input-group-addon col-sm-1 insert-label">카테고리</label>
                        <div class="col-sm-4">
	                        <select	class="form-control div small" id="category" name="categoryName" style="width: 160px; height: 40px;">
	                            <option value="10">혼밥식당</option>
	                            <option value="20">맛집추천</option>
	                            <option value="30">카페</option>
	                        </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="input-group-addon col-sm-1 insert-label">음식점</label>
                        <div class="col-sm-2">
                        	<input type="text" class="form-control" id="title" name="cafeName" style="display: inline-block;" value="${cafe.cafeName}" required>
                        </div>
                        <div>
                        	<button class="form-control btn btn-success" id="searchBtn" type="button" style="display: inline-block;">검색</button>
												</div>
                    </div>

										<hr>
                    <div class="form-group">
                        <div>
                            <label for="content">내용</label>
                        </div>
                        <textarea class="form-control" id="summernote" name="cafeContent" rows="10" style="resize: none;" required>${cafe.cafeContext}</textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-secondary mb-3 btn-success">수정</button>
                        <button type="button" class="btn btn-secondary mb-3">취소</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
		
		</script>
</body>
</html>