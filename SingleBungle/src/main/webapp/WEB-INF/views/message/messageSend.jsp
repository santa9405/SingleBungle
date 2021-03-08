<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 보내기</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">



</head>
<body>
			<div class="modal-header">			
				<h5 class="modal-title">받는사람 :</h5>	
			</div>
			<div class="modal-body">
				<textarea class="messageText" style="border: 1px solid black;height: 150px; width : 100%; resize: none;"></textarea>
			</div>
			<div class="modal-footer" >
                <div class="col"><button type="submit" class="btn btn-success btn-block" data-dismiss="modal"><span class="plan">전송</span></button></div>
                <div class="col"><button type="button" class="btn btn-reset btn-block" data-dismiss="modal"><span class="plan">닫기</span></button></div>
			</div>



</body>
</html>