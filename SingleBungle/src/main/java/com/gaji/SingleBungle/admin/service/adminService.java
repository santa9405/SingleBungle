package com.gaji.SingleBungle.admin.service;

import java.util.List;

import com.gaji.SingleBungle.admin.vo.AAttachment;
import com.gaji.SingleBungle.admin.vo.ABoard;
import com.gaji.SingleBungle.admin.vo.APageInfo;

public interface adminService {

	APageInfo getPageInfo(int cp, int type);

	List<ABoard> selectList(APageInfo pInfo, int type);

	List<AAttachment> selectThumbnailList(List<ABoard> eventList);

}
