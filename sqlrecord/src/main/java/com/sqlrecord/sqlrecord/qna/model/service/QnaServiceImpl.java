package com.sqlrecord.sqlrecord.qna.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.member.model.dao.MemberMapper;
import com.sqlrecord.sqlrecord.qna.model.dao.QnaMapper;
import com.sqlrecord.sqlrecord.qna.model.vo.Comment;
import com.sqlrecord.sqlrecord.qna.model.vo.Qna;
import com.sqlrecord.sqlrecord.qna.model.vo.QnaFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{
	private final QnaMapper qnaMapper;
	private final MemberMapper memberMapper;
	@Override
	public int qnaCount() {
		// TODO Auto-generated method stub
		return qnaMapper.qnaCount();
	}

	@Override
	public List<Qna> findAll(Map<String, Integer> map, String bool){
		// TODO Auto-generated method stub
		int startValue= 	map.get("startValue");
		int endValue= 	map.get("endValue");
		log.info("조회된 start: {}", startValue);
		log.info("조회된 end: {}", endValue);
		log.info("조회된 bool: {}", bool);
		if(bool.equals("N")) {
			return qnaMapper.findAllUnsolved(startValue, endValue);
		}
		return qnaMapper.findAll(startValue, endValue);
	}

	@Override
	public List<Qna> findByCate(Map<String, Integer> map, String cate, String bool) {
		// TODO Auto-generated method stub
		int startValue= 	map.get("startValue");
		int endValue= 	map.get("endValue");
		if(bool.equals("N")) {
			return qnaMapper.findByCateUnsolved(startValue, endValue,cate);
		}
		return qnaMapper.findByCate(startValue, endValue,cate);
	}

	@Override
	public Qna findById(int qnaNo) {
		// TODO Auto-generated method stub
		Qna qna= qnaMapper.findById(qnaNo);
		if(qna != null ) {
			qna.setMemberId(memberMapper.memberIdFindByNo(qna.getMemberNo()));
			List<QnaFile> qnafiles = qnaMapper.findFiles(qnaNo);
			if(qnafiles!=null) qna.setFiles(qnafiles);
			List<Comment> qnaComments = qnaMapper.findComments(qnaNo);
			log.info(qnaComments.toString());
			if(qnaComments!=null) qna.setComments(qnaComments);
		}
		
		return qna;
	}


	@Override
	public int qnaCountCate(String cate) {
		// TODO Auto-generated method stub
		return qnaMapper.qnaCountCate(cate);
	}

	@Override
	public List<QnaFile> findFiles(int id) {
		// TODO Auto-generated method stub
		return qnaMapper.findFiles(id);
	}

	@Override
	public List<Comment> findComments(int id) {
		// TODO Auto-generated method stub
		return qnaMapper.findComments(id);
	}

	@Override
	public int insert(Qna qna) {
		// TODO Auto-generated method stub
		 System.out.println("sql 저장");
		 int result =  qnaMapper.insert( qna);
		

		    if (result > 0) {
		        // Retrieve the generated qnaNo
		        Integer qnaNo = qnaMapper.getQnaNo();
		        qna.setQnaNo(qnaNo); // Set qnaNo in the qna object
		        System.out.println("번호 저장"+qnaNo);

		        // Save files associated with the qna
		        if (qna.getFiles() != null) {
		            for (QnaFile file : qna.getFiles()) {
		                file.setQnaNo(qna.getQnaNo()); // Set qnaNo in each file object
		                result = qnaMapper.saveFile(file); // Execute INSERT INTO NFILE
		                if (result <= 0) {
		                    // Handle failure to save file
		                    return result;
		                }
		            }
		        }
		    }

		    return result;
		}
	@Override
	public int insertComment(Comment newComment) {
		log.info(newComment.toString());
		return qnaMapper.insertComment(newComment);
	}
	@Override
	public int delete(int qnaNo){
		int x =qnaMapper.deleteFiles(qnaNo);
		if(x>0) {
			int y =qnaMapper.deleteComments(qnaNo);
		}
		
		return qnaMapper.delete(qnaNo);	
	}
	
	@Override
	public int update(Qna qna) {
		int result = qnaMapper.update(qna);
		if (result > 0) {
			if (qna.getFiles() != null) {
	            for (QnaFile file : qna.getFiles()) {
	                file.setQnaNo(qna.getQnaNo()); // Set qnaNo in each file object
	                result = qnaMapper.saveFile(file); // Execute INSERT INTO NFILE
	                if (result <= 0) {
	                    // Handle failure to save file
	                    return result;
	                }
	            }
	        }
	    }
		return result;
	}
	
	@Override
	public int updateComment(Comment comm) {
		
		return qnaMapper.updateComment(comm);
		
	}

	@Override
	public int deleteFile(int delfile) {
		// TODO Auto-generated method stub
		return qnaMapper.deleteFileByPosition(delfile);
	}

	@Override
	public QnaFile findFileById(int delfile) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int deleteComment(int commentNo) {
		
		
		return qnaMapper.deleteSingleComment( commentNo);
	}
}
