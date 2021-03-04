package com.gaji.SingleBungle.cafe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.cafe.model.vo.CafeReply;

@Repository
public class CafeReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 댓글 목록 조회 DAO
	 * @param cafeNo
	 * @return rList
	 */
	public List<CafeReply> selectReplyList(int cafeNo) {
		return sqlSession.selectList("cafeReplyMapper.selectReplyList", cafeNo);
	}

}
