package com.gaji.SingleBungle.findFriend.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;

public class ChattingWebsocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private FindFriendService service;
	

}
