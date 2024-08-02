package com.sqlrecord.sqlrecord.member.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointMapper {

	Map<String, Object> point(int memberNo);


}
