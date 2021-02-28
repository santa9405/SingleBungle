package com.gaji.SingleBungle.board.model.service;

import java.util.List;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardAttachment;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

public interface BoardService {

	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return bpInfo
	 */
	public abstract BoardPageInfo getPageInfo(int cp);

	
	/** 게시글 목록 조회 Service
	 * @param bpInfo
	 * @return bList
	 */
	public abstract List<Board> selectList(BoardPageInfo bpInfo);


	/** 게시글 상세 조회 Service
	 * @param boardNo
	 * @return board
	 */
	public abstract Board selectBoard(int boardNo);


	/** 게시글에 포함된 이미지 목록 조회 Service
	 * @param boardNo
	 * @return attachmentList
	 */
	public abstract List<BoardAttachment> selectAttachmentList(int boardNo);
	
	

}
