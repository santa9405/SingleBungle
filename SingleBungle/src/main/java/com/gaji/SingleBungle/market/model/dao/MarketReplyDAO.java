package com.gaji.SingleBungle.market.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.market.model.vo.MarketReply;


@Repository
public class MarketReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentMarketNo
	 * @return rList
	 */
	public List<MarketReply> selectReplyList(int parentMarketNo) {
		return sqlSession.selectList("marketReplyMapper.selectReplyList", parentMarketNo);
	}

	/** 댓글 삽입
	 * @param reply
	 * @return result
	 */
	public int insertReply(MarketReply reply) {
		return sqlSession.insert("marketReplyMapper.insertReply", reply);
	}

	/** 댓글 수정 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(MarketReply reply) {
		return sqlSession.update("marketReplyMapper.updateReply", reply);
	}

	public int deleteReply(int replyNo) {
		return sqlSession.update("marketReplyMapper.deleteReply", replyNo);
	}

	/** 답글 삽입 DAO
	 * @param reply
	 * @return result
	 */
	public int insertChildReply(MarketReply reply) {
		return sqlSession.insert("marketReplyMapper.insertChildReply", reply);
	}
	


}
