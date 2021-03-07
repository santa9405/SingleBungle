package com.gaji.SingleBungle.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;
import com.gaji.SingleBungle.admin.vo.IAttachment;
import com.gaji.SingleBungle.admin.vo.Reply;
import com.gaji.SingleBungle.admin.vo.inquiry;


public interface adminService {

	APageInfo getPageInfo(int cp, int type);

	List<ABoard> selectList(APageInfo pInfo, int type);

	List<AAttachment> selectThumbnailList(List<ABoard> eventList);

	ABoard selectBoard(int boardNo, int type);

	List<AAttachment> selectAttachmentList(int boardNo);

	int insertNotice(Map<String, Object> map, List<MultipartFile> images, String savePath);

	AAttachment insertImage(MultipartFile uploadFile, String savePath);

	int insertEvent(Map<String, Object> map, List<MultipartFile> images, String savePath);

	int deleteBoard(int boardNo);

	List<ABoard> selectFaqList(int type);

	int insertFaqAction(Map<String, Object> map);

	List<inquiry> inquiryList(APageInfo pInfo, int memberNo);

	int insertinquiryAction(Map<String, Object> map, List<MultipartFile> images, String savePath);

	inquiry selectInquiryBoard(int inquiryNo);

	List<IAttachment> selectIAttachmentList(int inquiryNo);

	APageInfo getInquiryPageInfo(int cp);

	int deleteInquiry(int inquiryNo);

	int updateBoard(ABoard updateBoard, String savePath);

	APageInfo getAllPageInfo(int cp);

	List<ABoard> selectAllList(APageInfo pInfo);

	int recoverBoard(int boardNo, int boardCode);

	List<Reply> selectAllReply();

	

	

}
