# Portfolio - SingleBungle

# 개요
* 프로젝트 명 : SingleBungle

* 일정 : 2021년 01월 29일 ~ 2021년 03월 11일

* 개발 목적 : 1인가구를 위한 정보 제공, 중고 물품 거래, 친구 찾기를 통해 마음이 맞는 사람들과 교류할 수 있는 커뮤니티 사이트 제작

* 개발 환경
  - O/S : Windows 10
  - Server : Apache-tomcat-8.5.61
  - Java EE IDE : Eclipse ( version 2020-06 (4.16.0) )
  - Database : Oracle SQL Developer ( version 20.2.0 )
  - Programming Language : JAVA, HTML, CSS, JavaScript, JSP, SQL
  - Client Framework : jQuery 3.5.1, Bootstrap v4.6.x
  - API : WebSocket, Kakao map, summernote
  - Version management : Git

# 내용
* 팀원별 역할
  - 공통 : 기획, 요구사항 정의, 와이어 프레임, DB설계
  - 강수정 : 만남의 광장 게시판 CRUD, 채팅
  - 강보령 : 싱글이의 영수증 게시판 CRUD, 쪽지
  - 김현혜 : 공지사항 게시판 CRUD, 고객센터 게시판 CRUD, 관리자
  - 신주희 : 회원가입, 로그인, 마이페이지
  - 이솔이 : 일상을 말해봐 게시판 CRUD, 먹보의 하루 게시판 CRUD
  - 이한솔 : 벙글장터 게시판 CRUD

* 구현 기능
  - 만남의 광장 게시글 등록, 수정, 삭제, 신고
  - 검색(카테고리)
  - 댓글/답글 작성, 수정, 삭제, 신고
  - 채팅(WebSocket)

* 설계의 주안점
  - 먹보의 하루 게시판의 맛집 위치를 지도에 표시할 것.
  - 벙글장터 글작성자의 동네 위치를 인증할 것.
  - 만남의 광장 게시판 참여회원간의 채팅이 가능하게 할 것.
  - 회원 간의 원활한 소통을 위해 쪽지가 가능하게 할 것.

* DB 설계
![singlebungle](https://user-images.githubusercontent.com/72387870/111110444-e7c9fa00-859f-11eb-926b-ac04e8e5d0ab.png)
