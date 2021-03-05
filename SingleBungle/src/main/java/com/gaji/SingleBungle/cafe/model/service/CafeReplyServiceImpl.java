package com.gaji.SingleBungle.cafe.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	// 댓글 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(CafeReply reply) {
		
		reply.setReplyContent( replaceParameter ( reply.getReplyContent() ) );
		reply.setReplyContent( reply.getReplyContent().replaceAll("\n", "<br>") );
		
		return dao.insertReply(reply);
	}
	
	// 댓글 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(CafeReply reply) {
		
		reply.setReplyContent( replaceParameter( reply.getReplyContent() ) );
		reply.setReplyContent( reply.getReplyContent().replaceAll("\n", "<br>"));
		
		return dao.updateReply(reply);
	}

	// 댓글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}

	// 답글 삽입 Service 구현
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertChildReply(CafeReply reply) {
		return dao.insertChildReply(reply);
	}
	
	
	
	// 크로스 사이트 스크립트 방지 메소드
	private String replaceParameter(String param) {
		
		String result = param;
		
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	

}
