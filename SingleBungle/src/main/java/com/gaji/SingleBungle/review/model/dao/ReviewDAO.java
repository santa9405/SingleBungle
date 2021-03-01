package com.gaji.SingleBungle.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}

	
	
	
	/** 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return rList
	 */
	public List<Review> selcetList(ReviewPageInfo pInfo) {
		 // RowBounds 객체 : offset과 limit를 이용하여 조회 결과 중 일부 행만 조회하는
	     //                마이바티스 객체
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pInfo.getLimit());
		
		return sqlSession.selectList("reviewMapper.selectList", pInfo, rowBounds);
	}




	/** 상세조회 DAO
	 * @param boardNo
	 * @return review
	 */
	public Review selectReview(int boardNo) {

		return sqlSession.selectOne("reviewMapper.selectReview",boardNo);
	}




	public int increaseReadCount(int boardNo) {
		
		return sqlSession.update("reviewMapper.increaseReadCount", boardNo);
	}
	


}
