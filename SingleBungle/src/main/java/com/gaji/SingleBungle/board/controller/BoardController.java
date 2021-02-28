package com.gaji.SingleBungle.board.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardAttachment;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

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
	@RequestMapping("list/1")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		// 1) 페이징 처리를 위한 객체 PageInfo 생성
		BoardPageInfo bpInfo = service.getPageInfo(cp);

		// 2) 게시글 목록 조회
		List<Board> bList = service.selectList(bpInfo);

		
		// 게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 forward 진행
		model.addAttribute("bList", bList);
		model.addAttribute("bpInfo", bpInfo);
		
		return "board/boardList";
	}
	
	// 게시글 상세조회 Controller
	@RequestMapping("1/{boardNo}")
	public String boardView(@PathVariable("boardNo") int boardNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		// 게시글 상세조회 Service 호출
		Board board = service.selectBoard(boardNo);
		
		String url = null;
		
		if (board != null) { // 상세 조회 성공 시

			// 상세조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
			List<BoardAttachment> attachmentList = service.selectAttachmentList(boardNo);

			// 조회된 이미지 목록이 있을 경우
			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("board", board);
			url = "board/boardView";

		} else {
			// 이전 요청 주소가 없는 경우
			if (referer == null) {
				url = "redirect:../list/" + 1;
			} else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}

		return url;
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
