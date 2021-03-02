package com.gaji.SingleBungle.market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.market.model.service.MarketService;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;
import com.gaji.SingleBungle.member.model.vo.Member;

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
			if (loginMember.getMemberGrade().charAt(0) != 'F') {
				swalIcon = "error";
				swalTitle = "사고팔고 게시판은 1등급부터 이용할 수 있습니다.";
				url = "redirect:/";
			} else {
				MarketPageInfo mpInfo = service.getPageInfo(cp);

				List<Market> mList = service.selectList(mpInfo);

				List<MarketLike> likeInfo = service.selectLike(loginMember.getMemberNo());
				System.out.println(likeInfo);

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
							RedirectAttributes ra) {
		
		Market market = service.selectMarket(marketNo);
		String url = null;
		
		if (market != null) {
			
//			List<CafeAttachment> attachmentList = service.selectAttachmentList(marketNo);
//			if (attachmentList != null && !attachmentList.isEmpty()) {
//				model.addAttribute("attachmentList", attachmentList);
//			}
			
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
	
	
	// 사고팔고 게시글 작성 view 전환용 
	@RequestMapping("insert")
	public String marketInsert() {
		return "market/marketInsert"; 
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
