package com.gaji.SingleBungle.main.model.service;

import java.util.List;

import com.gaji.SingleBungle.board.model.vo.Board;
import com.gaji.SingleBungle.board.model.vo.BoardPageInfo;

public interface MainService {

	
	
	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return bpInfo
	 */
	public abstract BoardPageInfo getPageInfo(int cp);
	
	/** 자유게시판 메인 게시글 목록 조회 Service
	 * @param  
	 * @return
	 */
	public abstract List<Board> selectList(BoardPageInfo bpInfo);


}
