package com.gaji.SingleBungle.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping("list")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("view")
	public String boardView() {
		return "board/boardView";
	}
	
	@RequestMapping("insert")
	public String boardInsert() {
		return "board/boardInsert";
	}
	
	@RequestMapping("update")
	public String boardUpdate() {
		return "board/boardUpdate";
	}
	

}
