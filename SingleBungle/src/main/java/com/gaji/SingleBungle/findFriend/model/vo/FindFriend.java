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
	
	public FindFriend() { }

	public FindFriend(int friendNo, String friendTitle, String friendContent, String location1, String location2,
			Date meetingDate, Timestamp meetingTime, String gender, int capacity, Timestamp createDt, int readCount,
			String boardStatus, int categoryCd, int memNo) {
		super();
		this.friendNo = friendNo;
		this.friendTitle = friendTitle;
		this.friendContent = friendContent;
		this.location1 = location1;
		this.location2 = location2;
		this.meetingDate = meetingDate;
		this.meetingTime = meetingTime;
		this.gender = gender;
		this.capacity = capacity;
		this.createDt = createDt;
		this.readCount = readCount;
		this.boardStatus = boardStatus;
		this.categoryCd = categoryCd;
		this.memNo = memNo;
	}

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}

	public String getFriendTitle() {
		return friendTitle;
	}

	public void setFriendTitle(String friendTitle) {
		this.friendTitle = friendTitle;
	}

	public String getFriendContent() {
		return friendContent;
	}

	public void setFriendContent(String friendContent) {
		this.friendContent = friendContent;
	}

	public String getLocation1() {
		return location1;
	}

	public void setLocation1(String location1) {
		this.location1 = location1;
	}

	public String getLocation2() {
		return location2;
	}

	public void setLocation2(String location2) {
		this.location2 = location2;
	}

	public Date getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
	}

	public Timestamp getMeetingTime() {
		return meetingTime;
	}

	public void setMeetingTime(Timestamp meetingTime) {
		this.meetingTime = meetingTime;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getCategoryCd() {
		return categoryCd;
	}

	public void setCategoryCd(int categoryCd) {
		this.categoryCd = categoryCd;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "FindFriend [friendNo=" + friendNo + ", friendTitle=" + friendTitle + ", friendContent=" + friendContent
				+ ", location1=" + location1 + ", location2=" + location2 + ", meetingDate=" + meetingDate
				+ ", meetingTime=" + meetingTime + ", gender=" + gender + ", capacity=" + capacity + ", createDt="
				+ createDt + ", readCount=" + readCount + ", boardStatus=" + boardStatus + ", categoryCd=" + categoryCd
				+ ", memNo=" + memNo + "]";
	}
	
}