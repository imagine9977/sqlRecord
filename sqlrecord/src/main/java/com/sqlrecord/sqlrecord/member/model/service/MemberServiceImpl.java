package com.sqlrecord.sqlrecord.member.model.service;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.member.model.dao.MemberMapper;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

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
	
	@Override
	public int insGenre(MemberGenre memberGenre) {
		return memberMapper.insGenre(memberGenre);
	}

	@Override
	public Member infoId(Member member) {
		return memberMapper.infoId(member);
	}

	@Override
	public int pwChange(Member member) {
		return memberMapper.pwChange(member);
	}

	@Override
	public List<Integer> genre(MemberGenre memberGenre) {
		return memberMapper.genre(memberGenre);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(member);
	}

	@Override
	public int deleteGenre(int memberNo) {
		return memberMapper.deleteGenre(memberNo);
	}

	@Override
	public void insUpdateGenre(MemberGenre memberGenre) {
		memberMapper.insUpdateGenre(memberGenre);
	}

	@Override
	public int delete(Member member) {
		return memberMapper.delete(member);

  
  // 관리자 페이지
	@Override
	public Member getOneMember(String memberNo) {
		return memberMapper.getOneMember();
	}

	@Override
	public List<Member> findAllMembers(Map<String, Integer> map) {
		return memberMapper.findAllMembers(map);
	}
	
	@Override
	public List<Member> findWithdrawnMembers(Map<String, Integer> map) {
		return memberMapper.findWithdrawnMembers(map);
	}

	@Override
	public int memberCount() {
		return memberMapper.memberCount();

}
