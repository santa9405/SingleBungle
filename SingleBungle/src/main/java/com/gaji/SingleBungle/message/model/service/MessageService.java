package com.gaji.SingleBungle.message.model.service;

import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;

public interface MessageService {

	/** 전체 쪽지 수 조회 
	 * @param cp
	 * @param memberNo
	 * @return
	 */
	MessagePageInfo getPageInfo(int cp, int memberNo);

}
