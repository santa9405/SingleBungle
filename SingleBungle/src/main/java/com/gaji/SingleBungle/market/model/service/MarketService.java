package com.gaji.SingleBungle.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketAttachment;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;
import com.gaji.SingleBungle.market.model.vo.MarketSearch;

public interface MarketService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	MarketPageInfo getPageInfo(int cp);

	/** 게시글 목록 조회 Service
	 * @param mpInfo
	 * @return mList
	 */
	List<Market> selectList(MarketPageInfo mpInfo);
	
	
	/** 썸네일 목록 조회 Service
	 * @param mList
	 * @return thList
	 */
	List<MarketAttachment> selectThumbnailList(List<Market> mList);
	

	/** 상세조회 Service
	 * @param marketNo
	 * @return market
	 */
	Market selectMarket(int marketNo);
	
	
	/** 좋아요 여부 확인 Service
	 * @param map
	 * @return likeP
	 */
	int selectLikePushed(Map<String, Integer> map);
	
	/** 게시글 상세조회 이미지 Service
	 * @param marketNo
	 * @return attachmentList
	 */
	List<MarketAttachment> selectAttachmentList(int marketNo);
	

	/** 좋아요 목록 조회 Service
	 * @param memberNo
	 * @return
	 */
	List<MarketLike> selectLike(int memberNo);

	/** 좋아요 증가 Service
	 * @param map 
	 * @return result
	 */
	int increaseLike(Map<String, Object> map);

	/** 좋아요 감소 Service
	 * @param map
	 * @return result
	 */
	int decreaseLike(Map<String, Object> map);

	/** 게시글 등록 Service
	 * @param market
	 * @param images
	 * @param savePath
	 * @return result
	 */
	int insertMarket(Market market, List<MultipartFile> images, String savePath);

	int reservation(Map<String, Integer> map);

	/** 검색 조건이 포함된 페이징 처리 객체 생성 Service
	 * @param mSearch
	 * @param cp
	 * @return listCount
	 */
	MarketPageInfo getSearchPageInfo(MarketSearch mSearch, int cp);

	/** 검색 조건이 포함된 게시글 목록 조회 Service
	 * @param mSearch
	 * @param pInfo
	 * @return mList
	 */
	List<Market> selectSearchList(MarketSearch mSearch, MarketPageInfo pInfo);

	/** 게시글 신고
	 * @param map
	 * @return result
	 */
	int insertReviewReport(Map<String, Object> map);

	




	

}
