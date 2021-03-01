package com.gaji.SingleBungle.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

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


	/** 게시글 삽입 (+ 파일 업로드) Service
	 * @param map
	 * @param images
	 * @param savePath
	 * @return result
	 */
	public abstract int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath);


	/** 게시글 삭제 Service
	 * @param board
	 * @return result
	 */
	public abstract int deleteBoard(Board board);


	/** 게시글 검색 목록 페이징 Service
	 * @param map
	 * @return bpInfo
	 */
	public abstract BoardPageInfo getSearchPageInfo(Map<String, Object> map);


	/** 게시글 검색 목록 조회 Service
	 * @param map
	 * @param bpInfo
	 * @return bList
	 */
	public abstract List<Board> selectSearchList(Map<String, Object> map, BoardPageInfo bpInfo);


	/** summernote 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @return at
	 */
	public abstract BoardAttachment inserImage(MultipartFile uploadFile, String savePath);
	
	

}
