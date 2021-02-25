package com.gaji.SingleBungle.findFriend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;

@Controller
@RequestMapping("/findFriendChat/*")
public class FindFriendChatController {
	
	@Autowired
	private FindFriendService service;
	
	@RequestMapping("chatView")
	public String chatView() {
		return "findFriendChat/chat";
	}

}
