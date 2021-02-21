package com.gaji.SingleBungle.findFriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findFriend/*")
public class FindFriendController {
	
	@RequestMapping("list")
	public String boardList() {
		return "findFriend/findFriendList";
	}
	
	@RequestMapping("view")
	public String boardView() {
		return "findFriend/findFriendView";
	}
	
	@RequestMapping("insert")
	public String boardInsert() {
		return "findFriend/findFriendInsert";
	}

}
