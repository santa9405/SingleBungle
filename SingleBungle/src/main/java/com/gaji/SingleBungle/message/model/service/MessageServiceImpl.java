package com.gaji.SingleBungle.message.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAO dao;

	// 전체 쪽지 수 조회
	@Override
	public MessagePageInfo getPageInfo(int cp, int memberNo) {
		int listCount = dao.getListCount(memberNo);
		return null;
	}

}
