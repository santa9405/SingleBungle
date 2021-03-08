package com.gaji.SingleBungle.message.model.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 전체 게시글 수 조회
	 * @param memberNo 
	 * @return
	 */
	public int getListCount(int memberNo) {
		
		return sqlSession.selectOne("");
	}

}
