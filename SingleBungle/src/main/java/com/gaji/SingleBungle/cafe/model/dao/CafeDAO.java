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

	/** 게시글 상세조회 DAO
	 * @param temp
	 * @return cafe
	 */
	public Cafe selectCafe(Cafe temp) {
		return sqlSession.selectOne("cafeMapper.selectCafe", temp);
	}


	/** 게시글 조회수 증가 DAO
	 * @param cafeNo
	 * @return result
	 */
	public int increaseReadCount(int cafeNo) {
		return sqlSession.update("cafeMapper.increaseReadCount", cafeNo);
	}


	/** 게시글에 포함된 이미지 목록 조회 DAO
	 * @param cafeNo
	 * @return attachmentList
	 */
	public List<CafeAttachment> selectAttachmentList(int cafeNo) {
		return sqlSession.selectList("cafeMapper.selectAttachmentList", cafeNo);
	}



}
