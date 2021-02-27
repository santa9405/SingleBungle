package com.gaji.SingleBungle.findFriend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.google.gson.Gson;

@Controller
@RequestMapping("/findFriend/*")
public class FindFriendController {
	
	// 친구찾기 목록 조회 Controller
	@RequestMapping("list")
	public String friendList() {
		return "findFriend/findFriendList";
	}
	
	// 친구찾기 상세 조회 Controller
	@RequestMapping("view")
	public String friendView() {
		return "findFriend/findFriendView";
	}
	
	// 친구찾기 게시글 등록 화면 전환 Controller
	@RequestMapping("insert")
	public String insertView() {
		return "findFriend/findFriendInsert";
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	/*@ResponseBody
	@RequestMapping("{type}/insertImage")
	public String insertImage(HttpServletRequest request,
					@RequestParam(value = "uploadFile") MultipartFile uploadFile){
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/infoImages");
		
		Attachment at = service.inserImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
		
	}*/
	
	// 친구찾기 게시글 등록 Controller
	/*@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute FindFriend findFriend,
			@ModelAttribute("loginMember") Member loginMember,
			HttpServletRequest request,
			RedirectAttributes ra) {
		
		return null;
	}*/
	
	// 친구찾기 게시글 수정 화면 전환 Controller
	public String updateView() {
		return "findFriend/findFriendUpdate";
	}

}
