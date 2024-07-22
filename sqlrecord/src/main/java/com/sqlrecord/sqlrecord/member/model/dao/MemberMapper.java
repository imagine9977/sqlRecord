package com.sqlrecord.sqlrecord.member.model.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

@Mapper
public interface MemberMapper {
	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
	int insGenre(MemberGenre memberGenre);
	/*
	 * Member infoId(String name, String email);
	 * 매개변수 파라미터값 2개를 이런식으로 보내니까 인식을 못함.. 이유를 모르겠음
	 * Member infoId(@Param("name") String name, @Param("email") String email);
	 * 이렇게 파라미터값 명시적으로 지정을 해주니 인식을 하는데 흠 이렇게 할 필요가 없을듯함..
	 * 그냥 Member infoId(Member member); 멤버 객체로 이름 이메일만 조회를 해와서 이용하는게 편하네
	 */
	Member infoId(Member member);
	int pwChange(Member member);
	List<Integer> genre(MemberGenre memberGenre);
	int update(Member member);
	int deleteGenre(int memberNo);
	void insUpdateGenre(MemberGenre memberGenre);
	int delete(Member member);
	
	
	
	// 관리자 페이지 메서드
	Member getOneMember();			// 회원 1인 조회
	List<Member> findAllMembers(Map<String, Integer> map);			//활동 회원 조회
	List<Member> findWithdrawnMembers(Map<String, Integer> map);	//탈퇴 회원 조회
	int memberCount();
	void updateMemberStatus(int memberNo, String status);	// 회원 상태 업데이트
	int searchMemberCount(SqlSessionTemplate sqlSession, Map<String, String> map);	// 검색 수
	List<Member> findByConditionAndKeyword(SqlSessionTemplate sqlSession, Map<String, String> map, RowBounds rowBounds);	//검색 결과
	
}