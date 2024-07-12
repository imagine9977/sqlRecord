package com.sqlrecord.sqlrecord.member.model.service;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

public interface MemberService {

	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
	int insGenre(MemberGenre memberGenre);
	Member infoId(Member member);
	int pwChange(Member member);

}
