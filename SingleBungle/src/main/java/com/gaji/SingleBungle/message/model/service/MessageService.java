package com.gaji.SingleBungle.message.model.service;

import java.util.List;
import java.util.Map;

import com.gaji.SingleBungle.message.model.vo.Message;
import com.gaji.SingleBungle.message.model.vo.MessagePageInfo;

public interface MessageService {

	/** 보낸 쪽지 수 조회 
	 * @param cp
	 * @param memberNo
	 * @return
	 */
	MessagePageInfo getSendPageInfo(int cp, int memberNo);

	/** 보낸 쪽지 목록 조회
	 * @param map
	 * @return
	 */
	List<Message> selectSendList(Map<String, Object> map);

	/** 받은 쪽지 수 조회
	 * @param cp
	 * @param memberNo
	 * @return
	 */
	MessagePageInfo getReceivePageInfo(int cp, int memberNo);

	/** 받은 쪽지 목록 조회
	 * @param map
	 * @return
	 */
	List<Message> selectReceiveList(Map<String, Object> map);

	
	/** 메세지 보내기
	 * @param map
	 * @return
	 */
	int sendMessage(Map<String, Object> map);

}
