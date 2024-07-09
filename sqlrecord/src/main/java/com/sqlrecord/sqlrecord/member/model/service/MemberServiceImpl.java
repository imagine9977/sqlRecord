package com.sqlrecord.sqlrecord.member.model.service;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.member.model.dao.MemberMapper;
import com.sqlrecord.sqlrecord.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberMapper memberMapper;
	
	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public Member getMember(String memberId) {
		return memberMapper.getMember(memberId);
	}

	@Override
	public int insMember(Member member) {
		return memberMapper.insMember(member);
	}

}
