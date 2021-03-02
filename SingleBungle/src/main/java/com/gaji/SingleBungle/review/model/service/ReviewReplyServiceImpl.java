package com.gaji.SingleBungle.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.review.model.dao.ReviewReplyDAO;
import com.gaji.SingleBungle.review.model.vo.ReviewReply;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyDAO dao;

	
	// 댓글 목록 조회 Service 구현
	@Override
	public List<ReviewReply> selectReplyList(int parentBoardNo) {
		return dao.selectReplyList(parentBoardNo);
	}

}
