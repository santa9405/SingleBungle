package com.gaji.SingleBungle.cafe.model.vo;

public class CafeAttachment {
	
	private int fileNo; 		// 이미지번호
	private String filePath;	// 파일경로
	private String fileName;	// 파일이름
	private int cafeNo;		// 게시글번호
	
	public CafeAttachment() {
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

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	@Override
	public String toString() {
		return "CafeAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", cafeNo="
				+ cafeNo + "]";
	}
	
	

}
