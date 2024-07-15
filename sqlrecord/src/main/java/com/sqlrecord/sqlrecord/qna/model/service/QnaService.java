package com.sqlrecord.sqlrecord.qna.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.qna.model.vo.Qna;



public interface QnaService {
	
	public int qnaCount();

	public List<Qna> findAll(Map<String, Integer> map);

	public List<Qna> findByCate(Map<String, Integer> map, String cate);

}
