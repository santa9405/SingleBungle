package com.gaji.SingleBungle.cafe.model.dao;

import java.util.List;
import java.util.Map;

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
	public List<CafeAttachment> selectThumbnailList(List<Cafe> cList) {
		return sqlSession.selectList("cafeMapper.selectThumbnailList", cList);
	}

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


	/** 다음 게시글 번호 얻어오기 DAO
	 * @return cafeNo
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("cafeMapper.selectNextNo");
	}


	/** 게시글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("cafeMapper.insertBoard", map);
	}


	/** 게시글 삭제 DAO
	 * @param cafe
	 * @return result
	 */
	public int deleteCafe(Cafe cafe) {
		return sqlSession.update("cafeMapper.deleteCafe", cafe);
	}

	/** 검색 게시글 수 조회 DAO
	 * @param map
	 * @return 
	 */
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("cafeMapper.getSearchListCount", map);
	}

	/** 게시글 검색 목록 조회 DAO
	 * @param map
	 * @param bpInfo
	 * @return cList
	 */
	public List<Cafe> selectSearchList(Map<String, Object> map, CafePageInfo cpInfo) {
		int offset = (cpInfo.getCurrentPage() -1) * cpInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, cpInfo.getLimit());
		
		return sqlSession.selectList("cafeMapper.selectSearchList", map, rowBounds);
	}

 
	/** 조회수 상위 3 게시글 조회 DAO
	 * @return list
	 */
	public List<Cafe> cafeListTop3() {
		return sqlSession.selectList("cafeMapper.cafeListTop3");
	}


	/** 파일 정보 삽입 DAO
	 * @param uploadImages
	 * @return
	 */
	public int insertAttachmentList(List<CafeAttachment> uploadImages) {
		return sqlSession.insert("cafeMapper.insertAttachmentList", uploadImages);
	}


//	/** 조회수 상위 3 게시글 썸네일 조회 DAO
//	 * @param cafeList
//	 * @return
//	 */
//	public List<CafeAttachment> selectThumbnailList2(List<Cafe> cafeList) {
//		return sqlSession.selectList("cafeMapper.selectThumbnailList2", cafeList);
//	}
	
	



}
