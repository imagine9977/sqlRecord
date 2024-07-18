package com.sqlrecord.sqlrecord.qna.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.qna.model.vo.Qna;
import com.sqlrecord.sqlrecord.qna.model.vo.QnaFile;
import com.sqlrecord.sqlrecord.qna.model.vo.Comment;


public interface QnaService {
	
	public int qnaCount();

	public List<Qna> findAll(Map<String, Integer> map, String bool);

	public List<Qna> findByCate(Map<String, Integer> map, String cate, String bool);

	public Qna findById(int qnaNo);

	public int qnaCountCate(String cate);

	public List<QnaFile> findFiles(int id);
	public List<Comment> findComments(int id);

	public int insert(Qna qna);
	
	public int insertComment(int qnaNo);
	
	public int delete(int qnaNo);

	public int update(Qna qna);

	public int updateComment(Comment comm);
	
	//public int deleteFiles(int qnaNo);
	
	//public int deleteComments(int qnaNo);
}
