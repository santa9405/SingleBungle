package com.gaji.SingleBungle.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.main.model.service.MainService;
import com.gaji.SingleBungle.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	private MainService service;
	
	
	// 게시글 목록 조회 Controller
	@RequestMapping("list")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
							@ModelAttribute("loginMember") Member loginMember, RedirectAttributes ra) {
		

		// List<Board> bList = service.selectBoardList();
		
		
		// model.addAttribute("bList", bList);
		
		return null;
	}
	
	

}
