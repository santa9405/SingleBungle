package com.gaji.SingleBungle.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gaji.SingleBungle.board.model.service.BoardService;

@Controller
/*@SessionAttributes({"loginMember"})*/
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("message")
	public String message() {
		return "message/message";
	}
	

	

	

	

}
