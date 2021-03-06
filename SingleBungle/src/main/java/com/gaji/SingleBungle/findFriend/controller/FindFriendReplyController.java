package com.gaji.SingleBungle.findFriend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendReplyService;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/findFriendReply/*")
public class FindFriendReplyController {
	
	@Autowired
	private FindFriendReplyService service;
	
	// 댓글 목록 조회 Controller
	@ResponseBody
	@RequestMapping("selectReplyList/{parentFriendNo}")
	public String selectReplyList(@PathVariable("parentFriendNo") int parentFriendNo) {
		
		//System.out.println(parentFriendNo);
		
		List<FindFriendReply> rList = service.selectReplyList(parentFriendNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
		
	}
	
	// 댓글 삽입 Controller
	@RequestMapping("insertReplyList/{parentFriendNo}")
	public int insertReply(@PathVariable("parentFriendNo") int parentFriendNo,
						   @ModelAttribute FindFriendReply reply) {
		
		reply.setParentFriendNo(parentFriendNo);
		
		return service.insertReply(reply);
				
	}
	
	// 댓글 수정 Controller
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo,
						   @ModelAttribute FindFriendReply reply) {
		
		reply.setReplyNo(replyNo);
		
		return service.updateReply(reply);
	}
	
	// 댓글 삭제 Controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	// 답글 삽입 Controller
	@RequestMapping("insertChildReply/{parentFriendNo}")
	public int insertChildReply(@PathVariable("parentFriendNo") int parentFriendNo,
								@ModelAttribute FindFriendReply reply) {
		
		reply.setParentFriendNo(parentFriendNo);
		
		return service.insertChildReply(reply);
	}
	
	
	
	
	
	
	
	

}
