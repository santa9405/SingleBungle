package com.gaji.SingleBungle.findFriend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.findFriend.controller.FindFriendReplyController;
import com.gaji.SingleBungle.findFriend.model.dao.FindFriendReplyDAO;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendReply;

@Service
public class FindFriendReplyServiceImpl implements FindFriendReplyService {

	@Autowired
	private FindFriendReplyDAO dao;

	// 댓글 목록 조회 Service 구현
	@Override
	public List<FindFriendReplyController> selectReplyList(int friendNo) {
		return dao.selectReplyList(friendNo);
	}

	// 댓글 삽입 Service 구현
	@Override
	public int insertReply(FindFriendReply reply) {
		
		reply.setReplyContent( replaceParameter( reply.getReplyContent() ) );
		reply.setReplyContent( reply.getReplyContent().replaceAll("\n", "<br>"));
		
		return dao.insertReply(reply);
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
