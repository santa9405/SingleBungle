package com.gaji.SingleBungle.findFriend.model.service;

import java.util.List;

import com.gaji.SingleBungle.findFriend.controller.FindFriendReplyController;

public interface FindFriendReplyService {

	/** 댓글 목록 조회 Service
	 * @param friendNo
	 * @return rList
	 */
	List<FindFriendReplyController> selectReplyList(int friendNo);

}
