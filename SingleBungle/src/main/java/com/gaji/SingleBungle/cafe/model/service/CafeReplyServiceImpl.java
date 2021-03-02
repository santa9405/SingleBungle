package com.gaji.SingleBungle.cafe.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.cafe.model.dao.CafeReplyDAO;
import com.gaji.SingleBungle.cafe.model.vo.CafeReply;

@Service
public class CafeReplyServiceImpl implements CafeReplyService {
	
	@Autowired
	private CafeReplyDAO dao;

	// 댓글 목록 조회 Service 구현
	@Override
	public List<CafeReply> selectReplyList(int cafeNo) {
		return dao.selectReplyList(cafeNo);
	}

}
