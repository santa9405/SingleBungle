package com.gaji.SingleBungle.board.controller;

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

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardAttachment;
import com.gaji.SingleBungle.board.model.vo.BoardLike;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;
import com.gaji.SingleBungle.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	

	// 게시글 목록 조회 Controller
	@RequestMapping("list")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
							@ModelAttribute("loginMember") Member loginMember, RedirectAttributes ra) {
		
		BoardPageInfo bpInfo = service.getPageInfo(cp);

		List<Board> bList = service.selectList(bpInfo);
		
		List<BoardLike> likeInfo = service.selectLike(loginMember.getMemberNo());
		
		model.addAttribute("bList", bList);
		model.addAttribute("bpInfo", bpInfo);
		model.addAttribute("likeInfo", likeInfo);
		
		return "board/boardList";
	}
	
	// 검색 Controller
	@RequestMapping("search")
	public String boardSearch(@RequestParam("sk") String searchKey,
							  @RequestParam("sv") String searchValue,
							  @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							  Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("cp", cp);
		
		BoardPageInfo bpInfo = service.getSearchPageInfo(map);
		
		List<Board> bList = service.selectSearchList(map, bpInfo);
		
		model.addAttribute("bpInfo", bpInfo);
		model.addAttribute("bList", bList);
		
		return "board/boardList";
	}
	
	// 게시글 상세조회 Controller
	@RequestMapping("{boardNo}")
	public String boardView(@PathVariable("boardNo") int boardNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		Board board = service.selectBoard(boardNo);
		
		String url = null;
		
		if (board != null) {

			List<BoardAttachment> attachmentList = service.selectAttachmentList(boardNo);

			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("board", board);
			url = "board/boardView";

		} else {
			if (referer == null) {
				url = "redirect:../list";
			} else {
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
	public String insertAction(@ModelAttribute Board board,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent());
		map.put("categoryCode", board.getCategoryCode());
		
		String savePath = null;
		
		savePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		
		int result = service.insertBoard(map, images, savePath);
		
		String url = null;
		
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;
			
			// 목록 버튼 경로
			request.getSession().setAttribute("returnListURL", "../list/");
		} else {
			swalIcon = "error";
			swalTitle = "게시글 삽입 실패";
			url = "redirect:insert";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody
	@RequestMapping(value = { "insertImage", "{boardNo}/insertImage" })
	public String insertImage(HttpServletRequest request,
				 @RequestParam("uploadFile") MultipartFile uploadFile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		
		BoardAttachment at = service.insertImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
	}
	
	
	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("{boardNo}/update")
	public String boardUpdate(@PathVariable("boardNo") int boardNo, Model model) {
		
		Board board = service.selectBoard(boardNo);
		
		if(board != null) {
			List<BoardAttachment> attachmentList = service.selectAttachmentList(boardNo);
			model.addAttribute("attachmentList", attachmentList);
		}
		
		model.addAttribute("board", board);
		
		return "board/boardUpdate";
	}
	
	
	// 게시글 수정 Controller
	@RequestMapping("{boardNo}/updateAction")
	public String updateAction(@PathVariable("boardNo") int boardNo,
							@ModelAttribute Board updateBoard,
							Model model, RedirectAttributes ra, HttpServletRequest request) {
		
		updateBoard.setBoardNo(boardNo);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		
		int result = service.updateBoard(updateBoard);
		
		String url = null;
	      
	      if(result > 0) {
	         swalIcon = "success";
	         swalTitle = "게시글 수정 성공";
	         url = "redirect:../" + boardNo;
	      }else {
	         swalIcon = "error";
	         swalTitle = "게시글 수정 실패";
	         url = "redirect:" + request.getHeader("referer");
	      }
	      
	      ra.addFlashAttribute("swalIcon", swalIcon);
	      ra.addFlashAttribute("swalTitle", swalTitle);

	      return url;
	}
	

	
	// 게시글 삭제 Controller
	@RequestMapping("{boardNo}/delete")
	public String deleteBoard(@PathVariable("boardNo") int boardNo,
							@ModelAttribute Board board,
							HttpServletRequest request, RedirectAttributes ra) {
		
		board.setBoardNo(boardNo);
		
		int result = service.deleteBoard(board);
		
		String url = null;
		
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 삭제 성공";
			url = "redirect:../list";
		} else {
			swalIcon = "error";
			swalTitle = "게시글 삭제 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}
	
	// 좋아요 증가 Controller
	@ResponseBody
	@RequestMapping("increaseLike")
	public int increaseLike(@RequestParam int boardNo,
						@ModelAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("boardNo", boardNo);
		
		int result = service.increaseLike(map);
		
		return result;
	}
	
	// 좋아요 감소 Controller
	@ResponseBody
	@RequestMapping("decreaseLike")
	public int decreaseLike(@RequestParam int boardNo,
			@ModelAttribute("loginMember") Member loginMember){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("boardNo", boardNo);
		
		int result = service.decreaseLike(map);
		
		return result;
		
	}
	
	
	
	
	// 신고 페이지 연결
	@RequestMapping("boardReport")
	public String boardReport() {
		return "board/boardReport";
	}
	
	// 댓글 신고 페이지 연결
	@RequestMapping("boardReplyReport")
	public String replyReport() {
		return "board/boardReplyReport";
	}
	

}
