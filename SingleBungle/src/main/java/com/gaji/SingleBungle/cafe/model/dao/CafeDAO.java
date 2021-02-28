package com.gaji.SingleBungle.cafe.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;

@Repository
public class CafeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 맛집게시판 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("cafeMapper.getListCount");
	}

	
	/** 게시글 목록 조회 DAO
	 * @param cpInfo
	 * @return cList
	 */
	public List<Cafe> selectList(CafePageInfo cpInfo) {
		
		int offset = (cpInfo.getCurrentPage() - 1) * cpInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, cpInfo.getLimit());
		
		return sqlSession.selectList("cafeMapper.selectList", cpInfo, rowBounds);
	}


	/** 썸네일 목록 조회 DAO
	 * @param cList
	 * @return thList
	 */
//	public List<CafeAttachment> selectThumbnailList(List<Cafe> cList) {
//		return sqlSession.selectList("cafeMapper.selectThumbnailList", cList);
//	}

}
