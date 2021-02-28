package com.gaji.SingleBungle.market.model.vo;

public class MarketAttachment {
	
	private int fileNo; 		// 이미지번호
	private String filePath;	// 파일경로
	private String fileName;	// 파일이름
	private int marketNo;		// 게시글번호
	
	
	public MarketAttachment() {
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

	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}

	@Override
	public String toString() {
		return "MarketAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", marketNo=" + marketNo + "]";
	}

	
}
