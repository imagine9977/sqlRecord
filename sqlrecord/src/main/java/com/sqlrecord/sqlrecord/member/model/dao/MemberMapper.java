package com.sqlrecord.sqlrecord.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

@Mapper
public interface MemberMapper {
	Member login(Member member);
	Member getMember(String memberId);
	int insMember(Member member);
	int insGenre(MemberGenre memberGenre);
	Member infoId(String name, String email);
}
