package com.gaji.SingleBungle.market.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
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


	/** 상세조회 DAO
	 * @param temp
	 * @return market
	 */
	public Market selectMarket(Market temp) {
		return sqlSession.selectOne("marketMapper.selectMarket", temp);
	}


	/** 조회수 증가 DAO
	 * @param marketNo
	 * @return
	 */
	public int increaseReadCount(int marketNo) {
		return sqlSession.update("marketMapper.increaseReadCount", marketNo);
	}


	/** 좋아요 목록 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public List<MarketLike> selectLike(int memberNo) {
		return sqlSession.selectList("marketMapper.selectLike", memberNo);
	}


	/** 좋아요 증가 DAO
	 * @param map
	 * @return result
	 */
	public int increaseLike(Map<String, Object> map) {
		return sqlSession.insert("marketMapper.increaseLike", map);
	}


	/** 좋아요 감소 DAO
	 * @param map
	 * @return result
	 */
	public int decreaseLike(Map<String, Object> map) {
		return sqlSession.delete("marketMapper.decreaseLike", map);
	}

}
