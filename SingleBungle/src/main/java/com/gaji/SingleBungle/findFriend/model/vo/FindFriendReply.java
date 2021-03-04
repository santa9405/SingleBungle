package com.gaji.SingleBungle.findFriend.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class FindFriendReply {
	private int replyNo;			// 댓글 번호
	private String replyContent;	// 댓글 내용
	private Timestamp replyCreateDt;		// 댓글 작성일
	private String replyStatus;		// 댓글 상태
	private int replyDepth;			// 댓글 깊이
	private int parentFriendNo;		// 댓글이 작성된 게시글 번호
	private int memNo;				// 댓글 작성 회원 번호
	private int parentReplyNo;		// 부모 댓글 번호
	private String nickname;		// 닉네임

	public FindFriendReply() { }

	public FindFriendReply(int replyNo, String replyContent, Timestamp replyCreateDt, String replyStatus, int replyDepth,
			int parentFriendNo, int memNo, int parentReplyNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDt = replyCreateDt;
		this.replyStatus = replyStatus;
		this.replyDepth = replyDepth;
		this.parentFriendNo = parentFriendNo;
		this.memNo = memNo;
		this.parentReplyNo = parentReplyNo;
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

	public Timestamp getReplyCreateDt() {
		return replyCreateDt;
	}

	public void setReplyCreateDt(Timestamp replyCreateDt) {
		this.replyCreateDt = replyCreateDt;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}

	public int getParentFriendNo() {
		return parentFriendNo;
	}

	public void setParentFriendNo(int parentFriendNo) {
		this.parentFriendNo = parentFriendNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	@Override
	public String toString() {
		return "FindFriendReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDt="
				+ replyCreateDt + ", replyStatus=" + replyStatus + ", replyDepth=" + replyDepth + ", parentFriendNo="
				+ parentFriendNo + ", memNo=" + memNo + ", parentReplyNo=" + parentReplyNo + "]";
	}
		
}