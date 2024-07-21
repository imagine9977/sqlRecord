package com.sqlrecord.sqlrecord.member.model.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

public interface MemberService {

	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
	int insGenre(MemberGenre memberGenre);
	Member infoId(Member member);
	int pwChange(Member member);
	
	// 관리자페이지
	Member getOneMember(String memberNo);
	List<Member> findAllMembers(Map<String, Integer> map);			//회원(Y)조회
	List<Member> findWithdrawnMembers(Map<String, Integer> map);	//회원(N)조회
	int memberCount();

}
