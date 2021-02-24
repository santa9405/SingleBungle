package com.gaji.SingleBungle.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class adminController {
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 게시�? 목록 조회 Controller
	@RequestMapping("adminMypage")
	public String adminMypage() {
		return "admin/adminMypage";
	}
	
	@RequestMapping("boardManage")
	public String boardManageView() {
		return "admin/boardManage";
	}
	
	@RequestMapping("boardReport")
	public String boardReportView() {
		return "admin/boardReport";
	}
	
	@RequestMapping("levelList")
	public String levelListView() {
		return "admin/levelList";
	}
	
	@RequestMapping("memberList")
	public String memberListView() {
		return "admin/memberList";
	}
	
	@RequestMapping("replyManage")
	public String replyManageView() {
		return "admin/replyManage";
	}
	
	@RequestMapping("replyReport")
	public String replyReportView() {
		return "admin/replyReport";
	}
}
