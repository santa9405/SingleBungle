package com.gaji.SingleBungle.member.model.service;

import java.util.Map;

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

	/** 이름, 메일 일치 검사 Service
	 * @param map
	 * @return result
	 */
	public abstract int nameMailCheck(Map<String, Object> map);

	/** 내 정보 수정 Service
	 * @param updateMember
	 * @return result
	 */
	public abstract int mypageInfoUpdateAction(Member updateMember);

	/** 비밀번호 수정 Service 
	 * @param map
	 * @return result
	 */
	public abstract int mypagePwUpdate(Map<String, Object> map);

	/** 회원탈퇴 Service 
	 * @param loginMember
	 * @return result
	 */
	public abstract int mypageSecession(Member loginMember);

}
