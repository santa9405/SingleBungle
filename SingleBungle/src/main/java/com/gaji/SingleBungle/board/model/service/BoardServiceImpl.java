package com.gaji.SingleBungle.board.model.service;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.board.model.dao.BoardDAO;
import com.gaji.SingleBungle.board.model.exception.BoardInsertAttachmentFailException;
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

		Board temp = new Board();
		temp.setBoardNo(boardNo);
		
		Board board = dao.selectBoard(temp);
		
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
	
	// summernote 업로드 이미지 저장 Service 구현
	@Override
	public BoardAttachment inserImage(MultipartFile uploadFile, String savePath) {
		
		String fileName = rename(uploadFile.getOriginalFilename());
		
		String filePath = "/resources/boardImages";
		
		BoardAttachment at = new BoardAttachment();
		at.setFilePath(filePath);
		at.setFileName(fileName);
		
		try {
			uploadFile.transferTo( new File( savePath + "/" + fileName ) );
		} catch (Exception e) {
			e.printStackTrace();
			
			throw new BoardInsertAttachmentFailException("summernote 파일 업로드 실패");
		}
		
		return at;
	}
	
   // 파일명 변경 메소드
   public String rename(String originFileName) {
      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
         
      int ranNum = (int)(Math.random()*100000);
         
      String str = "_" + String.format("%05d", ranNum);
         
      String ext = originFileName.substring(originFileName.lastIndexOf("."));
         
      return date + str + ext;
      }

	// 게시글 삽입 Service 구현
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		
		int result = 0;
		
		int boardNo = dao.selectNextNo();
		
		// 게시글 삽입
		if(boardNo > 0) {
			map.put("boardNo", boardNo);
			
			result = dao.insertBoard(map);
            
			
            
            // 게시글 삽입 성공 시 이미지 정보 삽입
            if(result > 0) {
            	
            	List<BoardAttachment> uploadImages = new ArrayList<BoardAttachment>();
            	
            	String filePath = null;
            	
            	filePath = "/resources/boardImages";

            // ---------------------------------------------------- summernote
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
				
				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher((String)map.get("boardContent"));     
				 
				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수
				
				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
				while(matcher.find()){
					src =  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
					
					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
					
					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.
					
					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					BoardAttachment at = new BoardAttachment(filePath, fileName, boardNo);
					uploadImages.add(at);
				}

            if(!uploadImages.isEmpty()) { // 업로드된 이미지가 있을 경우
               // 파일 정보 삽입 DAO 호출
               result = dao.insertAttachmentList(uploadImages);
               // result == 삽입된 행의 개수
               
               // 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
               if(result == uploadImages.size()) {
                  result = boardNo; // result에 boardNo 저장
                  
               } else {
                  throw new BoardInsertAttachmentFailException("파일 정보 DB 삽입 실패");
               }
            }else { // 업로드된 이미지가 없을 경우
            	result = boardNo;
            }
         }
	}
         return result;
      }
	
	
   // 크로스 사이트 스크립트 방지 처리 메소드
   private String replaceParameter(String param) {
      String result = param;
      if(param != null) {
         result = result.replaceAll("&", "&amp;");
         result = result.replaceAll("<", "&lt;");
         result = result.replaceAll(">", "&gt;");
         result = result.replaceAll("\"", "&quot;");
      }
         
      return result;
   }
      


   
   	// 게시글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(Board board) {
		return dao.deleteBoard(board);
	}

	// 게시글 검색 목록 페이징 Service 구현
	@Override
	public BoardPageInfo getSearchPageInfo(Map<String, Object> map) {
		
		int listCount = dao.getSearchListCount(map);
				
		return new BoardPageInfo((int)map.get("cp"), listCount);
	}

	// 게시글 검색 목록 조회 Service 구현
	@Override
	public List<Board> selectSearchList(Map<String, Object> map, BoardPageInfo bpInfo) {
		return dao.selectSearchList(map, bpInfo);
	}




   

}