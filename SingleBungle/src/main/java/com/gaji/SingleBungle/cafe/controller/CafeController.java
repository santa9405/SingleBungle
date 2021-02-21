package com.gaji.SingleBungle.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.cafe.model.service.CafeService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/cafe/*")
public class CafeController {
	
	@Autowired
	private CafeService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("list")
	public String CafeList() {
		return "cafe/cafeList";
	}
	
	@RequestMapping("view")
	public String CafeView() {
		return "cafe/cafeView";
	}
	
	@RequestMapping("insert")
	public String CafeInsert() {
		return "cafe/cafeInsert";
	}
	
	@RequestMapping("update")
	public String CafeUpdate() {
		return "cafe/cafeUpdate";
	}
	

}
