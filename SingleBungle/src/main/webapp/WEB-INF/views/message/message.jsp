<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지보내기</title>


<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

	.modal-confirm {		
		color: #636363;
		width: 400px;
		margin: 30px auto;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h5 {
		text-align: left;
		font-size: 15px;
		margin: 30px 0 -15px;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}


	.modal-confirm .modal-footer {
		border: none;
		text-align: center;
		border-radius: 5px;
		font-size: 13px;
	}	
	.modal-confirm .icon-box {
		color: rgba(2, 2, 2, 0.842);	
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -40px;
		width: 65px;
		height: 50px;
		z-index: 9;
		background: #fffc52;
        border-radius: 20%;
        
		padding: 15px;
		text-align: center;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-confirm .icon-box i {
		font-size: 80px;
		position: relative;
        bottom : 30px;
        right : 23px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}

    

    /* 버튼 정렬 */
    .col{
        display: inline-block;
    }

    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #b1b1b1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
        width:51px;
    }

    /* 전송 버튼 효과*/
    .modal-confirm .btn-success:hover, .modal-confirm .btn-success:focus {
		background: #24ca40;
		outline: none;
	}
    
    /* 닫기 버튼 효과*/
    .modal-confirm .btn-reset:hover, .modal-confirm .btn-reset:focus {
		background: #ff4f4f;
		outline: none;
	}


    /* 모달창 여는 버튼 */
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
    
    /* 쪽지 입력 창 */
    .messageText{
        width:100%;
        height: 150px;
        resize : none;
    }

    .messageText:focus{
        outline: none;
    }
</style>

</head>
<body>

<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<a href="#sendMessage" class="trigger-btn" data-toggle="modal">쪽지 보내기</a>
</div>


<!-- Modal HTML -->
<div id="sendMessage" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">mail_outline</i>
				</div>				
				<h5 class="modal-title">받는사람 :</h5>	
			</div>
			<div class="modal-body">
				<textarea class="messageText"></textarea>
			</div>
			<div class="modal-footer" >
                <div class="col"><button type="submit" class="btn btn-success btn-block" data-dismiss="modal"><span class="plan">전송</span></button></div>
                <div class="col"><button type="button" class="btn btn-reset btn-block" data-dismiss="modal"><span class="plan">닫기</span></button></div>
			</div>
		</div>
	</div>
</div>     


<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<a href="#readMessage" class="trigger-btn" data-toggle="modal">쪽지 읽기</a>
</div>

<!-- Modal HTML -->
<div id="readMessage" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">mail_outline</i>
				</div>				
				<h5 class="modal-title">보낸사람 :</h5>	
			</div>
			<div class="modal-body">
				<div class="messageArea" style="border: 1px solid black;height: 150px;"></div>
			</div>
			<div class="modal-footer" >
                <div class="col"><button type="submit" class="btn btn-success btn-block" data-dismiss="modal"><span class="plan">답장</span></button></div>
                <div class="col"><button type="button" class="btn btn-reset btn-block" data-dismiss="modal"><span class="plan">닫기</span></button></div>
			</div>
		</div>
	</div>

</body>
</html>