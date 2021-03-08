<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>

<style>
	#send {
				position: fixed;
				bottom: 100px;
				right: 100px;
	}
</style>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 사용을 위한 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<body>

<!-- 쪽지 보내기 임시   -->
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<button id="send" class="btn" data-toggle="modal" data-target="#sendMessage" >쪽지 보내기</button>
</div>
<!-- Modal HTML -->
<div id="sendMessage" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
		</div>
	</div>
</div>   
<!-- 쪽지 END -->


<script>
//--------------------------------------------------------------------------
// 메세지 보내기 
$(".modal-content").load("${contextPath}/message/sendMessageModal");

</script>

</body>
</html>