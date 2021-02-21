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
                            <option value="50">반려동물</option>
                            <option value="60">요리레시피</option>
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
