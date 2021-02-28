package com.gaji.SingleBungle.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

	
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public ABoard selectBoard(int boardNo, int type) {
		// 1) 게시글 상세 조회
   		ABoard temp = new ABoard();
   		temp.setBoardNo(boardNo);
   		temp.setBoardCode(type);
   		
		ABoard board = dao.selectBoard(temp);
		
		// 2) 상세 조회 성공 시 조회수 증가
		if(board!=null) {
			int result = dao.increaseReadCount(boardNo);
			
			if(result>0) { // DB 조회 수 증가 성공 시, 조회 된 board의 조회수도 1 증가
				board.setReadCount(board.getReadCount()+1);
				
			}
		}
		return board;
	}

	@Override
	public List<AAttachment> selectAttachmentList(int boardNo) {
		return dao.selectAttachmentList(boardNo);
	}



}
