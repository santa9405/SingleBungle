package com.gaji.SingleBungle.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.market.model.service.MarketReplyService;
import com.gaji.SingleBungle.market.model.vo.MarketReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/marketReply/*")
public class MarketReplyController {

	@Autowired
	private MarketReplyService service;
	
	// 댓글 목록 조회 Controller
	@ResponseBody
	@RequestMapping("selectReplyList/{parentMarketNo}")
	public String selectReplyList(@PathVariable("parentMarketNo") int parentMarketNo){
		
		List<MarketReply> rList = service.selectReplyList(parentMarketNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	
	// 댓글 삽입 Controller insertReplyList
	@RequestMapping("insertReplyList/{parentMarketNo}")
	public int insertReply(@PathVariable("parentMarketNo") int parentMarketNo,
						@ModelAttribute("reply") MarketReply reply) {
		reply.setParentMarketNo(parentMarketNo);
		int result = service.insertReply(reply);
		return result;
	}
	
	
	// 댓글 수정 Controller
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo,
							@ModelAttribute MarketReply reply) {
		reply.setReplyNo(replyNo);
		return service.updateReply(reply);
	}
	
	// 댓글 삭제 Controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		return service.deleteReply(replyNo);
	}
	
}


























