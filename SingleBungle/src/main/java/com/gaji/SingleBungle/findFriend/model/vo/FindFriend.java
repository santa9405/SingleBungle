package com.gaji.SingleBungle.findFriend.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class FindFriend {
	
	private int friendNo;			// 게시글  번호
	private String friendTitle; 	// 게시글 제목
	private String friendContent;   // 게시글 내용
	private String location1;		// 지역
	private String location2;		// 모임 장소
	private Date meetingDate;		// 모임 날짜
	private Timestamp meetingTime;  // 모임 시간
	private String gender;			// 성별
	private int capacity;			// 모집인원
	private Timestamp createDt;		// 작성일
	private int readCount;			// 조회수
	private String boardStatus;		// 삭제 여부
	private int categoryCd;			// 카테고리 코드
	private int memNo;				// 회원 번호
	
	public FindFriend() {
	}
	
	

}
