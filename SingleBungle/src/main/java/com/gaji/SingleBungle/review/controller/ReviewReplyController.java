package com.gaji.SingleBungle.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.review.model.service.ReviewReplyService;
import com.gaji.SingleBungle.review.model.vo.ReviewReply;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/reviewReply/*")
public class ReviewReplyController {
	
	@Autowired
	private ReviewReplyService service;

	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
	// 댓글 목록 조회
	@ResponseBody
	@RequestMapping("selectReplyList/{parentBoardNo}")
	public String selectReplyList(@PathVariable("parentBoardNo") int parentBoardNo) {
		
		List<ReviewReply> rList = service.selectReplyList(parentBoardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	
	
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping("insertReplyList/{parentBoardNo}")
	public int insertReply(@PathVariable("parentBoardNo") int parentBoardNo, @ModelAttribute("reply") ReviewReply reply) {
		
		reply.setParentBoardNo(parentBoardNo);
		
		return service.insertReply(reply);
	}
	
	
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo, 
						   @ModelAttribute("reply") ReviewReply reply) {
		
		reply.setReplyNo(replyNo);
		
		return service.updateReply(reply);
	}
	
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	
	// 답글 등록
	@ResponseBody
	@RequestMapping("insertChildReply/{parentBoardNo}")
	public int insertChildReply(@PathVariable("parentBoardNo") int parentBoardNo, @ModelAttribute("reply") ReviewReply reply) {
		reply.setParentBoardNo(parentBoardNo);
		return service.insertChildReply(reply);
	}
	
	
	
	

}
