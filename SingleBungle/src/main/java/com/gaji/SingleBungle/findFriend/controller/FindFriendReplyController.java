package com.gaji.SingleBungle.findFriend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendReplyService;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/findFriendReply/*")
public class FindFriendReplyController {
	
	@Autowired
	private FindFriendReplyService service;
	
	// 댓글 목록 조회 Controller
	@ResponseBody
	@RequestMapping("selectReplyList/{friendNo}")
	public String selectReplyList(@PathVariable("friendNo") int friendNo) {
		
		List<FindFriendReplyController> rList = service.selectReplyList(friendNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
		
	}
	
	// 댓글 삽입 Controller
	@RequestMapping("insertReply/{friendNo}")
	public int insertReply(@PathVariable("friendNo") int friendNo,
						   @ModelAttribute FindFriendReply reply) {
		
		reply.setParentFriendNo(friendNo);
		
		return service.insertReply(reply);
	}

}
