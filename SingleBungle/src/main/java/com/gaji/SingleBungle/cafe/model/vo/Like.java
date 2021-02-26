package com.gaji.SingleBungle.cafe.model.vo;

public class Like {
	private int memberNo; 	// 회원번호
	private int cafeNo; 	// 게시글번호
	
	public Like() {
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	@Override
	public String toString() {
		return "Like [memberNo=" + memberNo + ", cafeNo=" + cafeNo + "]";
	}
	
	
}
