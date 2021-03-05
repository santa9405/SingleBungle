package com.gaji.SingleBungle.review.model.service;

import java.util.List;
import java.util.Map;

import com.gaji.SingleBungle.review.model.vo.ReviewReply;

public interface ReviewReplyService {
	
	

	/** 댓글 목록 조회
	 * @param parentBoardNo
	 * @return rList
	 */
	List<ReviewReply> selectReplyList(int parentBoardNo);

	
	
	
	/** 댓글 삽입
	 * @param reply
	 * @return result
	 */
	int insertReply(ReviewReply reply);

}
