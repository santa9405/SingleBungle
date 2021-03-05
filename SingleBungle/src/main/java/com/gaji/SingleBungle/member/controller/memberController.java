package com.gaji.SingleBungle.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.member.model.service.MemberService;
import com.gaji.SingleBungle.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동.
public class memberController {

	// sweet alert 메세지 전달용 변수 선언
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@Autowired
	private MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	
	// 로그인 화면 전환용 Controller
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}

	// 로그인 동작 Controller
	@RequestMapping("loginAction")
	public String loginAction(Member inputMember, @RequestParam(value = "saveId", required = false) String saveId,
			HttpServletResponse response, RedirectAttributes ra, Model model /* HttpSession session */ ) {

		// inputMember -> memberId, memberPwd
		System.out.println("inputMember : "+inputMember);
		/*
		 * Member [memberNo=0, memberId=user01, memberPwd=pass01, memberName=null,
		 * memberPhone=null, memberEmail=null, memberAddress=null, memberInterest=null,
		 * memberEnrollDate=null, memberStatus=null, memberGrade=null]
		 */

		// 비즈니스 로직 수행 후 결과 반환받기
		Member loginMember = service.loginAction(inputMember);
		System.out.println("loginMember : "+ loginMember); // 결과 확인용

		// session.setAttribute("loginMember", loginMember);

		// Model : 전달하고자 하는 데이터를 맵 형식 (K : V)형태로 담아서 전달하는 용도의 객체
		// Model 객체는 기본적으로 request scope 이지만
		// 클래스 위쪽에 작성된 @SessionAttributes를 이용하면 session scope로 변경됨.

		String url = null; // 로그인 성공 또는 실패 시의 요청 경로를 저장할 변수

		if (loginMember != null) { // 로그인 성공 시
			model.addAttribute("loginMember", loginMember);

			// 쿠키 생성
			// javax.servlet.http.Cookie 로 import
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());

			// 쿠키 유지 시간 지정
			if (saveId != null) { // 아이디 저장이 체크 되었을 경우
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

	// 로그아웃 Controller
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();

		return "redirect:/"; // 메인 화면으로 재요청
	}

	// 회원가입 화면 전환 Controller 
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUpView";
	}

	// 아이디 중복 체크 Controller (AJAX)
	@RequestMapping("idDupCheck")
	@ResponseBody
	public int idDupCheck(@RequestParam("memberId") String memberId) {

		// System.out.println(memberId);

		// 아이디 중복 검사 서비스 호출
		int result = service.idDupCheck(memberId);

		// 컨트롤러에서 반환되는 값은 forward 또는 redirect를 위한 경로/주소가 작성되는 게 일반적
		// -> 컨트롤러에서 반환 시 Dispatcher Servlet으로 이동되어
		// View Resolver 또는 Handler Mapping으로 연결됨.

		// AJAX에서 반환값이 주소/경로가 아닌 값 자체로 인식해서
		// 요청 부분으로 돌아가게 하는 별도 방법이 존재
		// == @ResponseBody

		return result;
	}
	
	
	// 하는중... 
	// 닉네임 중복 체크 Controller (AJAX)
	@RequestMapping("nnDupCheck")
	@ResponseBody
	public int nnDupCheck(@RequestParam("memberNickname") String memberNickname) {
		// System.out.println(memberId);
		int result = service.nnDupCheck(memberNickname);
		return result;
	}
	

	// 회원가입 Controller
	@RequestMapping("signUpAction")
	public String signUpAction(@ModelAttribute Member signUpMember, RedirectAttributes ra // redirect시 데이터 전달용 객체
	/* ,String memberInterest */ ) {

		// signUpMember : 회원 가입 시 입력한 값들이 저장된 커맨드 객체
		// System.out.println(signupMember);

		// 값이 넘어오는 지 확인(배열로 확인) : String[] memberInterest
		// System.out.println(Arrays.toString(memberInterest));
		// [운동, 영화, 요리]

		// 동일한 name 속성을 가진 input 태그 값은
		// String[]에 저장할 경우, 배열 요소로 저장되며
		// String으로 저장할 경우 ","로 구분된 한 줄의 문자열이 된다.
		// System.out.println(memberInterest);
		// 운동, 영화, 요리

		// 회원가입 서비스 호출(성공 시 1, 실패 시 0이 반환됨 (mybatis-insert))
		
		System.out.println(signUpMember);
		
		int result = service.signUp(signUpMember);
		
		System.out.println(signUpMember);
		
		// 회원 가입 성공 여부에 따른 메세지 지정
		if (result > 0) { // 성공
			swalIcon = "success";
			swalTitle = "회원 가입 성공";
			swalText = "회원가입을 환영합니다.";

		} else { // 실패
			swalIcon = "error";
			swalTitle = "회원 가입 실패";
			swalText = "회원가입 과정에서 문제가 발생했습니다.";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);

		return "redirect:/"; // 메인화면으로 돌아가게 재요청
	}

	
	// ---------------------------------------------------
	// 회원가입 이메일 발송 Controller (AJAX)
	// ---------------------------------------------------
	@RequestMapping("SignUpMail")
	@ResponseBody
	public String SignUpMail(HttpServletRequest request) {

		String setfrom = "singlebungle.dev@gmail.com";
		String tomail = request.getParameter("mail"); // 받는 사람 이메일
		String title = "[싱글벙글] 회원 가입에 필요한 이메일 인증 키값 전송"; // 제목
		String content = "키 값을 인증번호 확인영역에 입력해주세요."; // 내용
		String key = "";

		try {
			Random random = new Random();

			for (int i = 0; i < 3; i++) {
				int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
				key += (char) index;
			}
			int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
			key += numIndex;

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content + key); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return key;
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

	@ExceptionHandler(Exception.class) // 모든 예외를 처리하겠다
	public String etcException(Exception e, Model model) {
		// 특정 예외를 제외한 나머지 예외 처리

		e.printStackTrace(); // 예외 내용 출력
		model.addAttribute("errorMsg", "회원 관련 서비스 처리 중 오류 발생");
		return "common/errorPage";
	}

}
