package com.gaji.SingleBungle.findFriend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;

@Controller
@RequestMapping("/findFriendChat/*")
public class FindFriendChatController {
	
	@Autowired
	private FindFriendService service;
	
	@RequestMapping("chatView/{friendNo}")
	public String chatView(@PathVariable int friendNo, Model model) {
		model.addAttribute("friendNo", friendNo);
		return "findFriend/chat";
	}

}
