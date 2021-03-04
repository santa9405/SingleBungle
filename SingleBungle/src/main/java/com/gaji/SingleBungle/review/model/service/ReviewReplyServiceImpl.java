package com.gaji.SingleBungle.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	
	
	// 댓글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Map<String, Object> map) {
		
		// 크로스 사이트 스크립팅 방지
		map.put("replyContent", replaceParameter( (String)map.get("replyContent")) );
		
		// ajax로 textarea 내용을 얻어올 경우 개행문자가 \n으로 취급됨.
		// 개행문자 처리 \n -> <br>
		map.put("replyContent", ((String)map.get("replyContent")).replaceAll("\n", "<br>") );

		return dao.insertReply(map);
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
