package com.gaji.SingleBungle.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.review.model.vo.ReviewReply;

@Repository
public class ReviewReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 댓글 목록 조회 DAO
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<ReviewReply> selectReplyList(int parentBoardNo) {
		return sqlSession.selectList("replyMapper.selectReplyList", parentBoardNo);
	}


	/** 댓글 삽입
	 * @param map
	 * @return
	 */
	public int insertReply(Map<String, Object> map) {
		return sqlSession.insert("replyMapper.insertReply", map);
	}

}
