package com.gaji.SingleBungle.findFriend.model.service;

import java.util.List;

import com.gaji.SingleBungle.findFriend.controller.FindFriendReplyController;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendReply;

public interface FindFriendReplyService {

	/** 댓글 목록 조회 Service
	 * @param friendNo
	 * @return rList
	 */
	List<FindFriendReplyController> selectReplyList(int friendNo);

	/** 댓글 삽입 Service
	 * @param reply
	 * @return result
	 */
	int insertReply(FindFriendReply reply);

}
