package com.gaji.SingleBungle.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.admin.service.adminService;
import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;
import com.gaji.SingleBungle.admin.vo.IAttachment;
import com.gaji.SingleBungle.admin.vo.Reply;
import com.gaji.SingleBungle.admin.vo.inquiry;
import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardAttachment;
import com.gaji.SingleBungle.cafe.model.service.CafeService;
import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendAttachment;
import com.gaji.SingleBungle.market.model.service.MarketService;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketAttachment;
import com.gaji.SingleBungle.member.model.vo.Member;
import com.gaji.SingleBungle.review.model.service.ReviewService;
import com.gaji.SingleBungle.review.model.vo.Review;
import com.gaji.SingleBungle.review.model.vo.ReviewAttachment;
import com.gaji.SingleBungle.review.model.vo.ReviewLike;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/admin/*")
public class adminController {

	@Autowired
	private adminService service;
	private BoardService service1;
	private ReviewService service2;
	private CafeService service6;
	private FindFriendService service7;
	private MarketService service8;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("eventList")
	public String eventListView(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		int type = 4;
		APageInfo pInfo = service.getPageInfo(cp, type);
		pInfo.setLimit(9);
		List<ABoard> eventList = service.selectList(pInfo, type);

		if (eventList != null && !eventList.isEmpty()) { // 寃뚯떆湲� 紐⑸줉 議고쉶 �꽦怨� �떆
			List<AAttachment> thumbnailList = service.selectThumbnailList(eventList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}

		model.addAttribute("eventList", eventList);
		model.addAttribute("pInfo", pInfo);

		return "admin/eventList";
	}

	@RequestMapping("event/{boardNo}")
	public String eventView(@PathVariable("boardNo") int boardNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		int type = 4;
		ABoard board = service.selectBoard(boardNo, type);

		String url = null;

		if (board != null) { // 상세 조회 성공 시

			// 상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<AAttachment> attachmentList = service.selectAttachmentList(boardNo);

			if (attachmentList != null & !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("board", board);
			url = "admin/eventView";
		} else {

			if (referer == null) {// 이전 요청 주소가 없는 경우(ex. 북마크나 , 주소창으로 바로 접근을 했을 때)
				url = "redirect:../";
			} else {// 이전 요청 주소가 있는 경우(ex. 사이트에서 루트를 타고 정상적으로 접근 했을 때)
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return url;
	}

	@RequestMapping("eventInsert")
	public String eventInsert() {
		return "admin/eventInsert";
	}

	// 게시글 등록Controller
	@RequestMapping("eventInsertAction")
	public String eventInsertAction(@ModelAttribute ABoard board, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {
		// @ModelAttribute Board board == categoryName,boardTitle, boardContent 가져옴
		// @RequestParam(value="images", required=false) List<MultipartFile> images
		// -> <input type="file" name="images"> 태그를 모두 얻어와 images라는 List에 매핑

		// map을 이용하여 필요한 데이터 모두 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent()); // name 은 categoryName 이지만 value는 코드로 되어있다.

		String savePath = null;

		savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		System.out.println(images);

		// 게시글 map, 이미지 images, 저장경로 savePath
		// 게시글 삽입 Service 호출
		int result = service.insertEvent(map, images, savePath);

		String url = null;

		// 게시글 삽입 결과에 따른 View 연결 처리
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:event/" + result;

			// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../");

		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:noticeInsert";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	// ----------------------------------------------------FAQ

	@RequestMapping("faqInsert")
	public String faqInsert() {
		return "admin/faqInsert";
	}

	// 게시글 등록Controller
	@RequestMapping("insertFaqAction")
	public String insertFaqAction(@ModelAttribute ABoard board, @RequestParam(value = "categoryCode") int categoryCode,
			HttpServletRequest request, RedirectAttributes ra) {

		System.out.println(categoryCode);
		System.out.println(board);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent());
		map.put("categoryCode", categoryCode);

		// 게시글 map, 이미지 images, 저장경로 savePath
		// 게시글 삽입 Service 호출
		int result = service.insertFaqAction(map);

		String url = null;

		// 게시글 삽입 결과에 따른 View 연결 처리
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:faqView";

			// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../");

		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:noticeInsert";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	@RequestMapping("faqView")
	public String faqView(Model model) {

		int type = 5;
		List<ABoard> board = service.selectFaqList(type);

		model.addAttribute("board", board);

		return "admin/faqView";
	}

	// -------------------------------notice

	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		return "admin/noticeInsert";
	}

	// 게시글 등록Controller
	@RequestMapping("noticeInsertAction")
	public String insertAction(@ModelAttribute ABoard board, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {
		// @ModelAttribute Board board == categoryName,boardTitle, boardContent 가져옴
		// @RequestParam(value="images", required=false) List<MultipartFile> images
		// -> <input type="file" name="images"> 태그를 모두 얻어와 images라는 List에 매핑

		// map을 이용하여 필요한 데이터 모두 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent()); // name 은 categoryName 이지만 value는 코드로 되어있다.

		String savePath = null;

		savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		System.out.println(images);

		// 게시글 map, 이미지 images, 저장경로 savePath
		// 게시글 삽입 Service 호출
		int result = service.insertNotice(map, images, savePath);

		String url = null;

		// 게시글 삽입 결과에 따른 View 연결 처리
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:notice/" + result;

			// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../");

		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:noticeInsert";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	@RequestMapping("noticeList")
	public String noticeListView(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		int type = 3;
		APageInfo pInfo = service.getPageInfo(cp, type);
		pInfo.setLimit(10);
		List<ABoard> noticeList = service.selectList(pInfo, type);

		if (noticeList != null && !noticeList.isEmpty()) { // 寃뚯떆湲� 紐⑸줉 議고쉶 �꽦怨� �떆
			List<AAttachment> thumbnailList = service.selectThumbnailList(noticeList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);

		return "admin/noticeList";
	}

	@RequestMapping("notice/{boardNo}")
	public String noticeView(@PathVariable("boardNo") int boardNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		int type = 3;
		ABoard board = service.selectBoard(boardNo, type);

		String url = null;

		if (board != null) { // 상세 조회 성공 시

			// 상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<AAttachment> attachmentList = service.selectAttachmentList(boardNo);

			if (attachmentList != null & !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("board", board);
			url = "admin/noticeView";
		} else {

			if (referer == null) {// 이전 요청 주소가 없는 경우(ex. 북마크나 , 주소창으로 바로 접근을 했을 때)
				url = "redirect:../";
			} else {// 이전 요청 주소가 있는 경우(ex. 사이트에서 루트를 타고 정상적으로 접근 했을 때)
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return url;

	}

	// ------------------------------------------------delete
	@RequestMapping("{boardNo}/{boardCode}/delete")
	public String noticeDelete(@PathVariable("boardNo") int boardNo, @PathVariable("boardCode") int boardCode,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		// System.out.println(boardNo);

		System.out.println(boardCode);
		System.out.println(boardNo);

		/*
		 * int boardNo = Integer.parseInt(boardNo1); int boardCode =
		 * Integer.parseInt(boardCode1);
		 */

		int result = service.deleteBoard(boardNo);
		String url = null;

		if (result > 0) {
			ra.addFlashAttribute("swalIcon", "success");
			ra.addFlashAttribute("swalTitle", "삭제성공하였습니다.");

			switch (boardCode) {
			case 3:
				url = "redirect:../../noticeList";
				break;

			case 4:
				url = "redirect:../../eventList";
				break;
			default:
				url = "redirect:" + referer;
				break;
			}
		} else {
			url = "redirect:" + referer;
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}

		return url;

	}

	// ----------------------------------------------------------------------------------update
	// 게시글 수정 화면 전환
	@RequestMapping("{boardNo}/{boardCode}/update")
	public String update(@PathVariable("boardNo") int boardNo, @PathVariable("boardCode") int boardCode, Model model) {

		ABoard board = service.selectBoard(boardNo, boardCode);

		model.addAttribute("board", board);

		String url = null;
		if (boardCode == 3)
			url = "admin/noticeUpdate";
		else if (boardCode == 4)
			url = "admin/eventUpdate";

		return url;
	}

	// 게시글 수정
	@RequestMapping("updateAction")
	public String updateAction(@ModelAttribute ABoard updateBoard, Model model, RedirectAttributes ra,
			HttpServletRequest request, @RequestParam(value = "boardNo") int boardNo,
			@RequestParam(value = "boardCode") int boardCode) {

		updateBoard.setBoardNo(boardNo);
		updateBoard.setBoardCode(boardCode);
//			System.out.println(updateBoard);

//			// 파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		int result = service.updateBoard(updateBoard, savePath);

		String url = null;
		String boardType = null;

		if (boardCode == 3)
			boardType = "notice/";
		else if (boardCode == 4)
			boardType = "event/";

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../admin/" + boardType + boardNo;

		} else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

