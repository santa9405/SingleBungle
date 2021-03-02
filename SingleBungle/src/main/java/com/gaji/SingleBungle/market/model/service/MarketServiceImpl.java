package com.gaji.SingleBungle.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.market.model.dao.MarketDAO;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;

@Service
public class MarketServiceImpl implements MarketService {
	
	
	@Autowired
	private MarketDAO dao;
	
	// 페이징 처리 객체 생성 Service 구현
	@Override
	public MarketPageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		return new MarketPageInfo(cp, listCount); 
	}

	
	// 게시글 목록 조회 Service 구현
	@Override
	public List<Market> selectList(MarketPageInfo mpInfo) {
		return dao.selectList(mpInfo);
	}

	
	// 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Market selectMarket(int marketNo) {
		
		Market temp = new Market();
		temp.setMarketNo(marketNo);
		
		Market market = dao.selectMarket(temp);
		
		if(market != null) {
			int result = dao.increaseReadCount(marketNo);
			
			if(result > 0) {
				market.setReadCount(market.getReadCount() + 1);
			}
		}
		return market;
	}

	
	// 좋아요 목록 조회 Service 구현
	@Override
	public List<MarketLike> selectLike(int memberNo) {
		return dao.selectLike(memberNo); 
	}

	// 좋아요 증가 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int increaseLike(Map<String, Object> map) {
		
		return dao.increaseLike(map);
	}

	// 좋아요 감소 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int decreaseLike(Map<String, Object> map) {
		return dao.decreaseLike(map);
	}

}
