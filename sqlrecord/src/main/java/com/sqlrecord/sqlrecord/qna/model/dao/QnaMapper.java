package com.sqlrecord.sqlrecord.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sqlrecord.sqlrecord.qna.model.vo.Comment;
import com.sqlrecord.sqlrecord.qna.model.vo.Qna;
import com.sqlrecord.sqlrecord.qna.model.vo.QnaFile;

@Mapper
public interface QnaMapper {
	int qnaCount();


	List<Qna> findByCate(@Param("startValue") int startValue, 
			@Param("endValue") int endValue, @Param("cate") String cate
			);
	List<Qna> findByCateUnsolved(@Param("startValue") int startValue, 
			@Param("endValue") int endValue, @Param("cate") String cate
			);

	List<Qna> findAll(@Param("startValue") int startValue, @Param("endValue") int endValue
		);
	
	List<Qna> findAllUnsolved(@Param("startValue") int startValue, @Param("endValue") int endValue
		);
	
	public Qna findById(int qnaNo);


	int qnaCountCate(String cate);


	List<Comment> findComments(int qnaNo);


	List<QnaFile> findFiles(int qnaNo);


	int insert(Qna qna);


	int saveFile(QnaFile file);
	
	int insertComment(Comment newComment);
	
	int delete(int qnaNo);
	
	int deleteFiles(int qnaNo);
	
	int deleteComments(int qnaNo);

	Integer getQnaNo();


	int update(Qna qna);


	int updateComment(Comment comm);


	int deleteSingleComment(int commentNo);


	int deleteFileByPosition(int delfile);
}
