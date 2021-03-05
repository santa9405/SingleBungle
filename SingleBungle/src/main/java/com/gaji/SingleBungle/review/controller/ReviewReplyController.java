package com.gaji.SingleBungle.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.review.model.service.ReviewReplyService;
import com.gaji.SingleBungle.review.model.vo.ReviewReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@RestController
@RequestMapping("/reviewReply/*")
public class ReviewReplyController {
	
	@Autowired
	private ReviewReplyService service;
	
	//${contextPath}/review/reply/selectReplyList + parentBoardNo
	// 댓글 목록 조회 Controller
	@RequestMapping("selectReplyList/{parentBoardNo}")
	// @ResponseBody
	public String selectReplyList(@PathVariable("parentBoardNo") int parentBoardNo) {
		
		List<ReviewReply> rList = service.selectReplyList(parentBoardNo);
		
		// JSON : 자바스크립트 객체 표기법 모양으로 작성된 문자열
		// GSON : Google에서 만든  JSON 라이브러리
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create(); 
		// Gson을 만드는 객체 생성, 그 안에 날짜 데이터가 있다면 format지정함
		
		// rList를 json 형태로 변형시켜서 반환
		return gson.toJson(rList);  // reply.jsp로 돌아감
	}
	
	
	
	// 댓글 삽입
	@RequestMapping("insertReply/{parentBoardNo}")
	public int insertReply(@PathVariable("parentBoardNo") int parentBoardNo,
						   @ModelAttribute("reply") ReviewReply reply) {
	
		reply.setParentBoardNo(parentBoardNo);
		
		int result = service.insertReply(reply);
		
		return result;
	}
	
	

}
