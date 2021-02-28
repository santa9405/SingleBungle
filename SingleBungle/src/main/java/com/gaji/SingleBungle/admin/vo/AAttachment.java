package com.gaji.SingleBungle.admin.vo;

public class AAttachment {
	private int fileNo;
	private String filePath;
	private String fileName;
	private int parentBoardNo;
	
	public AAttachment() {}

	public AAttachment(int fileNo, String filePath, String fileName, int parentBoardNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.parentBoardNo = parentBoardNo;
	}

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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getParentBoardNo() {
		return parentBoardNo;
	}

	public void setParentBoardNo(int parentBoardNo) {
		this.parentBoardNo = parentBoardNo;
	}

	@Override
	public String toString() {
		return "AAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", parentBoardNo=" + parentBoardNo + "]";
	}
	
	
}
