package com.gaji.SingleBungle.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaji.SingleBungle.board.model.dao.BoardDAO;
import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardAttachment;
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

	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		// 1) 게시글 상세 조회
		Board temp = new Board();
		temp.setBoardNo(boardNo);
		
		Board board = dao.selectBoard(temp);
		
		// 2) 상세 조회 성공 시 조회수 증가
		if(board != null) {
			int result = dao.increaseReadCount(boardNo);
			
			if(result > 0) {
				board.setReadCount(board.getReadCount() + 1);
			}
		}
				
		return board;
	}

	// 게시글에 포함된 이미지 목록 조회 Service 구현
	@Override
	public List<BoardAttachment> selectAttachmentList(int boardNo) {
		return dao.selectAttachmentList(boardNo);
	}
   

}