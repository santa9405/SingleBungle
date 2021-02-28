package com.gaji.SingleBungle.cafe.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaji.SingleBungle.cafe.model.dao.CafeDAO;
import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;

@Service
public class CafeServiceImpl implements CafeService {
	
	@Autowired
	private CafeDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public CafePageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new CafePageInfo(cp, listCount);
	}

	// 게시글 목록 조회 Service 구현
	@Override
	public List<Cafe> selectList(CafePageInfo cpInfo) {
		return dao.selectList(cpInfo);
	}

	// 썸네일 목록 조회 Service 구현
//	@Override
//	public List<CafeAttachment> selectThumbnailList(List<Cafe> cList) {
//		return dao.selectThumbnailList(cList);
//	}
	
	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Cafe selectCafe(int cafeNo) {
		
		Cafe temp = new Cafe();
		temp.setCafeNo(cafeNo);
		
		Cafe cafe = dao.selectCafe(temp);
		
		if(cafe != null) {
			int result = dao.increaseReadCount(cafeNo);
			
			if(result > 0) {
				cafe.setReadCount(cafe.getReadCount() + 1);
			}
		}
		
		return cafe;
	}

	// 게시글에 포함된 이미지 목록 조회 Service 구현
	@Override
	public List<CafeAttachment> selectAttachmentList(int cafeNo) {
		return dao.selectAttachmentList(cafeNo);
	}


}
