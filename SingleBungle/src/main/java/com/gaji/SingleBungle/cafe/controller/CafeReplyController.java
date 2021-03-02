package com.gaji.SingleBungle.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.cafe.model.service.CafeReplyService;
import com.gaji.SingleBungle.cafe.model.vo.CafeReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/cafe/reply/*")
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
	

}
