package com.gaji.SingleBungle.review.model.service;

import java.util.List;

import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

public interface ReviewService {

	/** 전체 게시글 수 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	ReviewPageInfo getPageInfo(int cp);
	
	

	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return rList
	 */
	List<Review> selectList(ReviewPageInfo pInfo);

}
