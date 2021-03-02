<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 자유게시판 신고 페이지</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
   
</style>
</head>
<body>
   <div class="container my-5" style="padding-left: 40px; padding-right: 40px;">
     <form method="POST" action="reportAction" class="needs-validation" name="report">
     <div class="form-group row">
      <label for="recipient-name" class="col-sm-3 col-form-label">신고 제목</label>
       <div class="col-sm-9">
             <input type="text" class="form-control" id="recipient-name" name="reportTitle" placeholder="신고 제목을 입력해 주세요." required>
          </div>
     </div>

         <div class="form-group row">
             <label class="input-group-addon col-sm-3 insert-label">신고 사유</label>
             <div class="col-sm-9">
             <select class="form-control div small" id="category" name="categoryName" required>
                 <option value="10">욕설, 비방, 차별, 혐오</option>
                 <option value="20">홍보, 영리목적</option>
                 <option value="30">불법 정보</option>
                 <option value="40">음란, 청소년 유해</option>
                 <option value="50">개인 정보 노출, 유포, 거래</option>
                 <option value="60">도배, 스팸</option>
                 <option value="70">기타</option>
             </select>
             </div>
         </div>


         <div class="form-group row">
             <label for="content" class="col-sm-3 col-form-label">신고 내용</label>
             <div class="col-sm-9">
             <textarea class="form-control" id="summernote" name="boardContent"
                 rows="10" style="resize: none;" required></textarea>
             </div>
         </div>
         <div class="form-group row">
               <div class="col-sm-12" style="text-align:center; margin-top:30px;">
                <button type="submit" class="btn btn-primary">신고</button>
                <button type="submit" class="btn btn-outline-primary">취소</button>
             </div>
         </div>
     </form>
    </div>
</body>

   <script>   
   var brdNo = "${boardNo}";
   var memNo = "${memberId}";
   var target = "${target}";
   var reportContent = "";
   var reportCategory;
   $("#report-btn").on("click", function() {
       reportCategory = $('input[name=reportCategory]:checked').val();
       reportContent = $("#report-content").val().trim()
       console.log(brdNo);
       console.log(memNo);
       console.log(target);
       console.log(reportContent);
       console.log(reportCategory);
       if($(':radio[name="reportCategory"]:checked').length < 1){
           alert('신고유형을 선택해주세요');                        
           event.preventDefault();
       } else if(window.confirm("보고 있는 게시글을 신고하시겠습니까?")){
           $.ajax({
   		url : "${contextPath}/boardReport.do",
           data : {"reportCategory" : reportCategory ,
                   "reportContent" : reportContent,
                   "brdNo" : brdNo,
                   "memNo" : memNo,
                   "target" : target},
   		type : "post",
   		success : function(result) {    			
   			if(result > 0) {
                   swal({"icon" : "success" , "title" : "신고가 접수되었습니다."}).then(function(){ 
                   	opener.parent.location.href = "${contextPath}/board/list.do?cp=1"; // 주소 메인으로 넘기기 
                   	window.close(); 
                   });
                  
   			} else {
                   swal({"icon" : "error" , "title" : "신고 접수 실패."});
               }		
   		}, 
   		error : function(request, status, error) {
   	      alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
   		}
   		
   	});
       }
   });
   </script>
</body>
</html>