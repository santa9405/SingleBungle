package com.gaji.SingleBungle.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaji.SingleBungle.member.model.vo.Member;


@Repository
public class MemberDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession; 
	
	
	/** 로그인 DAO 
	 * @param inputMember
	 * @return loginMember
	 */
	public Member loginAction(Member inputMember) {
		return sqlSession.selectOne("memberMapper.loginAction", inputMember);
	}


	/** 아이디 중복 체크 DAO 
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
	}
	
	
	/** 닉네임 중복 체크 DAO 
	 * @param memberNickname
	 * @return result
	 */
	public int nnDupCheck(String memberNickname) {
		return sqlSession.selectOne("memberMapper.nnDupCheck", memberNickname);
	}
	
	
	/** 회원가입 DAO 
	 * @param signUpMember
	 * @return result 
	 */
	public int signUp(Member signUpMember) {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}


	/** 이름, 메일 일치 검사 DAO 
	 * @param map
	 * @return result 
	 */
	public int nameMailCheck(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.nameMailCheck", map);
	}


	/** 내 정보 수정 DAO 
	 * @param updateMember
	 * @return result 
	 */
	public int mypageInfoUpdateAction(Member updateMember) {
		return sqlSession.update("memberMapper.mypageInfoUpdateAction", updateMember);
	}


	/** 비밀번호 조회 DAO 
	 * @param memberNo
	 * @return savePwd
	 */
	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPwd", memberNo);
	}


	/** 비밀번호 수정 DAO
	 * @param map
	 * @return result 
	 */
	public int mypagePwUpdate(Map<String, Object> map) {
		return sqlSession.update("memberMapper.mypagePwUpdate", map);
	}
	
	


}
