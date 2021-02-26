package com.gaji.SingleBungle.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.board.model.dao.BoardReplyDAO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Autowired
	private BoardReplyDAO dao;

}
