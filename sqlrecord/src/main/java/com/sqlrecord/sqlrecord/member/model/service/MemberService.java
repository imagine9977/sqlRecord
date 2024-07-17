package com.sqlrecord.sqlrecord.member.model.service;

import java.util.List;

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

}
