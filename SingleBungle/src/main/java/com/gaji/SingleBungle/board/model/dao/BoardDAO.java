package com.gaji.SingleBungle.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 자유게시판 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}


	/** 게시글 목록 조회 DAO
	 * @param bpInfo
	 * @return bList
	 */
	public List<Board> selectList(BoardPageInfo bpInfo) {
		
		int offset = (bpInfo.getCurrentPage() - 1) * bpInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, bpInfo.getLimit());
		
		return sqlSession.selectList("boardMapper.selectList", bpInfo, rowBounds);
	}





	
}
