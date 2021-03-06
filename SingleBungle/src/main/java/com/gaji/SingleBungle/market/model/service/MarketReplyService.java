package com.gaji.SingleBungle.market.model.service;

import java.util.List;

import com.gaji.SingleBungle.market.model.vo.MarketReply;

public interface MarketReplyService {

	/** 댓글 목록 조회
	 * @param parentMarketNo
	 * @return rList
	 */
	List<MarketReply> selectReplyList(int parentMarketNo);

	/** 댓글 삽입
	 * @param reply
	 * @return results
	 */
	int insertReply(MarketReply reply);

	/** 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(MarketReply reply);

	/** 댓글 삭제 Serivce
	 * @param replyNo
	 * @return result
	 */
	int deleteReply(int replyNo);
	
}
