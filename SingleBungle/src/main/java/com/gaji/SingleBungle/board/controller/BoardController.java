package com.gaji.SingleBungle.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	

	// 게시글 목록 조회 Controller
	@RequestMapping("list")
	public String boardList() {
		return "board/boardList";
	}
	
	// 게시글 상세조회 Controller
	@RequestMapping("view")
	public String boardView() {
		return "board/boardView";
	}
	
	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("insert")
	public String boardInsert() {
		return "board/boardInsert";
	}
	
	// 게시글 등록 Controller
	@RequestMapping("insertAction")
	public String insertAction() {
		return null;
	}
	
	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("update")
	public String boardUpdate() {
		return "board/boardUpdate";
	}
	
	// 게시글 수정 Controller
	@RequestMapping("updateAction")
	public String updateAction() {
		return null;
	}
	
	// summernote -----------------------------
	// summernote에 업로드된 이미지 저장 Controller
	
	@ResponseBody // 응답 시 값 자체를 돌려보냄
	@RequestMapping("insertImage")
	public String insertImage() {
		return null;
	}
	
	
	
	
	
	
	
	
	// 신고 페이지 연결
	@RequestMapping("report")
	public String boardReport() {
		return "board/boardReport";
	}
	
	// 댓글 신고 페이지 연결
	@RequestMapping("replyReport")
	public String replyReport() {
		return "board/boardReplyReport";
	}
	

}
