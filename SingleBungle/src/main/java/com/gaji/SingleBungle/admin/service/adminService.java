package com.gaji.SingleBungle.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;

public interface adminService {

	APageInfo getPageInfo(int cp, int type);

	List<ABoard> selectList(APageInfo pInfo, int type);

	List<AAttachment> selectThumbnailList(List<ABoard> eventList);

	ABoard selectBoard(int boardNo, int type);

	List<AAttachment> selectAttachmentList(int boardNo);

	int insertNotice(Map<String, Object> map, List<MultipartFile> images, String savePath);

}
