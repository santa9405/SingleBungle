package com.gaji.SingleBungle.message.model.vo;

import java.sql.Timestamp;

public class Message {
	
	private int messageNo;
	private int sendMember;
	private int receiveMember;
	private String sendNickName;
	private String receiveNickName;
	private String messageContent;
	private Timestamp createDt;
	private String messageStatus;
	
	 
	private void name() {}


	public int getMessageNo() {
		return messageNo;
	}


	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}


	public int getSendMember() {
		return sendMember;
	}


	public void setSendMember(int sendMember) {
		this.sendMember = sendMember;
	}


	public int getReceiveMember() {
		return receiveMember;
	}


	public void setReceiveMember(int receiveMember) {
		this.receiveMember = receiveMember;
	}


	public String getSendNickName() {
		return sendNickName;
	}


	public void setSendNickName(String sendNickName) {
		this.sendNickName = sendNickName;
	}


	public String getReceiveNickName() {
		return receiveNickName;
	}


	public void setReceiveNickName(String receiveNickName) {
		this.receiveNickName = receiveNickName;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public Timestamp getCreateDt() {
		return createDt;
	}


	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}


	public String getMessageStatus() {
		return messageStatus;
	}


	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}


	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", sendMember=" + sendMember + ", receiveMember=" + receiveMember
				+ ", sendNickName=" + sendNickName + ", receiveNickName=" + receiveNickName + ", messageContent="
				+ messageContent + ", createDt=" + createDt + ", messageStatus=" + messageStatus + "]";
	}
	
	
	
	
}
