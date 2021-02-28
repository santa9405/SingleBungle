package com.gaji.SingleBungle.market.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;

@Repository
public class MarketDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 사고팔고 전체 게시글 수 조회  DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("marketMapper.getListCount");
	}

	
	/** 게시글 목록 조회 DAO
	 * @param mpInfo
	 * @return mList
	 */
	public List<Market> selectList(MarketPageInfo mpInfo) {
		int offset = (mpInfo.getCurrentPage() - 1) * mpInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, mpInfo.getLimit());
		return sqlSession.selectList("marketMapper.selectList", mpInfo, rowBounds);
	}

}
