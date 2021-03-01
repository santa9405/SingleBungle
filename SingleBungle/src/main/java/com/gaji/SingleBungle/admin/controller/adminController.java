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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gaji.SingleBungle.admin.service.adminService;
import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;
import com.gaji.SingleBungle.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
public class adminController {
	
	@Autowired
	private adminService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 寃뚯떆占�? 紐⑸줉 議고쉶 Controller
	@RequestMapping("adminMypage")
	public String adminMypage() {
		return "admin/adminMypage";
	}
	
	@RequestMapping("boardManage")
	public String boardManageView() {
		return "admin/boardManage";
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
	public String replyManageView() {
		return "admin/replyManage";
	}
	
	@RequestMapping("replyReport")
	public String replyReportView() {
		return "admin/replyReport";
	}
	
	
	
	
	
	@RequestMapping("eventList")
	public String eventListView(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
		
		int type=4;
		APageInfo pInfo = service.getPageInfo(cp,type);
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
	
	@RequestMapping("eventView")
	public String eventView() {
		return "admin/eventView";
	}
	
	@RequestMapping("faqInsert")
	public String faqInsert() {
		return "admin/faqInsert";
	}
	
	@RequestMapping("faqView")
	public String faqView() {
		return "admin/faqView";
	}
	
	@RequestMapping("inquiryInsert")
	public String inquiryInsert() {
		return "admin/inquiryInsert";
	}
	
	@RequestMapping("inquiryList")
	public String inquiryListView() {
		return "admin/inquiryList";
	}
	
	@RequestMapping("inquiryView")
	public String inquiryView() {
		return "admin/inquiryView";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		return "admin/noticeInsert";
	}
	
	
	// 게시글 등록Controller
		@RequestMapping("noticeInsertAction")
		public String insertAction(@ModelAttribute ABoard board, 
								@ModelAttribute("loginMember") Member loginMember,
								@RequestParam(value="images", required=false) List<MultipartFile> images,
								HttpServletRequest request, RedirectAttributes ra) {
								// @ModelAttribute Board board == categoryName,boardTitle, boardContent 가져옴
								// @RequestParam(value="images", required=false) List<MultipartFile> images
								// -> <input type="file" name="images"> 태그를 모두 얻어와 images라는  List에 매핑
			
			
			// map을 이용하여 필요한 데이터 모두 담기
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("boardTitle", board.getBoardTitle());
			map.put("boardContent", board.getBoardContent());
			map.put("categoryCode",board.getCategoryCode()); // name 은 categoryName 이지만 value는 코드로 되어있다.
			
			//System.out.println(board);
			//map.put("boardType",type);
			
			
	
			String savePath = null;
			
			savePath = request.getSession().getServletContext().getRealPath("resources/adminImages");
			
			// System.out.println(savePath);
					
			// 게시글 map, 이미지 images, 저장경로 savePath
			// 게시글 삽입 Service 호출
			int result = service.insertNotice(map, images, savePath);
			
			String url = null;
			
			// 게시글 삽입 결과에 따른 View 연결 처리
			if(result>0) {
				swalIcon= "success";
				swalTitle= "게시글 등록 성공";
				url = "redirect:"+result;
				
				// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
				request.getSession().setAttribute("returnListURL", "../");
				
			}else {
				swalIcon="error";
				swalTitle = "게시글 등록 실패";
				url = "redirect:noticeInsert";
			}
			
			ra.addFlashAttribute("swalIcon",swalIcon);
			ra.addFlashAttribute("swalTitle",swalTitle);
			
			return url;
		}
	
	
	
	@RequestMapping("noticeList")
	public String noticeListView(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
		
		int type=3;
		APageInfo pInfo = service.getPageInfo(cp,type);
		List<ABoard> noticeList = service.selectList(pInfo, type);
		
		if (noticeList != null && !noticeList.isEmpty()) { // 寃뚯떆湲� 紐⑸줉 議고쉶 �꽦怨� �떆
			List<AAttachment> thumbnailList = service.selectThumbnailList(noticeList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);
		
		System.out.println(pInfo);
		
		return "admin/noticeList";
	}
	
	
	
	@RequestMapping("notice/{boardNo}")
	public String noticeView(@PathVariable("boardNo") int boardNo,
			Model model, @RequestHeader(value="referer",required=false) String referer,
			RedirectAttributes ra) {
		
		System.out.println(boardNo);
		
		int type=3;
		ABoard board = service.selectBoard(boardNo,type);
		
		String url = null;
		
		if(board!=null) {  //  상세 조회 성공 시
					
					// 상세 조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출
					List<AAttachment> attachmentList = service.selectAttachmentList(boardNo);
					
					if(attachmentList !=null & !attachmentList.isEmpty()) {
						model.addAttribute("attachmentList",attachmentList);
					}
					
					model.addAttribute("board",board);
					url = "admin/noticeView";
				}else { 
					
					if(referer == null) {// 이전 요청 주소가 없는 경우(ex. 북마크나 , 주소창으로 바로 접근을 했을 때)
						url="redirect:../";
					}else {// 이전 요청 주소가 있는 경우(ex. 사이트에서 루트를 타고 정상적으로 접근 했을 때)
						url = "redirect:" + referer;
					}
					ra.addFlashAttribute("swalIcon","error");
					ra.addFlashAttribute("swalTitle","존재하지 않는 게시글입니다.");
				}
				return url;

	}
	
}
