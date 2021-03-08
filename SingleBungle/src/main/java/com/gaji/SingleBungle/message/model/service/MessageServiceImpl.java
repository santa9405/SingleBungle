package com.gaji.SingleBungle.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.message.model.vo.Message;
import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAO dao;

	// 보낸 쪽지 수 조회 
	@Override
	public MessagePageInfo getSendPageInfo(int cp, int memberNo) {
		int listCount = dao.getSendListCount(memberNo);
		return new MessagePageInfo(cp, listCount);
	}

	// 보낸 쪽지 목록 조회
	@Override
	public List<Message> selectSendList(Map<String, Object> map) {
		return dao.selectSendList(map);
	}

}
