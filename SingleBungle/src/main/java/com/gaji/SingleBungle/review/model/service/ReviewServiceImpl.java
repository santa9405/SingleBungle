package com.gaji.SingleBungle.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.review.model.dao.ReviewDAO;
import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

@Service
public class ReviewServiceImpl implements ReviewService   {

	@Autowired
	private ReviewDAO dao;
	
	// 전제 게시글 수 조회 Service 구현
	@Override
	public ReviewPageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new ReviewPageInfo(cp,listCount,2);
	}

	
	// 게시글 목록 조회 Service 구현
	@Override
	public List<Review> selectList(ReviewPageInfo pInfo) {
		return dao.selcetList(pInfo);
	}

	
	
	// 상세조회
	@Transactional(rollbackFor=Exception.class)
	@Override
	public Review selectReview(int boardNo) {
		
		
		Review review = dao.selectReview(boardNo);
		
		if(review!=null) {
			int result = dao.increaseReadCount(boardNo);
			
			if(result>0) {
				review.setReadCount(review.getReadCount() + 1);
			}
		}
		return review;
	}

	
	
	
	// 조회수 상위 3 게시글 조회
	@Override
	public List<Review> reviewListTop3() {
		return dao.reviewListTop3();
	}

	
	
	
	
	// 게시글 등록
	@Override
	public int insertReview(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		int result = 0; //결과 저장
		
		// 게시글 번호 얻어오기
		int boardNo = dao.selectNextNo();
		
		// 게시글 삽입
		
		
		
		
		return 0;
	}

}
