package com.sqlrecord.sqlrecord.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

public interface MemberService {

	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
	int insGenre(MemberGenre memberGenre);
	Member infoId(Member member);
	int pwChange(Member member);
	List<Integer> genre(MemberGenre memberGenre);
	int update(Member member);
	int deleteGenre(int memberNo);
	void insUpdateGenre(MemberGenre memberGenre);
	int delete(Member member);
	
  
	// 관리자페이지
	//회원1명 상세조회
	Member getOneMember(String memberNo);
	//회원(Y)조회
	List<Member> findAllMembers(Map<String, Integer> map);			
	//회원(N)조회
	List<Member> findWithdrawnMembers(Map<String, Integer> map);	
	//전체 회원 수
	int memberCount();
	//회원 상태 업데이트
	void updateMemberStatus(int memberNo, String status);	
	// 검색 결과 수
	int searchMemberCount(Map<String, String> map);
	// 검색(조건+키워드)
	List<Member> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds);
}