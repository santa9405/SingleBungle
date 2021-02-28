package com.gaji.SingleBungle.board.model.vo;

public class BoardAttachment {
	
	private int fileNo; 		// 이미지번호
	private String filePath;	// 파일경로
	private String fileName;	// 파일이름
	private int parentBoardNo;		// 게시글번호
	
	
	public BoardAttachment() {
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
		return "BoardAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", parentBoardNo=" + parentBoardNo + "]";
	}

	

	
}
