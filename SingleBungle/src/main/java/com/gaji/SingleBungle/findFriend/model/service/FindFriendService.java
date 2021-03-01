package com.gaji.SingleBungle.findFriend.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.findFriend.model.vo.FindFriendAttachment;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriend;
import com.gaji.SingleBungle.findFriend.model.vo.FindFriendPageInfo;

public interface FindFriendService {
	
	/** 게시글 목록 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	FindFriendPageInfo getPageInfo(int cp);
	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return fList
	 */
	List<FindFriend> selectList(FindFriendPageInfo pInfo);
	
	/** 게시글 검색 목록 페이징처리 Service
	 * @param map
	 * @return pInfo
	 */
	FindFriendPageInfo getSearchPageInfo(Map<String, Object> map);
	
	/** 게시글 검색 목록 조회 Service
	 * @param map 
	 * @param pInfo
	 * @return fList
	 */
	List<FindFriend> selectSearchList(Map<String, Object> map, FindFriendPageInfo pInfo);

	/** summernote 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @return at
	 */
	FindFriendAttachment inserImage(MultipartFile uploadFile, String savePath);

	/** 친구찾기 게시글 등록 Service
	 * @param findFriend
	 * @param savePath
	 * @return int
	 */
	int insertBoard(FindFriend findFriend, String savePath);

	

	

	

	
	
	

}
