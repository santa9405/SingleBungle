package com.gaji.SingleBungle.cafe.model.service;

import java.util.List;

import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;

public interface CafeService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return cpInfo
	 */
	public abstract CafePageInfo getPageInfo(int cp);

	/** 게시글 목록 조회 Service
	 * @param cpInfo
	 * @return cList
	 */
	public abstract List<Cafe> selectList(CafePageInfo cpInfo);

	/** 썸네일 목록 조회 Service
	 * @param cList
	 * @return thList
	 */
//	public abstract List<CafeAttachment> selectThumbnailList(List<Cafe> cList);

	
	/** 게시글 상세 조회 Service
	 * @param cafeNo
	 * @return cafe
	 */
	public abstract Cafe selectCafe(int cafeNo);

	/** 게시글에 포함된 이미지 목록 조회 Service
	 * @param cafeNo
	 * @return attachmentList
	 */
	public abstract List<CafeAttachment> selectAttachmentList(int cafeNo);
	
	
}
