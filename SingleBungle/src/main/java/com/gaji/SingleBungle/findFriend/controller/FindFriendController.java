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
	public String friendView(@PathVariable("friendNo") int friendNo) {
		
		//System.out.println("friendNo : " + friendNo);
		
		FindFriend findFriend = service.selectBoard(friendNo);
		
		return "findFriend/findFriendView";
	}
	
	// 친구찾기 게시글 등록 화면 전환 Controller
	@RequestMapping("insert")
	public String insertView() {
		return "findFriend/findFriendInsert";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody
	@RequestMapping("{type}/insertImage")
	public String insertImage(HttpServletRequest request,
					@RequestParam(value = "uploadFile") MultipartFile uploadFile){
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/infoImages");
		
		FindFriendAttachment at = service.inserImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
		
	}
	
	// 친구찾기 게시글 등록(+ 파일 업로드) Controller
	@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute FindFriend findFriend,
			/*@ModelAttribute("loginMember") Member loginMember,*/
			HttpServletRequest request,
			RedirectAttributes ra) {
		
		//FindFriend.setMemNo(loginMember.getMemberNo());
		
		String savePath 
			= request.getSession().getServletContext().getRealPath("resources/infoImages");
		
		int result = service.insertBoard(findFriend, savePath);
		
		String url = null;
		
		if(result > 0) {
			//swalIcon = "success";
			//swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;
		}else {
			//swalIcon ="error";
			//swalTitle ="게시글 등록 실패";
			url = "redirect:insert";
		}
		
		//ra.addFlashAttribute("swalIcon", swalIcon);
		//ra.addFlashAttribute("swalTitle", swalIcon);
		
		return url;
	}
	
	// 친구찾기 게시글 수정 화면 전환 Controller
	public String updateView() {
		return "findFriend/findFriendUpdate";
	}
	
	

}
