package com.gaji.SingleBungle.member.model.service;

import com.gaji.SingleBungle.member.model.vo.Member;

public interface MemberService {

	/** 로그인 Service
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member loginAction(Member inputMember);

}
