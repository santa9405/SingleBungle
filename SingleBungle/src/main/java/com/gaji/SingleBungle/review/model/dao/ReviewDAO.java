package com.gaji.SingleBungle.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewAttachment;
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
	
	
	
	/** 썸네일 목록 조회
	 * @param rList
	 * @return thList
	 */
	public List<ReviewAttachment> selectThumbnailList(List<Review> rList) {
		return sqlSession.selectList("reviewMapper.selectThumbnailList",rList);
	}




	/** 상세조회 DAO
	 * @param boardNo
	 * @return review
	 */
	public Review selectReview(int boardNo) {

		return sqlSession.selectOne("reviewMapper.selectReview",boardNo);
	}




	/** 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseReadCount(int boardNo) {
		
		return sqlSession.update("reviewMapper.increaseReadCount", boardNo);
	}




	/** 조회수 상위 3 게시글
	 * @return list
	 */
	public List<Review> reviewListTop3() {
		return sqlSession.selectList("reviewMapper.reviewListTop3");
	}



	
	/** 게시글 번호 얻어오기
	 * @return boardNo
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("reviewMapper.selectNextNo");
	}



	/** 게시글 삽입
	 * @param map
	 * @return result
	 */
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("reviewMapper.insertBoard",map);
	}




	/** 파일 정보 삽입 DAO
	 * @param uploadImages
	 * @return result
	 */
	public int insertAttachmentList(List<ReviewAttachment> uploadImages) {
		return sqlSession.insert("reviewMapper.insertAttachmentList", uploadImages);
	}


	

	/** 게시글 수정 DAO
	 * @param updateReview
	 * @return result
	 */
	public int updateReview(Review updateReview) {
		return sqlSession.update("reviewMapper.updateReview", updateReview);
	}
	
	
	
	/** 게시글 수정 시 수정전 파일 모아두는 list
	 * @param boardNo
	 * @return attachmentList
	 */
	public List<ReviewAttachment> selectAttachmentList(int boardNo) {
		return sqlSession.selectList("reviewMapper.selectAttachmentList", boardNo);
	}


	/** 게시글 삭제 DAO
	 * @param review
	 * @return result
	 */
	public int deleteReview(Review review) {
		return sqlSession.update("reviewMapper.deleteReview",review);
	}




	/** 파일 정보 일괄 삭제 DAO
	 * @param deleteFileNoList
	 * @return result
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("reviewMapper.deleteAttachmentList", deleteFileNoList);
	}














	


}
