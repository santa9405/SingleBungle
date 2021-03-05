package com.gaji.SingleBungle.member.model.service;

import com.gaji.SingleBungle.member.model.vo.Member;

public interface MemberService {

	/** 로그인 Service
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member loginAction(Member inputMember);

	/** 아이디 중복 검사 Service
	 * @param memberNickname
	 * @return result
	 */
	public abstract int idDupCheck(String memberNickname);
	
	/** 닉네임 중복 검사 Service 
	 * @param memberId
	 * @return result
	 */
	public abstract int nnDupCheck(String memberId);

	/** 회원가입 Service 
	 * @param signUpMember
	 * @return result
	 */
	public abstract int signUp(Member signUpMember);

}
