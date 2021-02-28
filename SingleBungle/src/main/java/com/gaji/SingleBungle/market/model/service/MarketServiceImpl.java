package com.gaji.SingleBungle.market.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.market.model.dao.MarketDAO;
import com.gaji.SingleBungle.market.model.vo.Market;
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

}
