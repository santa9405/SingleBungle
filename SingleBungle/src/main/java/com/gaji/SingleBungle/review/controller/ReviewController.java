package com.gaji.SingleBungle.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("list")
	public String reviewList() {
		return "review/reviewList";
	}
	
	@RequestMapping("view")
	public String reviewView() {
		return "review/reviewView";
	}
	

	

	

}
