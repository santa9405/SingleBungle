package com.gaji.SingleBungle.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/** 자유게시판 전체 게시글 수 조회 DAO
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("mainMapper.getListCount");
	}
	

	/** 자유게시판 메인에 게시글 목록 조회 DAO
	 * @return
	 */
	public List<Board> selectList(BoardPageInfo bpInfo) {
		int offset = (bpInfo.getCurrentPage() - 1) * bpInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, bpInfo.getLimit());
		
		return sqlSession.selectList("mainMapper.selectList", bpInfo, rowBounds);
	}



}