//			return url;
		return url;
	}

	// ---------------------------------------------summernote에 업로드된 이미지 저장
	// Controller
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {
		// 실제 파일 경로(파일을 어디에 저장할지) 지정할 때 사용 -> HttpServletRequest request
		// 비동기로 파일 저장 == 저장하려는 이미지 얻어옴
		// ->@RequestParam("uploadFile") MultipartFile uploadFile (uploadFile->파일자체를
		// 담고있음 )

		// 서버에 파일(이미지)를 저장할 폴더 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		AAttachment at = service.insertImage(uploadFile, savePath);
		// 어느 위치에, 어떤 파일을 저장하겠다는 service 수행

		System.out.println(at);

		// java에서 js로 객체 전달할 때 JSON을 사용한다.
		// 문자열이지만 자바스크립트 객체 모양 "{}"을 하고있다.
		// gson을 사용함.
		return new Gson().toJson(at);
	}

	@ResponseBody
	@RequestMapping("{boardNo}/{boardCode}/insertImage")
	public String insertImage2(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {
		// 실제 파일 경로(파일을 어디에 저장할지) 지정할 때 사용 -> HttpServletRequest request
		// 비동기로 파일 저장 == 저장하려는 이미지 얻어옴
		// ->@RequestParam("uploadFile") MultipartFile uploadFile (uploadFile->파일자체를
		// 담고있음 )

		// 서버에 파일(이미지)를 저장할 폴더 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		AAttachment at = service.insertImage(uploadFile, savePath);
		// 어느 위치에, 어떤 파일을 저장하겠다는 service 수행

		System.out.println(at);

		// java에서 js로 객체 전달할 때 JSON을 사용한다.
		// 문자열이지만 자바스크립트 객체 모양 "{}"을 하고있다.
		// gson을 사용함.
		return new Gson().toJson(at);
	}

	// ---------------------------------------------------inquiry
	@RequestMapping("inquiryInsert")
	public String inquiryInsert() {
		return "admin/inquiryInsert";
	}

	@RequestMapping("insertinquiryAction")
	public String insertinquiryAction(@ModelAttribute inquiry board,
			@RequestParam(value = "categoryCode") int categoryCode, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {

		System.out.println(categoryCode);
		System.out.println(board);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("inquiryTitle", board.getInquiryTitle());
		map.put("inquiryContent", board.getInquiryContent());
		map.put("categoryCode", categoryCode);
		map.put("memberNo", loginMember.getMemberNo());

		String savePath = null;

		savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");

		// 게시글 map, 이미지 images, 저장경로 savePath
		// 게시글 삽입 Service 호출
		int result = service.insertinquiryAction(map, images, savePath);

		String url = null;

		// 게시글 삽입 결과에 따른 View 연결 처리
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:inquiryView";

			// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../");

		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:inquiryInsert";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	@RequestMapping("inquiryList")
	public String inquiryList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		APageInfo pInfo = service.getInquiryPageInfo(cp);
		pInfo.setLimit(10);
		int memberNo = loginMember.getMemberNo();
		List<inquiry> inquiryList = service.inquiryList(pInfo, memberNo);

		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("pInfo", pInfo);
		return "admin/inquiryList";
	}

	@RequestMapping("inquiry/{inquiryNo}")
	public String inquiryView(@PathVariable("inquiryNo") int inquiryNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		inquiry inquiry = service.selectInquiryBoard(inquiryNo);

		System.out.println(inquiry);
		String url = null;

		if (inquiry != null) { // 상세 조회 성공 시

			// 상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<IAttachment> attachmentList = service.selectIAttachmentList(inquiryNo);

			if (attachmentList != null & !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("inquiry", inquiry);
			url = "admin/inquiryView";
		} else {

			if (referer == null) {// 이전 요청 주소가 없는 경우(ex. 북마크나 , 주소창으로 바로 접근을 했을 때)
				url = "redirect:../";
			} else {// 이전 요청 주소가 있는 경우(ex. 사이트에서 루트를 타고 정상적으로 접근 했을 때)
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return url;
	}

	@RequestMapping("{inquiryNo}/inquiryDelete")
	public String inquiryDelete(@PathVariable("inquiryNo") int inquiryNo,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		int result = service.deleteInquiry(inquiryNo);
		String url = null;

		if (result > 0) {
			ra.addFlashAttribute("swalIcon", "success");
			ra.addFlashAttribute("swalTitle", "삭제성공하였습니다.");
			url = "redirect:../inquiryList";

		} else {
			url = "redirect:" + referer;
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}

		return url;

	}

	// ------------------------------------------------------------------------
	// 관리자 컨트롤러
	@RequestMapping("adminMypage")
	public String adminMypage() {
		return "admin/adminMypage";
	}

	// -------------------------------------삭제된 게시글 조회
	@RequestMapping("boardManage")
	public String boardManageView(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		APageInfo pInfo = service.getAllPageInfo(cp);
		pInfo.setLimit(10);
		List<ABoard> boardList = service.selectAllList(pInfo);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pInfo", pInfo);

		return "admin/boardManage";
	}

	// 삭제게시글 복구
	@ResponseBody
	@RequestMapping("recoverBoard")
	public boolean recoverBoard(@RequestParam(value = "boardNoList[]") int[] boardNoList,
			@RequestParam(value = "boardCodeList[]") int[] boardCodeList, @RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		int result = 0;
		boolean flag = false;
		
		for (int i = 0; i < boardNoList.length; i++) {
			int boardNo = boardNoList[i];
			int boardCode = boardCodeList[i];

			result = service.recoverBoard(boardNo, boardCode);

			if(result>0) {
				flag = true;
			}else {
				flag = false;
			}
		}

		return flag;
	}

	@RequestMapping("boardReport")
	public String boardReportView() {
		return "admin/boardReport";
	}

	@RequestMapping("levelList")
	public String levelListView() {
		return "admin/levelList";
	}

	@RequestMapping("memberList")
	public String memberListView() {
		return "admin/memberList";
	}

	@RequestMapping("replyManage")
	public String replyManageView(Model model) {

		List<Reply> replyList = service.selectAllReply();
		model.addAttribute("replyList", replyList);
		return "admin/replyManage";
	}

	@RequestMapping("replyReport")
	public String replyReportView() {
		return "admin/replyReport";
	}

}
