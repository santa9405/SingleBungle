package com.gaji.SingleBungle.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.admin.vo.inquiryReply;

@Repository
public class inquiryReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<inquiryReply> selectReplyList(int parentBoardNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int insertReply(inquiryReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateReply(inquiryReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteReply(int replyNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
