<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 읽기</title>
</head>
<body>


<div id="readMessage" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">보낸사람 :</h5>	
			</div>
			<div class="modal-body">
				<div class="messageArea" style="border: 1px solid black;height: 150px;"></div>
			</div>
			<div class="modal-footer" >
			<!-- 답장하기는 남이 보낸 메세지에서만 나옴, 로그인된 회원번호 / 보낸 회원번호가 같다면 출력 안 됨  -->
        <div class="col"><button type="submit" class="btn btn-success btn-block" data-dismiss="modal"><span class="plan">답장</span></button></div>
        <div class="col"><button type="button" class="btn btn-reset btn-block" data-dismiss="modal"><span class="plan">닫기</span></button></div>
			</div>
		</div>
	</div>
</div>

</body>
</html>