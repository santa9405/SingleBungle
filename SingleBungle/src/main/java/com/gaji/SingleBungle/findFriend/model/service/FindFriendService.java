package com.gaji.SingleBungle.findFriend.model.service;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.findFriend.model.vo.Attachment;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendPageInfo;

public interface FindFriendService {
	
	/** 게시글 목록 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	FindFriendPageInfo getPageInfo(int cp);

	/** summernote 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @return at
	 */
	Attachment inserImage(MultipartFile uploadFile, String savePath);

	/** 친구찾기 게시글 등록 Service
	 * @param findFriend
	 * @param savePath
	 * @return int
	 */
	int insertBoard(FindFriend findFriend, String savePath);

	
	
	

}
