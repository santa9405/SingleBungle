package com.gaji.SingleBungle.review.model.vo;

public class ReviewAttachment {
	
	
	private int fileNo;
	private String filePath;
	private String fileNm;
	private int parentBoardNo;
	
	public ReviewAttachment() {	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public int getParentBoardNo() {
		return parentBoardNo;
	}

	public void setParentBoardNo(int parentBoardNo) {
		this.parentBoardNo = parentBoardNo;
	}

	@Override
	public String toString() {
		return "ReviewAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileNm=" + fileNm
				+ ", parentBoardNo=" + parentBoardNo + "]";
	}
	
	
	

}
