package com.gaji.SingleBungle.market.model.vo;

public class MarketAttachment {
	
	private int fileNo; 		// 이미지번호
	private String filePath;	// 파일경로
	private String fileName;	// 파일이름
	private int parentMarketNo;		// 게시글번호
	
	public MarketAttachment() {
		// TODO Auto-generated constructor stub
	} 

	public MarketAttachment(int fileNo, String filePath, String fileName, int parentMarketNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.parentMarketNo = parentMarketNo;
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

	public int getParentMarketNo() {
		return parentMarketNo;
	}

	public void setParentMarketNo(int parentMarketNo) {
		this.parentMarketNo = parentMarketNo;
	}

	@Override
	public String toString() {
		return "MarketAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", parentMarketNo=" + parentMarketNo + "]";
	}
}
