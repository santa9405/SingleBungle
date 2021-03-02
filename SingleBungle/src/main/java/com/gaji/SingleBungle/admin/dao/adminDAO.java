package com.gaji.SingleBungle.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;

@Repository
public class adminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int type) {
		return sqlSession.selectOne("adminMapper.getListCount", type);
	}

	public List<ABoard> selectList(APageInfo pInfo) {
		// RowBounds 객체 : offset과 limit를 이용하여 조회 내용 중 일부 행만 조회하는 마이바티스 객체
				int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
				
				RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("adminMapper.selectList", pInfo.getBoardType(), rowBounds);
	}

	public List<AAttachment> selectThumbnailList(List<ABoard> eventList) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectThumbnailList", eventList);
	}

	public ABoard selectBoard(ABoard temp) {
		return sqlSession.selectOne("adminMapper.selectBoard", temp);
	}

	public int increaseReadCount(int boardNo) {
		return sqlSession.update("adminMapper.increaseReadCount",boardNo);
	}

	public List<AAttachment> selectAttachmentList(int boardNo) {
		return sqlSession.selectList("adminMapper.selectAttachmentList", boardNo);
	}

	public int selectNextNo() {
		return sqlSession.selectOne("adminMapper.selectNextNo");
	}

	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("adminMapper.insertBoard",map);
	}

	public int insertAttachmentList(List<AAttachment> uploadImages) {
		return sqlSession.insert("adminMapper.insertAttachmentList", uploadImages);
	}

	public int deleteBoard(int boardNo) {
		return sqlSession.update("adminMapper.deleteBoard", boardNo);
	}
}
