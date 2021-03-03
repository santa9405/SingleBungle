package com.gaji.SingleBungle.findFriend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.findFriend.controller.FindFriendReplyController;
import com.gaji.SingleBungle.findFriend.model.dao.FindFriendReplyDAO;

@Service
public class FindFriendReplyServiceImpl implements FindFriendReplyService {

	@Autowired
	private FindFriendReplyDAO dao;

	// 댓글 목록 조회 Service 구현
	@Override
	public List<FindFriendReplyController> selectReplyList(int friendNo) {
		return dao.selectReplyList(friendNo);
	}
}
