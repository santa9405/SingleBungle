package com.gaji.SingleBungle.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		
		

		
		

		
		

}
