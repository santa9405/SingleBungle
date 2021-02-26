package com.gaji.SingleBungle.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;
import com.gaji.SingleBungle.cafe.model.service.CafeService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/cafe/*")
public class CafeController {
	
	@Autowired
	private CafeService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	
	
	// 寃뚯떆湲� 紐⑸줉 議고쉶 Controller
	@RequestMapping("list")
	public String CafeList() {
		return "cafe/cafeList";
	}
	
	// 寃뚯떆湲� �긽�꽭議고쉶 Controller
	@RequestMapping("view")
	public String cafeView() {
		return "cafe/cafeView";
	}
	
	// 寃뚯떆湲� �벑濡� �솕硫� �쟾�솚�슜 Controller
	@RequestMapping("insert")
	public String cafeInsert() {
		return "cafe/cafeInsert";
	}
	
	// 寃뚯떆湲� �벑濡� Controller
	@RequestMapping("insertAction")
	public String insertAction() {
		return null;
	}
	
	// 寃뚯떆湲� �닔�젙 �솕硫� �쟾�솚�슜 Controller
	@RequestMapping("update")
	public String cafeUpdate() {
		return "cafe/cafeUpdate";
	}
	
	// 寃뚯떆湲� �닔�젙 Controller
	@RequestMapping("updateAction")
	public String updateAction() {
		return null;
	}
	
	// summernote -----------------------------
	// summernote�뿉 �뾽濡쒕뱶�맂 �씠誘몄� ���옣 Controller
	
	@ResponseBody // �쓳�떟 �떆 媛� �옄泥대�� �룎�젮蹂대깂
	@RequestMapping("insertImage")
	public String insertImage() {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
//	// �떊怨� �럹�씠吏� �뿰寃�
//	@RequestMapping("report")
//	public String cafeReport() {
//		return "cafe/cafeReport";
//	}
//	
//	// �뙎湲� �떊怨� �럹�씠吏� �뿰寃�
//	@RequestMapping("replyReport")
//	public String replyReport() {
//		return "cafe/cafeReplyReport";
//	}
	

}
