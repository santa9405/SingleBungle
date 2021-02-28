package com.gaji.SingleBungle.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gaji.SingleBungle.admin.service.adminService;
import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;

@Controller
@RequestMapping("/admin/*")
public class adminController {
	
	@Autowired
	private adminService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 寃뚯떆占�? 紐⑸줉 議고쉶 Controller
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
	
	
	
	
	
	@RequestMapping("eventList")
	public String eventListView(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
		
		int type=4;
		APageInfo pInfo = service.getPageInfo(cp,type);
		List<ABoard> eventList = service.selectList(pInfo, type);
		
		if (eventList != null && !eventList.isEmpty()) { // 寃뚯떆湲� 紐⑸줉 議고쉶 �꽦怨� �떆
			List<AAttachment> thumbnailList = service.selectThumbnailList(eventList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/eventList";
	}
	
	@RequestMapping("eventView")
	public String eventView() {
		return "admin/eventView";
	}
	
	@RequestMapping("faqInsert")
	public String faqInsert() {
		return "admin/faqInsert";
	}
	
	@RequestMapping("faqView")
	public String faqView() {
		return "admin/faqView";
	}
	
	@RequestMapping("inquiryInsert")
	public String inquiryInsert() {
		return "admin/inquiryInsert";
	}
	
	@RequestMapping("inquiryList")
	public String inquiryListView() {
		return "admin/inquiryList";
	}
	
	@RequestMapping("inquiryView")
	public String inquiryView() {
		return "admin/inquiryView";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		return "admin/noticeInsert";
	}
	
	@RequestMapping("noticeList")
	public String noticeListView(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
		
		int type=3;
		APageInfo pInfo = service.getPageInfo(cp,type);
		List<ABoard> noticeList = service.selectList(pInfo, type);
		
		if (noticeList != null && !noticeList.isEmpty()) { // 寃뚯떆湲� 紐⑸줉 議고쉶 �꽦怨� �떆
			List<AAttachment> thumbnailList = service.selectThumbnailList(noticeList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);
		
		System.out.println(pInfo);
		
		return "admin/noticeList";
	}
	
	
	
	@RequestMapping("noticeView")
	public String noticeView() {
		return "admin/noticeView";
	}
	
}
