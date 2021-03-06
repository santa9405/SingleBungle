<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>삭제 게시글 관리</title>

    <!-- 부트스트랩 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/db80de430d.js" crossorigin="anonymous"></script>


        <style>
            .flex {
         -webkit-box-flex: 1;
         -ms-flex: 1 1 auto;
         flex: 1 1 auto
     }
    
            @media (max-width:991.98px) {
                .padding {
                    padding: 1.5rem
                }
            }
    
            @media (max-width:767.98px) {
                .padding {
                    padding: 1rem
                }
            }
    /* 
            .padding {
                padding: 5rem
            } */
    
            .container {
                margin-top: 50px;
            }
    
            .pagination,
            .jsgrid .jsgrid-pager {
                display: flex;
                padding-left: 0;
                list-style: none;
                border-radius: 0.25rem
            }
    
            .page-link {
                color: black
            }
    
            .pagination.pagination-rounded-flat .page-item {
                margin: 0 .25rem
            }
    
            .pagination-success .page-item.active .page-link{
                background: #00c689;
                border-color: #00c689
            }
    
            .pagination.pagination-rounded-flat .page-item .page-link,
            a {
                border: none;
                border-radius: 50px
            }
    
    
    
            tr > th, tr > td {
                text-align: center;
            }
    
            #bTitle{
                font-size: 30px;
            }
    
            #bTitle, .tab{
                float: left;
            }
    
            .tab{
                margin-top: 15px;
                margin-left: 3%;
            }
    
            .tab > a { color: #000; background-color: aliceblue;}
            a:link { color: #000; text-decoration: none; }
            a:visited { color: #000; }
            a:hover{color: gray;}
    
    
            .table {
                margin-top: 10px;
            }


        </style>
            
        <script>
            function selectAll(selectAll) {
	            const selectReply = document.getElementsByName('ck');
	            selectReply.forEach((checkbox) => {
	            checkbox.checked = selectAll.checked;
            })
        }
        </script> 
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <div class="row">

<jsp:include page="sideMenu.jsp" />
            <div class="col-sm-9">
                <div class="px-lg-5">
    
                    <!-- 게시판 이름/카테고리 -->
                    <div class="row py-5">
                          <h1 class="boardName float-left">삭제 게시글 관리</h1>
                </div>     
                </div>

                <div>
                    <select class="form-control" style="width: 100px; display: inline-block;">
                        <option>후기</option>
                        <option>맛집</option>
                        <option>자유</option>
                        <option>사고팔고</option>
                        <option>친구찾기</option>
                        <option>공지사항</option>
                    </select>
                </div>
                <table class="table table-striped" id="list-table">
                    <thead>
                        <tr>
                            <th><input type="checkbox" name="ck" onclick='selectAll(this)'></th>
                            <th class="hidden">번호</th>
                            <th>게시판명</th>
                            <th>제목</th>
                        </tr>
                    </thead>

                    <tbody>s
                    <c:if test="${empty boardList }">
                   			<tr>
								<td colspan="6">존재하는 게시글이 없습니다.
							</tr>
                   </c:if>
                   <c:if test="${!empty boardList }">
                  	<c:forEach var="board" items="${boardList}" varStatus="vs">
                  		<c:if test="${board.boardCode != 5 }">
                        <tr>
                            <td><input type="checkbox" name="ck"></td>
                            <td class="hidden boardNo">${board.boardNo }</td>
                            <td class="hidden">${board.boardCode }</td>
                            <td>
                            	<c:choose>
									<c:when test="${board.boardCode == 1}">자유게시판</c:when>
									<c:when test="${board.boardCode == 2}">후기게시판</c:when>
									<c:when test="${board.boardCode == 3}">고객센터</c:when>
									<c:when test="${board.boardCode == 4}">이벤트</c:when>
									<c:when test="${board.boardCode == 6}">맛집게시판</c:when>
									<c:when test="${board.boardCode == 7}">친구찾기</c:when>
									<c:when test="${board.boardCode == 7}">사고팔고</c:when>
								</c:choose>
                            </td>
                            <td class="boardTitle">${board.boardTitle }</td>
                        </tr>
                        </c:if>
                        </c:forEach>
                        </c:if>
                    </tbody>
                </table>

                <div class="float-right">
                    <button  id="recoverBtn" class="btn btn-success">복구</button> 
                </div>
                    <div class="padding">
                        <div class="container d-flex justify-content-center">
                            <div class="col-md-4 col-sm-6 grid-margin stretch-card">
                                        <nav>
                                            <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                                                <li class="page-item"><a class="page-link" href="#" data-abc="true">&laquo;</a></li>
                                                <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                                                <li class="page-item"><a class="page-link" href="#" data-abc="true">&raquo;</a></li>
                                            </ul>
                                        </nav>
                            </div>
                        </div>
                    </div>


                    <div>
                        <div class="text-center" id="searchForm" style="margin-bottom: 100px;">
                         
                            <select name="sk" class="form-control" style="width: 100px; display: inline-block;">
                                <option value="tit">제목</option>
                                <option value="tit">내용</option>
                                <option value="tit">제목 + 내용</option>
                                <option value="tit">닉네임</option>
                            </select> 
                            <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
                            <button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block;">검색</button>
                        </div>
                    </div>
            </div>

        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
     <script>
    $(function(){
		$("#boardManage").attr('class','nav-link px-4 active bg-primary text-white shadow-sm rounded-pill');
	});
    
    
  //게시글 상세보기 기능 (jquery를 통해 작업)
	$("#list-table td:not(:first-child)").on("click",function(){
			var boardNo = $(this).parent().children().eq(1).text();
			
			var boardCode = $(this).parent().children().eq(2).text();
			
		  var boardViewURL = null;
		  if(boardCode == 1) boardViewURL = "${contextPath}/board/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 2) boardViewURL = "${contextPath}/review/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 3) boardViewURL = "${contextPath}/admin/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 4) boardViewURL = "${contextPath}/admin/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 6) boardViewURL = "${contextPath}/cafe/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 7) boardViewURL = "${contextPath}/findFriend/deleteManage/"+ boardCode + "/" + boardNo;
		  else if(boardCode == 8) boardViewURL = "${contextPath}/market/deleteManage/"+ boardCode + "/" + boardNo;
		  
		  
		  	  /* console.log("boardCode : " + boardCode)
			  console.log(boardNo);
			  console.log(boardViewURL); */
		  
			
		location.href = boardViewURL; // 요청 전달
	
	});
  
  
  
  
	$("#recoverBtn").on("click", function(){
    	var list = [];
    	
    	$("input:checkbox[name='ck']:checked").length;
        
        $('input[type="checkbox"]:checked').each(function (index) {
        		
        		/* if($(this).val() != "on"){
  					list.push($(this).val());
        		} */
        });
    	
            $.ajax({
				url : "${contextPath}/admin/recoverBoard",
				data : {"numberList" : list.join()},
				
				type : "post",
				
				success : function(result){
					 if(result > 0){ 
						swal({icon : "success" , 
				        	title : "복구 성공", 
				        	buttons : {confirm : true}}
				        ).then((result) => {
					        	if(result) {
									location.reload();
					        	}	
					        }
				        );
						
					} 
				},
				error : function(){
					console.log("복구 실패");
				}
			});  
        	
    });
</script>
</body>
</html>