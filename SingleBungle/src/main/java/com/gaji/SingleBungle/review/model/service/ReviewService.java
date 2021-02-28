package com.gaji.SingleBungle.review.model.service;

import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

public interface ReviewService {

	/** 전체 게시글 수 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	ReviewPageInfo getPageInfo(int cp);

}
