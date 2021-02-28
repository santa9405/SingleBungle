package com.gaji.SingleBungle.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.member.model.service.MemberService;
import com.gaji.SingleBungle.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동.
public class memberController {
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	@Autowired
	private MemberService service;

	
	
	
	// 로그인 화면 전환용 Controller
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}
	
	// 로그인 동작 Controller
	@RequestMapping("loginAction")
	public String loginAction(Member inputMember, 
							  @RequestParam(value="saveId", required = false) String saveId,
							  HttpServletResponse response,
							  RedirectAttributes ra,
							  Model model    /* HttpSession session */ ) {
		
		// inputMember -> memberId, memberPwd
		System.out.println(inputMember);
		/* Member [memberNo=0, memberId=user01, memberPwd=pass01, memberName=null, memberPhone=null, memberEmail=null,
		memberAddress=null, memberInterest=null, memberEnrollDate=null, memberStatus=null, memberGrade=null] */ 
		
		// 비즈니스 로직 수행 후 결과 반환받기
		Member loginMember = service.loginAction(inputMember);
		System.out.println(loginMember); // 결과 확인용
		
		//session.setAttribute("loginMember", loginMember);
		
		// Model : 전달하고자 하는 데이터를 맵 형식 (K : V)형태로 담아서 전달하는 용도의 객체
		// Model 객체는 기본적으로 request scope 이지만
		// 클래스 위쪽에 작성된 @SessionAttributes를 이용하면 session scope로 변경됨.
		
		
		String url = null; // 로그인 성공 또는 실패 시의 요청 경로를 저장할 변수
		
		if(loginMember != null) { // 로그인 성공 시 
			model.addAttribute("loginMember", loginMember);
			
			// 쿠키 생성
			// javax.servlet.http.Cookie 로 import
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			// 쿠키 유지 시간 지정
			if(saveId != null){ // 아이디 저장이 체크 되었을 경우
				// 한달 동안 유지되는 쿠키 생성
				cookie.setMaxAge(60 * 60 * 24 * 30); // 초 단위로 지정
				
			} else { // 아이디 저장이 체크 되어있지 않은 경우
				
				cookie.setMaxAge(0);
				// - 쿠키를 생성하지 않겠다.
				// - 기존에 있던 쿠키도 없애겠다.
			}
			
			// 생성된 쿠키 객체를 응답 객체에 담아서 내보냄
			response.addCookie(cookie);
			
			url = "/"; // 성공 시 메인페이지
			
			// cookie와 session의 차이점?!
			// 공통점 : 둘 다 어디서든 꺼내와 쓸 수 있다.
			// 각자 데이터를 어느쪽에서 관리하느냐에 따라 차이가 있음.
			// cookie는 client쪽 파일의 형식으로 저장 / session은 server쪽에서 관리를 하고 저장. 
			// cookie는 오래 저장되어 직접 삭제를 해야함 / session은 브라우저가 종료되거나 시간이 지나면 사라짐. 
			
		} else { // 로그인 실패 시
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "로그인 실패");
			ra.addFlashAttribute("swalText", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			url = "login"; // 로그인 실패 시 로그인 전환 화면으로 재요청하는 주소를 작성. 
		}
		
		return "redirect:" + url;
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
