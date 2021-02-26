package com.gaji.SingleBungle.cafe.model.vo;

import java.sql.Timestamp;

public class Reply {
	
	private int replyNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDate;	// 댓글 작성일
	private String replyStatus;			// 댓글 상태
	private int memberNo;				// 댓글 작성 회원 번호
	private int parentCafeNo;			// 댓글이 작성된 게시글 번호
	private int parentReplyNo;			// 부모 댓글 번호
	private int replyDepth;				// 댓글 깊이
	private String nickname; 			// 회원닉네임
	private String memberGrade; 		// 회원등급코드

	public Reply() {
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Timestamp replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getParentCafeNo() {
		return parentCafeNo;
	}

	public void setParentCafeNo(int parentCafeNo) {
		this.parentCafeNo = parentCafeNo;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public int getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyStatus=" + replyStatus + ", memberNo=" + memberNo + ", parentCafeNo=" + parentCafeNo
				+ ", parentReplyNo=" + parentReplyNo + ", replyDepth=" + replyDepth + ", nickname=" + nickname
				+ ", memberGrade=" + memberGrade + "]";
	}

	
	

}
