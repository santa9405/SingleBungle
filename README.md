# ⭐️Portfolio - SingleBungle


<!-- contents -->
<details open="open">
  <summary>Contents</summary>
  <ol>
    <li>
      <a href="#개요">개요</a>
    </li>
    <li>
      <a href="#내용">내용</a>
    </li>
    <li><a href="#구현-기능">구현 기능</a>
      <ul>
        <li><a href="#만남의-광장-게시글-목록-조회">만남의 광장 게시글 목록 조회</a></li>
        <li><a href="#만남의-광장-게시글-등록">만남의 광장 게시글 등록</a></li>
        <li><a href="#만남의-광장-게시글-수정">만남의 광장 게시글 수정</a></li>
        <li><a href="#만남의-광장-게시글-삭제">만남의 광장 게시글 삭제</a></li>
        <li><a href="#search">검색(카테고리)</a></li>
        <li><a href="#reply">댓글/답글 작성, 수정, 삭제, 신고</a></li>
        <li><a href="#참여신청">참여신청</a></li>
        <li><a href="#채팅">채팅</a></li>
      </ul>
    </li>
  </ol>
</details>

------------

# 📝개요

* 프로젝트 명 : SingleBungle

* 일정 : 2021년 01월 29일 ~ 2021년 03월 11일

* 개발 목적 : 1인 가구의 정보를 공유하고 소통할 수 있는 커뮤니티 사이트 제작

* 개발 환경
  - O/S : Windows 10
  - Server : Apache-tomcat-8.5.61
  - Java EE IDE : Eclipse ( version 2020-06 (4.16.0) )
  - Database : Oracle SQL Developer ( version 20.2.0 )
  - Programming Language : JAVA, HTML, CSS, JavaScript, JSP, SQL
  - Framework/flatform : Spring, mybatis, jQuery 3.5.1, Bootstrap v4.6.x
  - API : WebSocket, Kakao map, summernote
  - Version management : Git

------------

# 📝내용

* 팀원별 역할
  - 공통 : 기획, 요구 사항 정의, 와이어 프레임, DB 설계
  - 강수정 : 만남의 광장 게시판 CRUD, 채팅
  - 강보령 : 싱글이의 영수증 게시판 CRUD, 쪽지
  - 김현혜 : 공지사항 게시판 CRUD, 고객센터 게시판 CRUD, 관리자
  - 신주희 : 회원가입, 로그인, 마이페이지
  - 이솔이 : 일상을 말해봐 게시판 CRUD, 먹보의 하루 게시판 CRUD
  - 이한솔 : 벙글 장터 게시판 CRUD

* 프로젝트 시 활용해본 대표 기술
  - WebSocket을 이용한 실시간 채팅

* 구현 기능
  - 만남의 광장 게시글 등록, 수정, 삭제, 신고
  - 검색(카테고리)
  - 댓글/답글 작성, 수정, 삭제, 신고
  - 채팅(WebSocket)

* 설계의 주안점
  - 먹보의 하루 게시판 글 작성 시 맛집 위치를 지도에 표시할 수 있도록 할 것.
  - 벙글 장터 게시판 글 작성 시 작성자의 동네 위치를 인증할 것.
  - 만남의 광장 게시판 참여 회원 간의 채팅이 가능할 수 있도록 할 것.
  - 원활한 소통을 위해 회원 간의 쪽지 보내기/받기가 가능하게 할 것.

* DB 설계<br>
![singlebungle](https://user-images.githubusercontent.com/72387870/111110444-e7c9fa00-859f-11eb-926b-ac04e8e5d0ab.png)
