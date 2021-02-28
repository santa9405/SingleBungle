package com.gaji.SingleBungle.review.model.service;

import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.review.model.dao.ReviewDAO;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

@Service
public class ReviewServiceImpl implements ReviewService   {

	
	private ReviewDAO dao;
	
	
	@Override
	public ReviewPageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new ReviewPageInfo(cp,listCount);
	}

}
