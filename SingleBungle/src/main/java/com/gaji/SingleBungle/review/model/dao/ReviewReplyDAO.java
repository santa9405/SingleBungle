package com.gaji.SingleBungle.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.review.model.vo.ReviewReply;

@Repository
public class ReviewReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회
	 * @param parentBoardNo
	 * @return
	 */
	public List<ReviewReply> selectReplyList(int parentBoardNo) {
		return sqlSession.selectList("reviewReplyMapper.selectReplyList", parentBoardNo);
	}

	/** 댓글 등록
	 * @param reply
	 * @return
	 */
	public int insertReply(ReviewReply reply) {
		return sqlSession.insert("reviewReplyMapper.insertReply", reply);
	}

	/** 댓글 수정
	 * @param reply
	 * @return result
	 */
	public int updateReply(ReviewReply reply) {
		return sqlSession.update("reviewReplyMapper.updateReply", reply);
	}

	/** 댓글 삭제
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("reviewReplyMapper.deleteReply", replyNo);
	}

	/** 답글 등록
	 * @param reply
	 * @return result
	 */
	public int insertChildReply(ReviewReply reply) {
		
		return sqlSession.update("reviewReplyMapper.insertChildReply", reply);
	}
	



}
