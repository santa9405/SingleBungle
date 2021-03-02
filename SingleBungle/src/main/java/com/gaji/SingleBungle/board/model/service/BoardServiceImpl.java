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
import com.gaji.SingleBungle.board.model.exception.BoardUpdateAttachmentFailException;
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
	public BoardAttachment insertImage(MultipartFile uploadFile, String savePath) {
		
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
				int fileLevel = 1;
				
				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
				while(matcher.find()){
					src =  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
					
					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
					
					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.
					
					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					BoardAttachment at = new BoardAttachment(filePath, fileName, fileLevel, boardNo);
					uploadImages.add(at);
					fileLevel++;
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

			} else { // 업로드된 이미지가 없을 경우
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
      
//	// 게시글 수정 Service 구현
//   	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int updateBoard(Board updateBoard, List<MultipartFile> images, String savePath, boolean[] deleteImages) {
//   		
//        updateBoard.setBoardTitle(replaceParameter(updateBoard.getBoardTitle()));
//        updateBoard.setBoardContent(replaceParameter(updateBoard.getBoardContent()));
//        
//        int result = dao.updateBoard(updateBoard);
//        
//        // 2) 이미지 수정 (난이도 * X 100)
//        if(result>0) {
//           
//           List<BoardAttachment> oldFiles = dao.selectAttachmentList(updateBoard.getBoardNo());
//
//           List<BoardAttachment> uploadImages = new ArrayList<BoardAttachment>();
//           
//           List<BoardAttachment> removeFileList= new ArrayList<BoardAttachment>();
//           
//           String filePath = "/resources/boardImages";
//           
//           // 새롭게 업로드된 파일 정보를 가지고 있는 images에 반복 접근
//           for(int i=0; i<images.size(); i++) {
//              
//              // 업로드된 이미지가 있을 경우
//              if(!images.get(i).getOriginalFilename().equals("")) {
//                 
//                 // 파일명 변경
//                 String fileName = rename(images.get(i).getOriginalFilename());
//                 
//                 // Attachment 객체 생성
//                 BoardAttachment at = new BoardAttachment(filePath, fileName, i, updateBoard.getBoardNo());   
//                 
//                 uploadImages.add(at); // 업로드 이미지 리시트에 추가
//                 
//                 // true : update 진행
//                 // false : insert 진행
//                 boolean flag = false;
//                 
//                 // 새로운 파일 정보와 이전 파일 정보를 비교
//                 for(BoardAttachment old : oldFiles) {
//                    
//                    if(old.getFileLevel() == i ) {
//                       // 현재 접근한 이전 파일의 레벨이
//                       // 새롭게 업로드한 파일의 레벨과 같은 경우 == 같은 레벨의 새로운 이미지 업로드 --> update 진행
//                       flag = true;
//                       
//                       // DB에서 파일 번호가 일치하는 행의 내용을 수정하기 위해 파일 번호를 얻어옴.
//                       at.setFileNo(old.getFileNo());
//                       
//                       removeFileList.add(old); // 삭제할 파일 목록에 이전 파일 정보 추가
//                    }
//                 }
//                 
//                 // flag 값에 따른 insert / update 제어
//                 if(flag) { // true : update 진행
//                    result = dao.updateAttachment(at);
//                    
//                 } else { // false : insert 진행
//                    result = dao.insertAttachment(at);
//                 }
//                 
//                 // insert 또는 update 실패시 rollback 수행
//                 // -> 예외를 발생시켜서 @Transactional을 이용해 수행
//                 if (result <= 0) {
//                    throw new BoardUpdateAttachmentFailException("파일 정보 수정 실패");
//                 }
//                 
//              } else { // 업로드된 이미지가 없을 경우
//                  
//                 // deleteImages 배열 : 화면에서 X버튼을 클릭해서 삭제한 배열 인덱스를 표시하는 역할
//                 // -> 배열 요소 중 true가 되어 있는 부분은
//                 // 해당 인덱스 (== 파일레벨)에 있던 이미지가 삭제되었다는 의미
//                 // --> DB에서 해당 파일 정보를 삭제
//                 
//                 if(deleteImages[i]) { 
//                    
//                    // x 버튼으로 삭제가 되었다고 deleteImages에 true로 저장되어있지만
//                    // 혹시라도 이미지가 없는데 x버튼을 누른걸 수도 있으니 진짜로 이전 이미지가 있었는지 검사
//                    for(BoardAttachment old : oldFiles) {
//                       if(old.getFileLevel() == i) {
//                          
//                          result = dao.deleteAttachment(old.getFileNo());
//                          
//                          if(result > 0) { // 삭제 성공 시
//                             // removeFileList : 서버에서 삭제할 파일 정보를 모아둔 리스트
//                             removeFileList.add(old); // 서버 파일 삭제 리스트에 추가
//                             
//                          } else { // 삭제 실패 시
//                             throw new BoardUpdateAttachmentFailException("파일 정보 삭제 실패");
//                          }
//                       }
//                    }
//                 }
//                 
//                 
//              }
//
//           } // images 반복 접근 for문 종료
//           
//           // uploadImages == 업로드된 파일 정보 --> 서버에 파일 저장
//           // removeFileList == 제거해야될 파일 정보 --> 서버에서 파일 삭제
//           
//           // 수정되거나 새롭게 삽입된 이미지를 서버에 저장하기 위해 transferTo() 수행
//           if(result > 0) {
//              for(int i=0 ; i<uploadImages.size(); i++) {
//                 
//                 try {
//                    images.get(uploadImages.get(i).getFileLevel())
//                       .transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()) );                                             
//                 }catch (Exception e) {
//                    e.printStackTrace();
//                    throw new BoardUpdateAttachmentFailException("파일 정보 수정 실패");
//                 }
//              }
//           }
//
//           // ------------------------------------------
//           // 이전 파일 서버에서 삭제하는 코드
//           for (BoardAttachment removeFile : removeFileList) {
//              File tmp = new File(savePath + "/" + removeFile.getFileName());
//              tmp.delete();
//           }
//           // ------------------------------------------
//
//        }
//        return result;
//     }        
   		
   		

   	// 게시글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(Board board) {
		return dao.deleteBoard(board);
	}





   

}