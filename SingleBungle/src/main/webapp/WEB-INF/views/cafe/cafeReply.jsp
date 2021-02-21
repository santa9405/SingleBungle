<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지가지 - 맛집게시판 댓글 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<style>
#replyContentArea { width: 94.8%; }

#replyContentArea > textarea {
	resize: none;
	width: 100%;
}

#replyListArea {
	list-style-type: none;
}

.replyBtnArea1 > a, .replyBtnArea2 > a { color : black; }
</style>

</head>
<body>

	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
			
			<!-- 로그인 x 또는 댓글 작성자가 아닌 회원의 화면 -->
			<li class="reply-row">
				<div>
					작성자 2021.01.11 10:30
				</div>
				
                <div class="replyBtnArea1 float-right">
                <a href="#" id="replyReply">댓글</a>
                <a href="#" id="reportReply">신고</a>
                </div>

				<p class="rContent">댓글 내용1</p>

			</li>

			<!-- 로그인한 회원이 댓글 작성자인 경우 -->
			<li class="reply-row">
				<div>
					작성자 2021년 01월 11일 10:30
				</div>

                <div class="replyBtnArea2 float-right">
                    <a href="#" id="replyReply">댓글</a>
					<a href="#" id="updateReply">수정</a>
					<a href="#" id="deleteReply">삭제</a>
				</div>

				<p class="rContent">댓글 내용2</p>

			</li>
	
		</ul>
	</div>


    <div id="reply-area">
        <!-- 댓글 작성 부분 -->
        <div class="replyWrite">
            <table align="center">
                <tr>
                    <td id="replyContentArea">
                        <textArea rows="2" id="replyContent"></textArea>
                    </td>
                    <td id="replyBtnArea">
                        <button type="button" class="btn btn-secondary btn-success" id="addReply" style="width: 100px; height: 53px; display: inline-block; margin-bottom: 5px;">댓글등록</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</body>
</html>