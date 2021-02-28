<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고팔고 한줄평 남기기</title>

  	
  <style>

  </style>
  
  
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
							<div class="col-md-2">
				</div>
				<div class="col-md-8">
					 <header class="main-header">
    <div class="container">
      <nav class="navbar navbar-expand-lg main-nav px-0">
        <a class="navbar-brand" href="/mojo">
					      <img src="http://rajeshdas.com/assets/images/logo.svg" alt="rajeshdas.com">
					    </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar icon-bar-1"></span>
                        <span class="icon-bar icon-bar-2"></span>
                        <span class="icon-bar icon-bar-3"></span>
                    </button>
        <div class="m-auto" id="mainMenu">
          <ul class="navbar-nav ml-auto text-uppercase f1">
            <li>
              <a href="#about">구매 내역</a>
            </li>
            <li>
              <a href="#service">판매 내역</a>
            </li>
            <li>
              <a href="#project">거래 후기</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <!-- /.container -->
  </header>
					<div class="row text-center">
					<div class="col-md-6" style="width: 30%; float:none; margin:0 auto">
					<div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded ">
                        <div class="d-flex flex-row"><img class="rounded" src="https://i.imgur.com/QRwjbm5.jpg" width="60" >
                            <div class="ml-2"><span class="font-weight-bold d-block">Iphone 11 pro</span><span class="spec">256GB, Navy Blue</span></div>
                        </div>
                    </div>
                    
                    
                    <div class="btnArea">
                        <button type="button" class="reviewBtn btn btn-secondary btn-lg btn-block">후기 남기기</button>
                    </div>
                    </div>
                    </div>
                    
                    
          <div class="row">
					<div class="col-md-8" style="width: 30%; float:none; margin:0 auto">
					<hr>
         	<div class="reviewArea">
						<div class="reviewerArea">
							<a href="#" class="reviewerNickname">인간자바</a>
							<span class="createDt">2021.02.12</span>
						</div>
						<div class="star">
							<img src="${contextPath}/resources/images/star.png" width="16">
							<img src="${contextPath}/resources/images/star.png" width="16">
							<img src="${contextPath}/resources/images/star.png" width="16">
						</div>
						<div class="marketView">
							<a href="#" class="marketViewGo">
								<button class="marketViewBtn" width="6" height="10">3일 사용한 안마기 팝니다.</button> 
							</a>
						</div>
						
						
						<div class="reviewContentArea">3일 사용이라 했는데 더 사용하신 것 같아요;;</div>
						
						</div>
						<hr>
						</div>
						
					</div>   
            
					
				</div>
								<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <!-- Scripts -->
  <script src="scripts/index.js"></script>
</body>
</html>