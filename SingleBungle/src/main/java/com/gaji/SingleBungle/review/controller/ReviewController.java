package com.gaji.SingleBungle.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.review.model.service.ReviewService;
import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("list/2")
	public String reviewList(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		// 페이징 처리
		ReviewPageInfo pInfo = service.getPageInfo(cp);
		
		
		//게시글 목록 조회
		List<Review> rList = service.selectList(pInfo);
		
		
		
		return "review/reviewList";
	}
	
	@RequestMapping("view")
	public String reviewView() {
		return "review/reviewView";
	}
	
	@RequestMapping("insert")
	public String reviewInsert() {
		return "review/reviewInsert";
	}
	
	
	

	

	

}
