package com.gaji.SingleBungle.cafe.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.cafe.model.service.CafeService;
import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/cafe/*")
public class CafeController {
	
	@Autowired
	private CafeService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	
	
	// 게시글 목록 조회 Controller
	@RequestMapping("list")
	public String CafeList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		CafePageInfo cpInfo = service.getPageInfo(cp);

		// 2) 게시글 목록 조회
		List<Cafe> cList = service.selectList(cpInfo);
		
		// 썸네일
//		if (cList != null && !cList.isEmpty()) { // 게시글 목록 조회 성공 시
//			List<CafeAttachment> thumbnailList = service.selectThumbnailList(cList);
//
//			if (thumbnailList != null) {
//				model.addAttribute("thList", thumbnailList);
//			}
//
//		}

		
		model.addAttribute("cList", cList);
		model.addAttribute("cpInfo", cpInfo);
		
		return "cafe/cafeList";
	}
	
	// 게시글 상세조회 Controller
	@RequestMapping("{cafeNo}")
	public String cafeView(@PathVariable("cafeNo") int cafeNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		// 게시글 상세조회 Service 호출
		Cafe cafe = service.selectCafe(cafeNo);
		
		String url = null;
		
		if (cafe != null) {
			
			List<CafeAttachment> attachmentList = service.selectAttachmentList(cafeNo);
			
			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			
			model.addAttribute("cafe", cafe);
			url = "cafe/cafeView";
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
	
	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("insert")
	public String cafeInsert() {
		return "cafe/cafeInsert";
	}
	
	// 게시글 등록 Controller
	@RequestMapping("insertAction")
	public String insertAction() {
		return null;
	}
	
	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("update")
	public String cafeUpdate() {
		return "cafe/cafeUpdate";
	}
	
	// 게시글 수정 Controller
	@RequestMapping("updateAction")
	public String updateAction() {
		return null;
	}
	
	// summernote -----------------------------
	// summernote에 업로드된 이미지 저장 Controller
	
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage() {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
//	// 신고 페이지 연결
//	@RequestMapping("cafeReport")
//	public String cafeReport() {
//		return "cafe/cafeReport";
//	}
//	
//	// 댓글 신고 페이지 연결
//	@RequestMapping("cafeReplyReport")
//	public String replyReport() {
//		return "cafe/cafeReplyReport";
//	}
	

}
