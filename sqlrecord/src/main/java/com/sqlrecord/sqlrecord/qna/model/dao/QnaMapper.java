package com.sqlrecord.sqlrecord.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sqlrecord.sqlrecord.qna.model.vo.Qna;

@Mapper
public interface QnaMapper {
	int qnaCount();


	List<Qna> findByCate(@Param("startValue") int startValue, @Param("endValue") int endValue, @Param("cate") String cate);

	List<Qna> findAll(@Param("startValue") int startValue, @Param("endValue") int endValue);

}
