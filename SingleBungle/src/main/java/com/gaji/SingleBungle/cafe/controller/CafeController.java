package com.gaji.SingleBungle.cafe.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.cafe.model.service.CafeService;
import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;
import com.gaji.SingleBungle.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@SessionAttributes({"loginMember"})
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
		
		CafePageInfo cpInfo = service.getPageInfo(cp);

		List<Cafe> cList = service.selectList(cpInfo);
		
		// 썸네일
		if (cList != null && !cList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<CafeAttachment> thumbnailList = service.selectThumbnailList(cList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}
		
		model.addAttribute("cList", cList);
		model.addAttribute("cpInfo", cpInfo);
		
		return "cafe/cafeList";
	}
	
	// 검색 Controller
	@RequestMapping("search")
	public String boardSearch(@RequestParam("sk") String searchKey,
							  @RequestParam("sv") String searchValue,
							  @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							  Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("cp", cp);
		
		CafePageInfo cpInfo = service.getSearchPageInfo(map);
		
		List<Cafe> cList = service.selectSearchList(map, cpInfo);
		
		model.addAttribute("cpInfo", cpInfo);
		model.addAttribute("cList", cList);
		
		return "cafe/cafeList";
	}
	
	
	// 게시글 상세조회 Controller
	@RequestMapping("{cafeNo}")
	public String cafeView(@PathVariable("cafeNo") int cafeNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		Cafe cafe = service.selectCafe(cafeNo);
		
		String url = null;
		
		if (cafe != null) {
			
			List<Cafe> cafeList = service.cafeListTop3();
			
//			List<CafeAttachment> attachmentList = service.selectAttachmentList(cafeNo);
//			
//			if (attachmentList != null && !attachmentList.isEmpty()) {
//				model.addAttribute("attachmentList", attachmentList);
//			}
			
			// 썸네일
			if (cafeList != null && !cafeList.isEmpty()) { // 게시글 목록 조회 성공 시
				List<CafeAttachment> thumbnailList = service.selectThumbnailList(cafeList);

				if (thumbnailList != null) {
					model.addAttribute("thList", thumbnailList);
				}

			}
			
			
			model.addAttribute("cafe", cafe);
			model.addAttribute("cafeList", cafeList);
			url = "cafe/cafeView";
		} else {
			
			if (referer == null) {
				url = "redirect:../list";
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
	public String insertAction(@ModelAttribute Cafe cafe, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("cafeTitle", cafe.getCafeTitle());
		map.put("cafeContent", cafe.getCafeContent());
		map.put("categoryCode", cafe.getCategoryCode());
		map.put("cafeName", cafe.getCafeName());
		
		String savePath = null;
		
		savePath = request.getSession().getServletContext().getRealPath("resources/cafeImages");
		
		int result = service.insertCafe(map, images, savePath);
		
		String url = null;
		
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;
			
			// 목록 버튼 경로
			request.getSession().setAttribute("returnListURL", "../list/");
		} else {
			swalIcon = "error";
			swalTitle = "게시글 삽입 실패";
			url = "redirect:insert";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	// summernote -----------------------------
	// summernote에 업로드된 이미지 저장 Controller
	
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request,
			 				@RequestParam("uploadFile") MultipartFile uploadFile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/cafeImages");
		
		CafeAttachment at = service.insertImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
	}
	
	
	
	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("{cafeNo}/update")
	public String cafeUpdate() {
		return "cafe/cafeUpdate";
	}
	
	// 게시글 수정 Controller
	@RequestMapping("{cafeNo}/updateAction")
	public String updateAction() {
		return null;
	}
	
	// 게시글 삭제 Controller
	@RequestMapping("{cafeNo}/delete")
	public String deleteCafe(@PathVariable("cafeNo") int cafeNo,
							@ModelAttribute Cafe cafe,
							HttpServletRequest request, RedirectAttributes ra) {
		
		cafe.setCafeNo(cafeNo);
		
		int result = service.deleteCafe(cafe);
		
		String url = null;
		
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 삭제 성공";
			url = "redirect:../list";
		} else {
			swalIcon = "error";
			swalTitle = "게시글 삭제 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	
	
	
	
	
	
	
	// 신고 페이지 연결
	@RequestMapping("cafeReport")
	public String cafeReport() {
		return "cafe/cafeReport";
	}
	
	// 댓글 신고 페이지 연결
	@RequestMapping("cafeReplyReport")
	public String replyReport() {
		return "cafe/cafeReplyReport";
	}
	

}
