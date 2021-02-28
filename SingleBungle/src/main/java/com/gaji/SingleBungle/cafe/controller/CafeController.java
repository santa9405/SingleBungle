package com.gaji.SingleBungle.cafe.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	@RequestMapping("view")
	public String cafeView() {
		return "cafe/cafeView";
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
