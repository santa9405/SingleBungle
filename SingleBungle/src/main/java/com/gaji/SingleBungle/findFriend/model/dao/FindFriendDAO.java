package com.gaji.SingleBungle.findFriend.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.findFriend.model.vo.FindFriendAttachment;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendPageInfo;

@Repository
public class FindFriendDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("friendMapper.getListCount");
	}
	
	/** 전체 게시글 목록 조회
	 * @param pInfo
	 * @return
	 */
	public List<FindFriend> selectList(FindFriendPageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("friendMapper.selectList", pInfo, rowBounds);
	}
	
	/** 검색 게시글 수 조회 DAO
	 * @param map
	 * @return
	 */
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("friendMapper.getSearchListCount", map);
	}

	/** 게시글 검색 목록 조회 DAO
	 * @param map
	 * @param pInfo
	 * @return
	 */
	public List<FindFriend> selectSearchList(Map<String, Object> map, FindFriendPageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("friendMapper.selectSearchList", map, rowBounds);
	}

	/** 게시글 상세 조회 DAO
	 * @param friendNo
	 * @return findFriend
	 */
	public FindFriend selectBoard(int friendNo) {
		return sqlSession.selectOne("friendMapper.selectBoard", friendNo);
	}

	/** 다음 게시글 번호 조회 DAO
	 * @return nextBoardNo
	 */
	public int selectNextBoardNo() {
		return sqlSession.selectOne("friendMapper.selectNextBoardNo");
	}

	/** 게시글 삽입 DAO
	 * @param findFriend
	 * @return
	 */
	public int insertBoard(FindFriend findFriend) {
		return sqlSession.insert("friendMapper.insertBoard", findFriend);
	}

	/** 파일 정보 삽입 DAO
	 * @param uploadImages
	 * @return
	 */
	public int insertAttachmentList(List<FindFriendAttachment> uploadImages) {
		return sqlSession.insert("friendMapper.insertAttachmentList", uploadImages);
	}

}
