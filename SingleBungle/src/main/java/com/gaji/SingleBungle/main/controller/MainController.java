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

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;
import com.gaji.SingleBungle.main.model.service.MainService;
import com.gaji.SingleBungle.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	private MainService service;
	private BoardService service1; // 자유게시판 서비스
	
	
	// 게시글 목록 조회 Controller
	@RequestMapping("/")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		BoardPageInfo bpInfo = service1.getPageInfo(cp);
		bpInfo.setLimit(5);
		List<Board> bList = service1.selectList(bpInfo);
		
		System.out.println("bList : " + bList);
		System.out.println("bpInfo : " + bpInfo);
		
		model.addAttribute("bList", bList);
		model.addAttribute("bpInfo", bpInfo);
		
		return "/";
	}
	
	

}
