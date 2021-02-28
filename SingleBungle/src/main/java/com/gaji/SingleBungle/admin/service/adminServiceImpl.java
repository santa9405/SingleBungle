package com.gaji.SingleBungle.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.admin.dao.adminDAO;
import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;

@Repository
public class adminServiceImpl implements adminService{
	
	@Autowired
	private adminDAO dao;

	@Override
	public APageInfo getPageInfo(int cp, int type) {
		int listCount = dao.getListCount(type);
		return new APageInfo(cp, listCount, type);
	}

	@Override
	public List<ABoard> selectList(APageInfo pInfo, int type) {
		return dao.selectList(pInfo);
	}

	@Override
	public List<AAttachment> selectThumbnailList(List<ABoard> eventList) {
		return dao.selectThumbnailList(eventList);
	}



}
