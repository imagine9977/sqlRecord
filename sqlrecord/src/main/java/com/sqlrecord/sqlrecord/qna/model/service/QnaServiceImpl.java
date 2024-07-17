package com.sqlrecord.sqlrecord.qna.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.qna.model.dao.QnaMapper;
import com.sqlrecord.sqlrecord.qna.model.vo.Qna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{
	private final QnaMapper qnaMapper;
	@Override
	public int qnaCount() {
		// TODO Auto-generated method stub
		return qnaMapper.qnaCount();
	}

	@Override
	public List<Qna> findAll(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int startValue= 	map.get("startValue");
		int endValue= 	map.get("endValue");
		log.info("조회된 start: {}", startValue);
		log.info("조회된 end: {}", endValue);
		return qnaMapper.findAll(startValue, endValue);
	}

	@Override
	public List<Qna> findByCate(Map<String, Integer> map, String cate) {
		// TODO Auto-generated method stub
		int startValue= 	map.get("startValue");
		int endValue= 	map.get("endValue");
		return qnaMapper.findByCate(startValue, endValue,cate);
	}

}
