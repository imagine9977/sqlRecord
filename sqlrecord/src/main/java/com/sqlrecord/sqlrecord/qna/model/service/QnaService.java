package com.sqlrecord.sqlrecord.qna.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.qna.model.vo.Qna;
import com.sqlrecord.sqlrecord.qna.model.vo.QnaFile;
import com.sqlrecord.sqlrecord.qna.model.vo.Comment;


public interface QnaService {
	
	public int qnaCount( String bool);

	public List<Qna> findAll(Map<String, Integer> map, String bool);

	public List<Qna> findByCate(Map<String, Integer> map, String cate, String bool);

	public Qna findById(int qnaNo);

	public int qnaCountCate(String cate, String bool);

	public List<QnaFile> findFiles(int id);
	public List<Comment> findComments(int id);

	public int insert(Qna qna);
	
	public int insertComment(Comment newComment);
	
	public int delete(int qnaNo);

	public int update(Qna qna);

	public int updateComment(Comment newComment);

	public int deleteFile(int delfile);

	public QnaFile findFileById(int delfile);

	public int deleteComment(int commentNo);
	
	//public int deleteFiles(int qnaNo);
	
	//public int deleteComments(int qnaNo);
}
