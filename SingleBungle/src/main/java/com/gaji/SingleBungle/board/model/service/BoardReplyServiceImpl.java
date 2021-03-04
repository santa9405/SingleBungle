package com.gaji.SingleBungle.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.board.model.dao.BoardReplyDAO;
import com.gaji.SingleBungle.board.model.vo.BoardReply;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Autowired
	private BoardReplyDAO dao;

	
	// 댓글 목록 조회 Service 구현
	@Override
	public List<BoardReply> selectReplyList(int parentBoardNo) {
		return dao.selectReplyList(parentBoardNo);
	}

}
