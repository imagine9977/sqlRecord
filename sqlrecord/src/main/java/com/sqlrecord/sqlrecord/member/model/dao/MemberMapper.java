package com.sqlrecord.sqlrecord.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
}
