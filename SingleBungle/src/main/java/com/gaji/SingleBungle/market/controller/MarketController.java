package com.gaji.SingleBungle.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaji.SingleBungle.board.model.service.BoardService;

@Controller
@RequestMapping("/market/*")

public class MarketController {
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	@RequestMapping("list")
	public String marketList() {
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
