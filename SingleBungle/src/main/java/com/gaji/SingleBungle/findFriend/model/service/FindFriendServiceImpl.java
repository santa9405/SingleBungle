package com.gaji.SingleBungle.findFriend.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.findFriend.model.dao.FindFriendDAO;

@Service
public class FindFriendServiceImpl implements FindFriendService {
	
	@Autowired
	private FindFriendDAO dao;

}
