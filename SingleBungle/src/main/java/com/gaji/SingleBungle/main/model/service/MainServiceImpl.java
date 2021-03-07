package com.gaji.SingleBungle.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;
import com.gaji.SingleBungle.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {
	

	@Autowired
	private MainDAO dao;

	// 페이징 처리  Service 구현
	@Override
	public BoardPageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new BoardPageInfo(cp, listCount, 1);
	}
	
	
	// 자유게시판 메인 게시글 목록 조회 Service 구현
	@Override
	public List<Board> selectList(BoardPageInfo bpInfo) {
		return dao.selectList(bpInfo);
	}




	
	

}
