package com.gaji.SingleBungle.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	
	@RequestMapping("eventList")
	public String eventListView() {
		return "notice/eventList";
	}
	
	@RequestMapping("eventView")
	public String eventView() {
		return "notice/eventView";
	}
	
	@RequestMapping("faqInsert")
	public String faqInsert() {
		return "notice/faqInsert";
	}
	
	@RequestMapping("faqView")
	public String faqView() {
		return "notice/faqView";
	}
	
	@RequestMapping("inquiryInsert")
	public String inquiryInsert() {
		return "notice/inquiryInsert";
	}
	
	@RequestMapping("inquiryList")
	public String inquiryListView() {
		return "notice/inquiryList";
	}
	
	@RequestMapping("inquiryView")
	public String inquiryView() {
		return "notice/inquiryView";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		return "notice/noticeInsert";
	}
	
	@RequestMapping("noticeList")
	public String noticeListView() {
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeView")
	public String noticeView() {
		return "notice/noticeView";
	}

}
