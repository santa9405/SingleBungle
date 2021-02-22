<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고</title>
<style>
	
</style>
</head>
<body>
	<div class="container">
        <div class="row">

            <div class="col-md-12">
                <form method="POST" action="reportAction" class="needs-validation" name="report">
                    <div class="form-inline mb-2">
                        <label class="input-group-addon mr-3 insert-label">제목</label>
                        <input type="text" class="form-control" id="title" name="boardTitle" size="100%" required>
                    </div><br>

                    <div class="mb-2">
                        <label class="input-group-addon mr-3 insert-label">신고사유</label>
                        <select   class="form-select" id="category" name="categoryName" style="width: 150px; height: 30px;">
                            <option value="10">욕설, 비방, 혐오</option>
                            <option value="20">음란성</option>
                            <option value="30">홍보</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <div>
                            <label for="content">신고내용</label>
                        </div>
                        <textarea class="form-control" id="summernote" name="boardContent"
                            rows="10" style="resize: none;" required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-secondary mb-3 btn-warning">신고</button>
                        <button type="button" class="btn btn-secondary mb-3">취소</button>
                    </div>
                </form>
            </div>
         </div>
    </div>
</body>

	<script>	
	
		// 게시글 삭제
		
		
	</script>
</body>
</html>
