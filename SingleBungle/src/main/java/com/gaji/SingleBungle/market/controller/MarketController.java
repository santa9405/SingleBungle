package com.gaji.SingleBungle.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
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
		
		for(Market m : mList) {
			System.out.println(m);
		}
		model.addAttribute("mpInfo", mpInfo);
		model.addAttribute("mList", mList);
		return  "market/marketList";
	}
	
	@RequestMapping("view") 
	public String marketView() {
		return "market/marketView";
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
