package com.gaji.SingleBungle.market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.market.model.service.MarketService;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketAttachment;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;
import com.gaji.SingleBungle.market.model.vo.MarketSearch;
import com.gaji.SingleBungle.member.model.vo.Member;
import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewAttachment;
import com.gaji.SingleBungle.review.model.vo.ReviewPageInfo;
import com.gaji.SingleBungle.review.model.vo.ReviewSearch;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/market/*")

public class MarketController {
	@Autowired
	private MarketService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	@RequestMapping("list")
	public String marketList(@RequestParam(value= "cp", required = false, defaultValue="1")  
								int cp, Model model, @ModelAttribute("loginMember") Member loginMember,
								RedirectAttributes ra) {
		String url = null;		
		
		if (loginMember != null) {
			if (loginMember.getMemberGrade().charAt(0) != 'F' || loginMember.getMemberGrade().charAt(0) != 'G') {
				swalIcon = "error";
				swalTitle = "사고팔고 게시판은 1등급부터 이용할 수 있습니다.";
				url = "redirect:/";
			} else {
				MarketPageInfo mpInfo = service.getPageInfo(cp);

				List<Market> mList = service.selectList(mpInfo);
				
				if(mList != null && !mList.isEmpty()) {
					List<MarketAttachment> thumbnailList = service.selectThumbnailList(mList);
					if(thumbnailList != null) {
						model.addAttribute("thList", thumbnailList);
					}
				}
				
				List<MarketLike> likeInfo = service.selectLike(loginMember.getMemberNo());
				

				model.addAttribute("mpInfo", mpInfo);
				model.addAttribute("mList", mList);
				model.addAttribute("likeInfo", likeInfo);

				url = "market/marketList";

			}
		} else {
			
			swalIcon = "error";
			swalTitle = "로그인 후 이용해주세요.";
			url = "redirect:/";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		return url;
	}
	
	
	// 좋아요 증가 Controller
	@ResponseBody
	@RequestMapping("increaseLike")
	public int increaseLike(@RequestParam int marketNo,
			@ModelAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("marketNo", marketNo);
		
		int result = service.increaseLike(map);
		
		return result;
	}
	
	// 좋아요 감소 Controller
	@ResponseBody
	@RequestMapping("decreaseLike")
	public int decreaseLike(@RequestParam int marketNo,
			@ModelAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("marketNo", marketNo);
		
		int result = service.decreaseLike(map);
		return result;
	}
	
	
	// 사고팔고 상세 조회
	@RequestMapping("{marketNo}") 
	public String marketView(@PathVariable int marketNo,
							Model model, @RequestHeader(value = "referer", required = false) String referer,
							RedirectAttributes ra, @ModelAttribute("loginMember") Member loginMember) {
		
		Market market = service.selectMarket(marketNo);
		String url = null;
		
		if (market != null) {
			
			// 해당 게시글에 좋아요를 눌렀는지 확인
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("memberNo", loginMember.getMemberNo());
			map.put("marketNo", marketNo);
			
			int like = service.selectLikePushed(map);
			model.addAttribute("likeCheck", like);
			
			
			List<MarketAttachment> at = service.selectAttachmentList(marketNo);
			
			if(at != null & !at.isEmpty()) {
				model.addAttribute("at", at);
			}
			
			//model.addAttribute("loginMember", loginMember);
			model.addAttribute("market", market);
			url = "market/marketView";
		} else {
			
			if (referer == null) {
				url = "redirect:../list/";
			} else {
				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return url;
	}
	
	
	
	// 예약중으로 변경 Controller
	@ResponseBody
	@RequestMapping("reservation/{type}")
	public int reservation(@PathVariable("type") int type,
			@RequestParam("marketNo") int marketNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("marketNo", marketNo);
		map.put("type", type);
		
		
		return service.reservation(map);
	}
	
	
	
	// 사고팔고 게시글 작성 view 
	@RequestMapping("insert")
	public String marketInsert() {
		return "market/marketInsert"; 
	}
	
	// 사고팔고 게시글 등록 Controller
	@RequestMapping("insertAction")
	public String marketInsertAction(@ModelAttribute Market market, RedirectAttributes ra,
						@ModelAttribute("loginMember") Member loginMember, 
						@RequestParam(value="images", required=true) List<MultipartFile> images,
						HttpServletRequest request) {
		
		//System.out.println(market);
		
		market.setMemNo(loginMember.getMemberNo());
		
//		for(int i=0; i<images.size(); i++) {
//		System.out.println("images[" + i + "] : " + images.get(i).getOriginalFilename());
//			}
		String savePath = null;
		
		savePath = request.getSession().getServletContext().getRealPath("resources/marketImages");
		
		int result = service.insertMarket(market, images, savePath);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;
			
			request.getSession().setAttribute("returnListURL", "../list");
					
		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:insert";
		}
		 ra.addFlashAttribute("swalIcon", swalIcon);
		 ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	
	// 게시글 수정 화면 전환 Controller
	@RequestMapping("update/{marketNo}")
	public String marketUpdate(@PathVariable("marketNo") int marketNo, Model model) {
		
		// 게시글 상세 조회 
		Market market = service.selectMarket(marketNo);
		
		// 해당 게시글이 포함된 이미지 목록 조회
		if(market != null) {
			List<MarketAttachment> attachmentList = service.selectAttachmentList(marketNo);
			model.addAttribute("at", attachmentList);
		}
		
		model.addAttribute("market", market);
		return "market/marketUpdate";
	}
	
	
	
	// 게시글 검색
	@RequestMapping("search")
	public String searchBoard(@RequestParam(value="cp", required=false, defaultValue ="1")  int cp,
			@RequestParam(value="sv",required = false) String sv,
			@RequestParam(value="ct",required = false) String ct,
			@RequestParam(value="sort",required = false) String sort, 
			@ModelAttribute("mSearch") MarketSearch mSearch,
			Model model) {
		
		mSearch.setSv(sv);
		mSearch.setCt(ct);
		mSearch.setSort(sort);
		
		System.out.println(mSearch);
		
		
		MarketPageInfo pInfo = service.getSearchPageInfo(mSearch,cp);
		
		
		List<Market> mList = service.selectSearchList(mSearch,pInfo);
		
		
		if(!mList.isEmpty()) {
			List<MarketAttachment> thList = service.selectThumbnailList(mList);
			model.addAttribute("thList",thList);
		}
		
		model.addAttribute("mList",mList);
		model.addAttribute("pInfo",pInfo);
		model.addAttribute("mSearch", mSearch);
		
		return "market/marketList";
	}
	
	@RequestMapping("mypage")
	public String marketMypage() {
		return "market/marketMypage";
	}
	
	@RequestMapping("modal")
	public String marketModal() {
		return "market/marketModal";
	}
}
