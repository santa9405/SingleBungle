package com.gaji.SingleBungle.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaji.SingleBungle.board.model.dao.BoardDAO;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	// 페이징 처리  Service 구현
	@Override
	public BoardPageInfo getPageInfo(int cp) {
		
		// 전체 게시글 수 조회
		int listCount = dao.getListCount();
		
		return new BoardPageInfo(cp, listCount, 1);
	}

	// 게시글 목록 조회 Service 구현
	@Override
	public List<Board> selectList(BoardPageInfo bpInfo) {
		return dao.selectList(bpInfo);
	}
   

}