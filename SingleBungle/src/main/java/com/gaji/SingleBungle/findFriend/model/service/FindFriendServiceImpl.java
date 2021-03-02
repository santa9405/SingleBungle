package com.gaji.SingleBungle.findFriend.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.findFriend.exception.InsertAttachmentFailException;
import com.gaji.SingleBungle.findFriend.model.dao.FindFriendDAO;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendAttachment;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendPageInfo;

@Service
public class FindFriendServiceImpl implements FindFriendService {

	@Autowired
	private FindFriendDAO dao;
	
	// 게시글 목록 페이징처리 Service 구현
	@Override
	public FindFriendPageInfo getPageInfo(int cp) {
		
		// 전체 게시글 수 조회
		int listCount = dao.getListCount();
		
		return new FindFriendPageInfo(cp, listCount);
	}
	
	// 게시글 목록 조회 Service 구현
	@Override
	public List<FindFriend> selectList(FindFriendPageInfo pInfo) {
		return dao.selectList(pInfo);
	}
	
	// 게시글 검색 목록 페이징처리 Service 구현
	@Override
	public FindFriendPageInfo getSearchPageInfo(Map<String, Object> map) {
		
		// 검색 게시글 수 조회
		int listCount = dao.getSearchListCount(map);
		
		return new FindFriendPageInfo((int)map.get("cp"), listCount);
	}

	// 게시글 검색 목록 조회 Service 구현
	@Override
	public List<FindFriend> selectSearchList(Map<String, Object> map, FindFriendPageInfo pInfo) {
		return dao.selectSearchList(map, pInfo);
	}
	
	// 친구찾기 게시글 상세 조회 Service 구현
	@Override
	public FindFriend selectBoard(int friendNo) {
		
		// 1) 게시글 상세 조회
		FindFriend findFriend = dao.selectBoard(friendNo);
		
		// 2) 상세 조회 성공 시 조회수 증가
		if( findFriend != null ) {
			int result = dao.increaseReadCount(friendNo);
			
			if(result > 0) {
				findFriend.setReadCount(findFriend.getReadCount() + 1);
			}
		}
		
		return findFriend;
	}
	
	// 게시글에 포함된 이미지 목록 조회 Service 구현
	@Override
	public List<FindFriendAttachment> selectAttachmentList(int friendNo) {
		return dao.selectAttachmentList(friendNo);
	}


	// summernote 업로드 이미지 저장 Service 구현
	@Override
	public FindFriendAttachment inserImage(MultipartFile uploadFile, String savePath) {

		// 파일명 변경
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/findFriendImages/";

		// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
		FindFriendAttachment at = new FindFriendAttachment();
		at.setFileName(fileName);
		at.setFilePath(filePath);

		// 서버에 파일 저장(transferTo())
		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName));
		} catch (Exception e) {
			e.printStackTrace();

			throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
		}

		return at;
	}

	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000);

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;

	}

	// 친구찾기 게시글 등록(+ 파일 업로드) Service 구현
	@Override
	public int insertBoard(FindFriend findFriend, String savePath) {
		// 최종 결과 저장 변수 선언
		int result = 0;

		// 1) 다음 게시글 번호 얻어오기
		int nextBoardNo = dao.selectNextBoardNo();

		// 2) 게시글 삽입
		if (nextBoardNo > 0) { // 다음 게시글 번호를 얻어온 경우
			findFriend.setFriendNo(nextBoardNo); // 다음 게시글 번호 세팅

			// 게시글 삽입
			result = dao.insertBoard(findFriend);

			// 3) 게시글 삽입 성공 시 이미지 정보 삽입
			if (result > 0) {

				// 이미지 정보를 Attachment객체에 저장 후 List에 추가
				List<FindFriendAttachment> uploadImages = new ArrayList<FindFriendAttachment>();

				// DB에 저장할 웹상 접근 주소(filePath)
				String filePath = "/resources/findFriendImages";

				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img태그 src추출 정규표현식

				// summernote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher(findFriend.getFriendContent());

				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수

				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매핑된 src 속성 값)에 반복 접근하여 값이 잇을 경우
				// true
				while (matcher.find()) {
					src = matcher.group(1); // 매칭된 src 속성값을 Matcher 객체에서 꺼내서 src에 저장

					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로 별도 저장.

					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.

					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					FindFriendAttachment at = new FindFriendAttachment(filePath, fileName, nextBoardNo);
					uploadImages.add(at);

				}

				if (!uploadImages.isEmpty()) { // 업로드 된 이미지가 있을 경우
					
					// 파일 정보 삽입
					result = dao.insertAttachmentList(uploadImages); // result == 삽입된 행의 개수
					
					if(result == uploadImages.size()) {
						result = nextBoardNo; // result에 nextBoardNo 저장
						
					}else { // 파일 정보를 DB에 삽입하는데 실패했을 때
						throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
						
					}
					
				}else { // 업로드된 이미지가 없을 경우
					result = nextBoardNo;
				}
			}
		}

		return result;
	}

	// 친구찾기 게시글 수정 Service 수정
	@Override
	public int updateBoard(FindFriend updateBoard) {
		
		// 게시글 수정
		//int result = dao.updateBoard(updateBoard);
		
		// summernote로 작성된 게시글에 있는 이미지 정보 수정
		//	-> 게시글 내부 <img> 태그의 src 속성을 얻어와 파일명을 얻어옴.
		//	-> 수정 전 게시글 이미지와 수정 후 게시글 이미지 파일명을 비교
		//	--> 새롭게 추가된 이미지, 기존 이미지에서 삭제된 것도 존재
		//	--> Attachment 테이블에 반영
		
		// DB에 저장할 웹상 이미지 접근 경로
		String filePath = "/resources/findFriendImages";
		
		
			
		
		return 0;
	}

}
