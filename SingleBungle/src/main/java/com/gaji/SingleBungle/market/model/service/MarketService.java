package com.gaji.SingleBungle.market.model.service;

import java.util.List;

import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;

public interface MarketService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	MarketPageInfo getPageInfo(int cp);

	/** 게시글 목록 조회 Service
	 * @param mpInfo
	 * @return mList
	 */
	List<Market> selectList(MarketPageInfo mpInfo);

	/** 상세조회 Service
	 * @param marketNo
	 * @return market
	 */
	Market selectMarket(int marketNo);

}
