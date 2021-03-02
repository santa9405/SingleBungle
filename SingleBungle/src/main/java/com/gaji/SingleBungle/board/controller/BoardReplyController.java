package com.gaji.SingleBungle.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.board.model.service.BoardReplyService;
import com.gaji.SingleBungle.board.model.vo.BoardReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/board/reply/*")
public class BoardReplyController {
	
	@Autowired
	private BoardReplyService service;

	// 댓글 목록 조회 Controller
	@RequestMapping("selectReplyList/{parentBoardNo}")
	public String selectReplyList(@PathVariable("parentBoardNo") int parentBoardNo ) {
		
		List<BoardReply> rList = service.selectReplyList(parentBoardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	
}
