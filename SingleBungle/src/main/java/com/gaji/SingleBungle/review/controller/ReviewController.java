package com.gaji.SingleBungle.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	
	
	// 목록 조회
	@RequestMapping("list")
	public String reviewList(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		// 페이징 처리
		ReviewPageInfo pInfo = service.getPageInfo(cp);
		
		
		//게시글 목록 조회
		List<Review> rList = service.selectList(pInfo);
		
		
		/* 썸네일 출력 */
		
		model.addAttribute("rList", rList);
		model.addAttribute("pInfo",pInfo);
		
		return "review/reviewList";
	}
	
	
	
	// 상세조회
	@RequestMapping("view/{boardNo}")
	public String reviewView(@PathVariable("boardNo") int boardNo, Model model, @RequestHeader(value="referer",required=false) String referer,
							RedirectAttributes ra) {
		
		Review review = service.selectReview(boardNo);
		
		String url = null;
		
		if(review!=null) { // 상세조회 성공시
			// 이미지 목록 조회
			
			
			model.addAttribute("review",review);
			url = "review/reviewView";
		}else {
			
			if(referer == null) { //이전 요청주소가 없는 경우
				url = "redirect:../list";
			}else {
				url="redirect:"+referer;
			}
			
			ra.addFlashAttribute("swalicon","error");
			ra.addFlashAttribute("swalTitle","존재하지 않는 게시글입니다.");
		}
		
		return url;
	}
	
	// summernote 에 업로드 된 이미지 저장 Controller
	
	
	
	
	
	
	
	@RequestMapping("insert")
	public String reviewInsert() {
		return "review/reviewInsert";
	}
	
	
	

	

	

}
