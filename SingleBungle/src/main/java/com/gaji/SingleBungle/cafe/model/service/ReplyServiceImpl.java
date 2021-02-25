package com.gaji.SingleBungle.cafe.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.cafe.model.dao.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO dao;



}
