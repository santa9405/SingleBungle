package com.gaji.SingleBungle.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class memberController {
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 로그인 Controller
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	// 회원가입
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// 마이페이지 
	@RequestMapping("mypage")
	public String mypage() {
		return "member/mypage";
	}

	// 아이디 찾기
	@RequestMapping("mypageFindId1")
	public String mypageFindId1() {
		return "member/mypageFindId1";
	}
	
	@RequestMapping("mypageFindId2")
	public String mypageFindId2() {
		return "member/mypageFindId2";
	}
	
	// 비밀번호 찾기 
	@RequestMapping("mypageFindPw1")
	public String mypageFindPw1() {
		return "member/mypageFindPw1";
	}
	
	@RequestMapping("mypageFindPw2")
	public String mypageFindPw2() {
		return "member/mypageFindPw2";
	}
	
	@RequestMapping("mypageFindPw3")
	public String mypageFindPw3() {
		return "member/mypageFindPw3";
	}
	
	// 내 정보 수정
	@RequestMapping("mypageInfoUpdate")
	public String mypageInfoUpdate() {
		return "member/mypageInfoUpdate";
	}
	
	// 비밀번호 수정
	@RequestMapping("mypagePwUpdate")
	public String mypagePwUpdate() {
		return "member/mypagePwUpdate";
	}

}
