package com.gaji.SingleBungle.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/reviewReport/*")
public class ReviewReportController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("report")
	public String report() {
		return "review/reviewReport";
	}
	
	@RequestMapping("replyReport")
	public String replyReport() {
		return "review/reviewReplyReport";
	}
	
	
	
	

	

	

}
