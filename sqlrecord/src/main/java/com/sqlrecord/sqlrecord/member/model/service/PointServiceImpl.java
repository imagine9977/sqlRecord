package com.sqlrecord.sqlrecord.member.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.member.model.dao.PointMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {

	private final PointMapper pointMapper;

	@Override
	public Map<String, Object> point(int memberNo) {
		return pointMapper.point(memberNo);
	}


}
