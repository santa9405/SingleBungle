<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 자유게시판 수정 페이지</title>

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
	
	.note-editor{
   	width : 100% !important;
  } 
</style>

	<!-- summernote 사용 시 필요한 css 파일 추가 -->
	<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		
		<!-- summernote 사용 시 필요한 js 파일 추가 -->
		<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
		<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
		<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
	
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <h4>자유게시판 수정</h4>

                <form action="updateAction" method="post" enctype="multipart/form-data" name="updateForm" role="form" onsubmit="return validate();">

                    <div class="form-group row">
                        <label for="title" class="input-group-addon col-sm-1 insert-label">제목</label>
                        <div class="col-sm-11">
                        	<input type="text" class="form-control" id="title" name="boardTitle" value="${board.boardTitle}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="category" class="input-group-addon col-sm-1 insert-label">카테고리</label>
                        <div class="col-sm-4">
	                        <select	class="form-control div small" id="category" name="categoryName" style="width: 150px; height: 40px;" required>
	                            <option value="10">여행</option>
	                            <option value="20">영화</option>
	                            <option value="30">일상</option>
	                            <option value="40">경제</option>
	                            <option value="50">반려동물</option>
	                            <option value="60">요리레시피</option>
	                        </select>
                        </div>
                    </div>
										<hr>
                    <div class="form-group">
												<div>
													<label for="content">내용</label>
												</div>
                        <textarea class="form-control" id="summernote" name="boardContent" rows="10" style="resize: none;" required>${board.boardContent}</textarea>
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
		// 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#summernote").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#summernote").focus();
				return false;
			}
		}
		
		
		</script>
		
</body>
</html>