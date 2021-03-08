package com.gaji.SingleBungle.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gaji.SingleBungle.member.model.vo.Member;
import com.gaji.SingleBungle.message.model.service.MessageService;
import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;
@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/message/*")
public class MessageController {
		
		@Autowired
		private MessageService service;

		
		private String swalIcon = null;
		private String swalTitle = null;
		private String swalText = null;

		
		// 보낸 쪽지함
		@RequestMapping("messageBoxS")
		public String message(@RequestParam(value="cp", required=false, defaultValue="1") int cp, @ModelAttribute("loginMember") Member loginMember,
							  Model model) {
			
			int memberNo = loginMember.getMemberNo();
			
			MessagePageInfo pInfo = service.getPageInfo(cp,memberNo);
			
			
			
			
			
			return "/message/messageBoxS";
		}
		
		
		
		// 받은 쪽지함
		@RequestMapping("messageBoxR")
		public String messageBox() {
			return "/message/messageBoxR";
		}
		

}
