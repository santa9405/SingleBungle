package com.gaji.SingleBungle.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaji.SingleBungle.review.model.dao.ReviewDAO;
import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

@Service
public class ReviewServiceImpl implements ReviewService   {

	@Autowired
	private ReviewDAO dao;
	
	// 전제 게시글 수 조회 Service 구현
	@Override
	public ReviewPageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new ReviewPageInfo(cp,listCount,2);
	}

	
	// 게시글 목록 조회 Service 구현
	@Override
	public List<Review> selectList(ReviewPageInfo pInfo) {
		return dao.selcetList(pInfo);
	}

	
	
	// 상세조회
	@Transactional(rollbackFor=Exception.class)
	@Override
	public Review selectReview(int boardNo) {
		
		
		Review review = dao.selectReview(boardNo);
		
		if(review!=null) {
			int result = dao.increaseReadCount(boardNo);
			
			if(result>0) {
				review.setReadCount(review.getReadCount() + 1);
			}
		}
		return review;
	}

}
