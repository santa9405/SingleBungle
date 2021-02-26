package com.gaji.SingleBungle.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gaji.SingleBungle.cafe.model.service.ReplyService;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
	// 댓글 목록 조회 Controller
	@RequestMapping("selectReplyList/{parentBoardNo}")
	public String selectReplyList() {
		return null;
	}
	
	// 댓글 삽입 Controller
	@RequestMapping("insertReply/{parentBoardNo}")
	public int insertReply() {
		return 0;
	}

	// 댓글 수정 Controller
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply() {
		return 0;
	}

	// 댓글 삭제 Controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply() {
		return 0;
	}
	
	// 대댓글 삽입 Controller
	@RequestMapping("insertChildReply/{parentBoardNo}")
	public int insertChildReply() {
		return 0;
	}
	
	
	
	


}
