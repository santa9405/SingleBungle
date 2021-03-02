package com.gaji.SingleBungle.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewAttachment;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

public interface ReviewService {

	/** 전체 게시글 수 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	ReviewPageInfo getPageInfo(int cp);
	
	

	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return rList
	 */
	List<Review> selectList(ReviewPageInfo pInfo);

	
	
	/** 게시글 썸네일 조회
	 * @param rList
	 * @return thList
	 */
	List<ReviewAttachment> selectThumbnailList(List<Review> rList);

	/** 게시글 상세 조회
	 * @param boardNo
	 * @return review
	 */
	Review selectReview(int boardNo);


	
	/** 조회수 상위 3 게시글 조회
	 * @return list
	 */
	List<Review> reviewListTop3();



	/** 게시글 등록 _+ 파일 업로드 Service
	 * @param map
	 * @param images
	 * @param savePath
	 * @return result
	 */
	int insertReview(Map<String, Object> map, String savePath);



	/** summernote에 업로드된 이미지 저장
	 * @param uploadFile
	 * @param savePath
	 * @return at
	 */
	ReviewAttachment insertImage(MultipartFile uploadFile, String savePath);





}
