package com.gaji.SingleBungle.board.model.service;

import java.util.List;

import com.gaji.SingleBungle.board.model.vo.BoardReply;

public interface BoardReplyService {

	
	/** 댓글 목록 조회 Service
	 * @param parentBoardNo
	 * @return rList
	 */
	public abstract List<BoardReply> selectReplyList(int parentBoardNo);
	
	

}
