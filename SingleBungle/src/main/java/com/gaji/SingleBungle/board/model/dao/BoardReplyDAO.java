package com.gaji.SingleBungle.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.board.model.vo.BoardReply;

@Repository
public class BoardReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<BoardReply> selectReplyList(int parentBoardNo) {
		return sqlSession.selectList("boardReplyMapper.selectReplyList", parentBoardNo);
	}

}
