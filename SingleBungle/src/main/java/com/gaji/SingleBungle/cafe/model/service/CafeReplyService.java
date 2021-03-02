package com.gaji.SingleBungle.cafe.model.service;

import java.util.List;

import com.gaji.SingleBungle.cafe.model.vo.CafeReply;

public interface CafeReplyService {

	/** 댓글 목록 조회 Service
	 * @param cafeNo
	 * @return rList
	 */
	List<CafeReply> selectReplyList(int cafeNo);

}
