package com.gaji.SingleBungle.market.model.vo;

import java.sql.Timestamp;

public class Market {
	
	private int marketNo;
	private String marketTitle;
	private String marketContent;
	private Timestamp createDt;
	private int price;
	private String location;
	private String location2;
	private String status;
	private String deliveryCharge;
	private int memNo;
	private String nickname;
	private int categoryCd;
	private int transactionCategory;
	private String categoryNm;
	
	public Market() {}

	public Market(int marketNo, String marketTitle, String marketContent, Timestamp createDt, int price,
			String location, String location2, String status, String deliveryCharge, int memNo, String nickname,
			int categoryCd, int transactionCategory, String categoryNm) {
		super();
		this.marketNo = marketNo;
		this.marketTitle = marketTitle;
		this.marketContent = marketContent;
		this.createDt = createDt;
		this.price = price;
		this.location = location;
		this.location2 = location2;
		this.status = status;
		this.deliveryCharge = deliveryCharge;
		this.memNo = memNo;
		this.nickname = nickname;
		this.categoryCd = categoryCd;
		this.transactionCategory = transactionCategory;
		this.categoryNm = categoryNm;
	}

	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}

	public String getMarketTitle() {
		return marketTitle;
	}

	public void setMarketTitle(String marketTitle) {
		this.marketTitle = marketTitle;
	}

	public String getMarketContent() {
		return marketContent;
	}

	public void setMarketContent(String marketContent) {
		this.marketContent = marketContent;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocation2() {
		return location2;
	}

	public void setLocation2(String location2) {
		this.location2 = location2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(String deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCategoryCd() {
		return categoryCd;
	}

	public void setCategoryCd(int categoryCd) {
		this.categoryCd = categoryCd;
	}

	public int getTransactionCategory() {
		return transactionCategory;
	}

	public void setTransactionCategory(int transactionCategory) {
		this.transactionCategory = transactionCategory;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	@Override
	public String toString() {
		return "Market [marketNo=" + marketNo + ", marketTitle=" + marketTitle + ", marketContent=" + marketContent
				+ ", createDt=" + createDt + ", price=" + price + ", location=" + location + ", location2=" + location2
				+ ", status=" + status + ", deliveryCharge=" + deliveryCharge + ", memNo=" + memNo + ", nickname="
				+ nickname + ", categoryCd=" + categoryCd + ", transactionCategory=" + transactionCategory
				+ ", categoryNm=" + categoryNm + "]";
	}
	
	
}
