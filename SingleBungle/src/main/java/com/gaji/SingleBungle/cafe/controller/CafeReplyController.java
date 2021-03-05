package com.gaji.SingleBungle.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.cafe.model.service.CafeReplyService;
import com.gaji.SingleBungle.cafe.model.vo.CafeReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/cafeReply/*")
public class CafeReplyController {
	
	@Autowired
	private CafeReplyService service;
	
	// 댓글 목록 조회 Controller
	@RequestMapping("selectReplyList/{cafeNo}")
	public String selectReplyList(@PathVariable("cafeNo") int cafeNo ) {
		
		List<CafeReply> rList = service.selectReplyList(cafeNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	
	// 댓글 삽입 Controller
	@RequestMapping("insertReplyList/{cafeNo}")
	public int insertReply(@PathVariable("cafeNo") int cafeNo,
							@ModelAttribute CafeReply reply) {
		
		reply.setCafeNo(cafeNo);
		
		return service.insertReply(reply);
	}
	
	// 댓글 수정 Controller
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo,
							@ModelAttribute CafeReply reply) {
		
		reply.setReplyNo(replyNo);
		
		return service.updateReply(reply);
		
	}
	
	// 댓글 삭제 Controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	// 답글 삽입 Controller
	@RequestMapping("insertChildReply/{cafeNo}")
	public int insertChildReply(@PathVariable("cafeNo") int cafeNo,
								@ModelAttribute CafeReply reply) {
		
		reply.setCafeNo(cafeNo);
		
		return service.insertChildReply(reply);
	}
	
	

}
