package com.gaji.SingleBungle.findFriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findFriendReport/*")
public class FindFriendReport {

	@RequestMapping("reportForm")
	public String reportForm() {
		return "findFriend/findFriendReport";
	}
}
