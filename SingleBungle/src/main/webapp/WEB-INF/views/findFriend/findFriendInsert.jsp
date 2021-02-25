<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기 게시판 글작성</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<form action="insertAction" method="post">

					<div class="form-group row">
						<label for="title" class="input-group-addon col-sm-1 col-form-label">제목</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="title" name="boardTitle" size="100%" required>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<label for="category" class="input-group-addon col-sm-1 col-form-label">카테고리</label>
						<div class="col-sm-4">
							<select class="form-control div small" id="category" name="categoryName" style="width: 150px; height: 40px;" required>
								<option value="10">맛집</option>
								<option value="20">문화생활</option>
								<option value="30">동네친구</option>
							</select>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<label for="rocation1" class="input-group-addon col-sm-1 col-form-label">지역</label>
						<div class="col-sm-11">
							<div class="row mb-3 form-row">
								<div class="col-md-4">
									<select class="form-control div small" id="rocation1" name="categoryName" style="width: 150px; height: 40px;" required>
										<option value="10">서울특별시</option>
										<option value="20">부산광역시</option>
										<option value="30">대구광역시</option>
										<option value="40">인천광역시</option>
										<option value="50">광주광역시</option>
										<option value="60">대전광역시</option>
										<option value="70">울산광역시</option>
										<option value="80">세종특별자치시</option>
										<option value="90">경기도</option>
										<option value="100">강원도</option>
										<option value="110">충청북도</option>
										<option value="120">충청남도</option>
										<option value="130">전라북도</option>
										<option value="140">전라북도</option>
										<option value="150">경상북도</option>
										<option value="160">경상남도</option>
										<option value="170">제주도</option>
									</select>
								</div>

								<label for="rocation2" class="input-group-addon col-sm-1 col-form-label">모임장소</label>
								<div class="col-md-7">
									<input type="text" class="form-control" id="rocation2" name="boardTitle" required>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<label for="meetingDate" class="input-group-addon col-sm-1 col-form-label">모임날짜</label>
						<div class="col-sm-11">
							<div class="row mb-3 form-row">
								<div class="col-md-4">
									<input type="date" class="form-control" id="meetingDate" name="boardTitle" style="width: 170px; height: 40px;" required>
								</div>
								<label for="meetingTime" class="input-group-addon col-sm-1 col-form-label">모임시간</label>
								<div class="col-md-4">
									<select class="form-control div smal" id="meetingTime" name="categoryName" style="width: 80px; height: 40px;" required>
										<option value="10">6시</option>
										<option value="20">7시</option>
										<option value="30">8시</option>
										<option value="40">9시</option>
										<option value="50">10시</option>
										<option value="60">11시</option>
										<option value="70">12시</option>
										<option value="80">13시</option>
										<option value="90">14시</option>
										<option value="100">15시</option>
										<option value="110">16시</option>
										<option value="120">17시</option>
										<option value="130">18시</option>
										<option value="140">19시</option>
										<option value="150">20시</option>
										<option value="160">21시</option>
										<option value="170">미정</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<label for="capacity" class="input-group-addon col-sm-1 col-form-label">모집인원</label>
						<div class="col-sm-11">
							<div class="row mb-3 form-row">
								<div class="col-sm-4">
									<select class="form-control div smal" id="capacity" name="categoryName" style="width: 80px; height: 40px;" required>
										<option value="10">2</option>
										<option value="20">3</option>
										<option value="30">4</option>
										<option value="40">5</option>
										<option value="50">6</option>
										<option value="60">7</option>
										<option value="70">8</option>
									</select>
								</div>
								<label for="gender" class="input-group-addon col-sm-1 col-form-label">성별</label>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="female" id="gender" value="N">
												<label class="form-check-label" for="online">여자</label>
										</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="male" id="gender" value="F">
												<label class="form-check-label" for="offline">남자</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="irrelevant" id="gender" value="F">
												<label class="form-check-label" for="offline">무관</label>
											</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div>
							<label for="content">내용</label>
						</div>
						<textarea class="form-control" id="content" name="boardContent" rows="10" style="resize: none;" required></textarea>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-secondary mb-3 btn-warning">등록</button>
						<button type="button" class="btn btn-secondary mb-3">취소</button>
					</div>
				</form>

			</div>
		</div>
	</div>

</body>
<jsp:include page="../common/footer.jsp" />

<script>
	
</script>
</body>
</html>
