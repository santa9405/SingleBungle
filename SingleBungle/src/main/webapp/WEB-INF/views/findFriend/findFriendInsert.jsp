<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h4>게시글 등록</h4>

                <form action="insertAction" method="post">

                    <div class="form-inline mb-2">
                        <label class="input-group-addon mr-3 insert-label">제목</label>
                        <input type="text" class="form-control" id="title" name="boardTitle" size="100%" required>
                    </div>

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">카테고리</label>
                        <select   class="form-select" id="category" name="categoryName" style="width: 150px; height: 30px;">
                            <option value="10">여행</option>
                            <option value="20">영화</option>
                            <option value="30">일상</option>
                            <option value="40">경제</option>
                            <option value="50">밥친구</option>
                        </select>
                    </div>

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">지역</label>
                        <select   class="form-select" id="category" name="categoryName" style="width: 150px; height: 30px;">
                            <option value="10">서울특별시</option>
                            <option value="20">부산광역시</option>
                            <option value="30">대구광역시</option>
                            <option value="40">인천광역시</option>
                            <option value="50">광주광역시</option>
                            <option value="60">대전광역시</option>
                            <option value="70">울산광역시</option>
                            <option value="80">세종특별자치시</option>
                            <option value="90">경기도</option>
                            <option value="100">강원도</option>
                            <option value="110">충청북도</option>
                            <option value="120">충청남도</option>
                            <option value="130">전라북도</option>
                            <option value="140">전라북도</option>
                            <option value="150">경상북도</option>
                            <option value="160">경상남도</option>
                            <option value="170">제주도</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <div>
                            <label for="content">내용</label>
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

</body>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>	
	
		// 게시글 삭제
		
		
	</script>
</body>
</html>
