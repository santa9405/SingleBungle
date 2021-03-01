package com.gaji.SingleBungle.cafe.model.service;

import java.text.SimpleDateFormat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.cafe.model.dao.CafeDAO;
import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.cafe.model.vo.CafeAttachment;
import com.gaji.SingleBungle.cafe.model.vo.CafePageInfo;

@Service
public class CafeServiceImpl implements CafeService {
	
	@Autowired
	private CafeDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public CafePageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new CafePageInfo(cp, listCount);
	}

	// 게시글 목록 조회 Service 구현
	@Override
	public List<Cafe> selectList(CafePageInfo cpInfo) {
		return dao.selectList(cpInfo);
	}

	// 썸네일 목록 조회 Service 구현
//	@Override
//	public List<CafeAttachment> selectThumbnailList(List<Cafe> cList) {
//		return dao.selectThumbnailList(cList);
//	}
	
	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Cafe selectCafe(int cafeNo) {
		
		Cafe temp = new Cafe();
		temp.setCafeNo(cafeNo);
		
		Cafe cafe = dao.selectCafe(temp);
		
		if(cafe != null) {
			int result = dao.increaseReadCount(cafeNo);
			
			if(result > 0) {
				cafe.setReadCount(cafe.getReadCount() + 1);
			}
		}
		
		return cafe;
	}

	// 게시글에 포함된 이미지 목록 조회 Service 구현
	@Override
	public List<CafeAttachment> selectAttachmentList(int cafeNo) {
		return dao.selectAttachmentList(cafeNo);
	}

	// 게시글 삽입 Service 구현
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertCafe(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		
		int result = 0;
		
		int cafeNo = dao.selectNextNo();
		
		if(cafeNo > 0) {
			map.put("cafeNo", cafeNo);
			
            String cafeTitle = (String)map.get("cafeTitle");
            String cafeContent = (String)map.get("cafeContent");
            
            // 크로스 사이트 스크립팅 방지 처리 적용
            cafeTitle = replaceParameter(cafeTitle);
            cafeContent = replaceParameter(cafeContent);
            
            // 처리된 문자열을 다시 map에 세팅
            map.put("cafeTitle", cafeTitle);
            map.put("cafeContent", cafeContent);
            
		}
		
		result = dao.insertBoard(map);
		
//      // 게시글 삽입 성공 시 이미지 정보 삽입
//      if(result > 0) {
//      	
//      	List<BoardAttachment> uploadImages = new ArrayList<BoardAttachment>();
//      	
//      	String filePath = null;
//      	
//      	filePath = "/resources/infoImages";
//
//      // ---------------------------------------------------- summernote
//      
//			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
//			
//			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
//			Matcher matcher = pattern.matcher((String)map.get("boardContent"));     
//			 
//			String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
//			String src = null; // src 속성값을 저장할 임시 참조 변수
//			
//			// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
//			while(matcher.find()){
//				src =  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
//				
//				filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
//				
//				fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.
//				
//				// Attachment 객체를 이용하여 DB에 파일 정보를 저장
//				BoardAttachment at = new BoardAttachment(filePath, fileName, 1, boardNo);
//				uploadImages.add(at);
//			}
//
//      // ----------------------------------------------------
//      if(!uploadImages.isEmpty()) { // 업로드된 이미지가 있을 경우
//         // 파일 정보 삽입 DAO 호출
//         result = dao.insertAttachmentList(uploadImages);
//         // result == 삽입된 행의 개수
//         
//         // 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
//         if(result == uploadImages.size()) {
//            result = boardNo; // result에 boardNo 저장
//            
//            int size = 0;
//            if( !images.get(0).getOriginalFilename().equals("") ) {
//          	  size = images.size();
//            }
//                              
//            for(int i=0; i<size; i++) {
//                  
//                  try {
//                     images.get(uploadImages.get(i).getFileLevel())
//                     .transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()));
//                     
//                  } catch (Exception e) {
//                     e.printStackTrace();
//                     
//                     throw new InsertAttachmentFailException("파일 서버 저장 실패");
//                     }
//               }
//            }
//            
//         } else {
//            throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
//         }
//      }else { // 업로드된 이미지가 없을 경우
//      	result = boardNo;
//      }
		
		result = cafeNo;
		
		return result;
	}
	
	
	   // 크로스 사이트 스크립트 방지 처리 메소드 ------------------------------------------------------------------------------------------------------
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
	      
	   // 파일명 변경 메소드 ---------------------------------------------------------------------------------------------------------------------
	   public String rename(String originFileName) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
	      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
	         
	      int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
	         
	      String str = "_" + String.format("%05d", ranNum);
	      //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
	      // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
	         
	      String ext = originFileName.substring(originFileName.lastIndexOf("."));
	         
	      return date + str + ext;
	      }

	// 게시글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteCafe(Cafe cafe) {
		return dao.deleteCafe(cafe);
	}

	// 게시글 검색 목록 페이징 Service 구현
	@Override
	public CafePageInfo getSearchPageInfo(Map<String, Object> map) {
		
		int listCount = dao.getSearchListCount(map);
		
		return new CafePageInfo((int)map.get("cp"), listCount);
	}

	// 게시글 검색 목록 조회 Service 구현
	@Override
	public List<Cafe> selectSearchList(Map<String, Object> map, CafePageInfo cpInfo) {
		return dao.selectSearchList(map, cpInfo);
	}

	// 조회수 상위 3 게시글 조회 Service 구현
	@Override
	public List<Cafe> cafeListTop3() {
		return dao.cafeListTop3();
	}	


}
