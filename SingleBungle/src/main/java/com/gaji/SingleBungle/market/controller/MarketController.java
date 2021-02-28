package com.gaji.SingleBungle.market.controller;

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

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.market.model.service.MarketService;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;

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
								int cp, Model model) {
		
		MarketPageInfo mpInfo = service.getPageInfo(cp);
		
		List<Market> mList = service.selectList(mpInfo);
		
		model.addAttribute("mpInfo", mpInfo);
		model.addAttribute("mList", mList);
		return  "market/marketList";
	}
	
	@RequestMapping("{marketNo}") 
	public String marketView(@PathVariable int marketNo,
							Model model, @RequestHeader(value = "referer", required = false) String referer,
							RedirectAttributes ra) {
		
		Market market = service.selectMarket(marketNo);
		String url = null;
		
		if (market != null) {
//			
//			List<CafeAttachment> attachmentList = service.selectAttachmentList(marketNo);
//			
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
