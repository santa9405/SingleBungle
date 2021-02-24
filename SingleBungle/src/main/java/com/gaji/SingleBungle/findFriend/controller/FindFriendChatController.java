package com.gaji.SingleBungle.findFriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findFriendChat/*")
public class FindFriendChatController {
	
	@RequestMapping("chatView")
	public String chatView() {
		return "findFriendChat/chat";
	}

}