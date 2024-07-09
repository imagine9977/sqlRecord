package com.sqlrecord.sqlrecord.member.model.service;

import com.sqlrecord.sqlrecord.member.model.vo.Member;

public interface MemberService {

	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);

}
