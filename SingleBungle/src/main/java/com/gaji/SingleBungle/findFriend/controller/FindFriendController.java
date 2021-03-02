package com.gaji.SingleBungle.findFriend.controller;

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

import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendAttachment;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendPageInfo;
import com.gaji.SingleBungle.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/findFriend/*")
public class FindFriendController {
	
	@Autowired
	private FindFriendService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 친구찾기 목록 조회 Controller
	@RequestMapping("list")
	public String friendList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							 Model model) {
		
		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		FindFriendPageInfo pInfo = service.getPageInfo(cp);
		
//		System.out.println(pInfo);
		
		// 2) 게시글 목록 조회
		List<FindFriend> fList = service.selectList(pInfo);
		
//		for(FindFriend f : fList) {
//			System.out.println(f);
//		}
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("fList", fList);
		
		return "findFriend/findFriendList";
	}
	
	// 친구찾기 검색 Controller
	@RequestMapping("search")
	public String friendSearch(@RequestParam("sk") String searchKey, 
							   @RequestParam("sv") String searchValue, 
							   @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							   Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("cp", cp);
		
		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		FindFriendPageInfo pInfo = service.getSearchPageInfo(map);
		
		System.out.println(pInfo);
		
		// 2) 게시글 목록 조회
		List<FindFriend> fList = service.selectSearchList(map, pInfo);
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("fList", fList);
		
		return "findFriend/findFriendList";
	}
	
	// 친구찾기 상세 조회 Controller
	@RequestMapping("{friendNo}")
	public String friendView(@PathVariable("friendNo") int friendNo, Model model,
							 @RequestHeader(value = "referer", required = false) String referer,
							 RedirectAttributes ra) {
		
		//System.out.println("friendNo : " + friendNo);
		
		// 상세 조회
		FindFriend findFriend = service.selectBoard(friendNo);
		
		System.out.println(findFriend);
		
		String url = null;
		
		if(findFriend != null) { // 상세 조회 성공 시
			
			List<FindFriendAttachment> attachmentList = service.selectAttachmentList(friendNo);
			
			if(attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}
			
			model.addAttribute("findFriend", findFriend);
			url = "findFriend/findFriendView"; 
			
		}else {
			
			if(referer == null) { // 이전 요청 주소가 없는 경우
				url = "redirect:../list";
			}else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}
			
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
			
		}
		
		return url;
	}
	
	// 친구찾기 게시글 등록 화면 전환 Controller
	@RequestMapping("insert")
	public String insertView() {
		return "findFriend/findFriendInsert";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request,
					@RequestParam(value = "uploadFile") MultipartFile uploadFile){
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/findFriendImages");
		
		FindFriendAttachment at = service.inserImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
		
	}
	
	// 친구찾기 게시글 등록(+ 파일 업로드) Controller
	@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute FindFriend findFriend,
			@ModelAttribute("loginMember") Member loginMember,
			HttpServletRequest request,
			RedirectAttributes ra) {
		
		findFriend.setMemNo(loginMember.getMemberNo());
		
		String savePath 
			= request.getSession().getServletContext().getRealPath("resources/findFriendImages");
		
		int result = service.insertBoard(findFriend, savePath);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;
			
			// 새로 작성한 게시글 상세 조회시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "list");
			
		}else {
			swalIcon ="error";
			swalTitle ="게시글 등록 실패";
			url = "redirect:insert";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalIcon);
		
		return url;
	}
	
	// 친구찾기 게시글 수정 화면 전환 Controller
	@RequestMapping("{friendNo}/update")
	public String updateView(@PathVariable("friendNo") int friendNo, Model model) {
		
		// 1) 게시글 상세 조회
		FindFriend findFriend = service.selectBoard(friendNo);
		
		// 2) 해당 게시글에 포함된 이미지 목록 조회
		if(findFriend != null) {
			
			List<FindFriendAttachment> attachmentList = service.selectAttachmentList(friendNo);
			model.addAttribute("attachmentList", attachmentList);
			
		}
		
		model.addAttribute("friendNo", friendNo);
		
		return "findFriend/findFriendUpdate";
	}
	
	// 친구찾기 게시글 수정 Controller
	@RequestMapping("{friendNo}/updateAction")
	public String updateAction(@PathVariable("friendNo") int friendNo,
							   @ModelAttribute FindFriend updateBoard,
							   Model model, RedirectAttributes ra,
							   HttpServletRequest request) {
		
		// friendNo을 updateFriend에 세팅
		updateBoard.setFriendNo(friendNo);
		
		// 파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/findFriendImages");
		
		// 게시글 수정
		int result = service.updateBoard(updateBoard);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../" + friendNo;
		}else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	
	
	
	

}
