package com.gaji.SingleBungle.findFriend.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.findFriend.controller.FindFriendReplyController;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendReply;

@Repository
public class FindFriendReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param friendNo
	 * @return rList
	 */
	public List<FindFriendReplyController> selectReplyList(int friendNo) {
		return sqlSession.selectList("replyMapper.selectReplyList", friendNo);
	}

	public int insertReply(FindFriendReply reply) {
		return sqlSession.insert("replyMapper.insertReply", reply);
	}

}
