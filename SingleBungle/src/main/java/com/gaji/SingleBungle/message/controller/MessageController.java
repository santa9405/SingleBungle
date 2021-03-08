package com.gaji.SingleBungle.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.member.model.vo.Member;
import com.gaji.SingleBungle.message.model.service.MessageService;
import com.gaji.SingleBungle.message.model.vo.Message;
import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;
@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/message/*")
public class MessageController {
		
		@Autowired
		private MessageService service;

		
		private String swalIcon = null;
		private String swalTitle = null;
		private String swalText = null;

		
		// 보낸 쪽지함
		@RequestMapping("messageBoxS")
		public String message(@RequestParam(value="cp", required=false, defaultValue="1") int cp, 
							  @ModelAttribute("loginMember") Member loginMember,
							  Model model) {
			
			int memberNo = loginMember.getMemberNo();
			
			
			// 페이징 처리 : 보낸 쪽지 수 조회 
			MessagePageInfo pInfo = service.getSendPageInfo(cp,memberNo);
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNo",memberNo);
			map.put("pInfo", pInfo);
			
			
			// 보낸 쪽지 목록 조회
			List<Message> mList = service.selectSendList(map);
			
			model.addAttribute("mList",mList);
			model.addAttribute("pInfo", pInfo);
			
			return "/message/messageBoxS";
		}
		
		
		
		// 받은 쪽지함
		@RequestMapping("messageBoxR")
		public String messageBox(@RequestParam(value="cp", required=false, defaultValue="1") int cp, 
								@ModelAttribute("loginMember") Member loginMember,
								Model model) {
			
			int memberNo = loginMember.getMemberNo();
			
			// 페이징 처리 : 받은 쪽지 수 조회
			MessagePageInfo pInfo = service.getReceivePageInfo(cp,memberNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberNo",memberNo);
			map.put("pInfo", pInfo);
			
			// 받은 쪽지 목록 조회
			List<Message> mList = service.selectReceiveList(map);
		
			return "/message/messageBoxR";
		}
		
		
		
		
		// 메세지 전송
		@RequestMapping("sendMessage")
		public String sendMessage(@RequestParam("memberNo") int memberNo, @RequestParam("nickName") String nickName,
									@RequestParam("content") String content, @ModelAttribute("loginMember") Member loginMember,	
									RedirectAttributes ra, HttpServletRequest request) {
			
			
			Map<String,Object> map = new HashMap<String, Object>();
			
			//  메세지 받는 사람
			map.put("receiveMember", memberNo);
			map.put("receiveNickName", nickName);
			
			
			// 메세지 보내는 사람
			map.put("sendMember", loginMember.getMemberNo());
			map.put("sendNickName", loginMember.getMemberNickname());
			
			
			// 쪽지내용
			map.put("content", content);
			
			int result = service.sendMessage(map);
			
			if(result>0) {
				swalIcon = "success";
				swalTitle = "쪽지 전송 완료";
			}else {
				swalIcon = "error";
				swalTitle = "쪽지 전송 실패";
			}
			
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);
			
			
			return "redirect :"+ request.getHeader("referer");
		}
		
		

		
		

		
		

}
