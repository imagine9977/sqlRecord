package com.sqlrecord.sqlrecord.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sqlrecord.sqlrecord.notice.model.vo.NFile;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;



public interface NoticeService {
	List<Notice> findAll();
	Notice findById(int noticeNo);
	
	int save(Notice notice);
	int saveAll(Notice notice);
	NFile findFileById(int nfileId);
	int delete(int NoticeNo);
	List<Notice> findByCate(String cate);
	List<NFile> findFiles(int id);
	int update(Notice notice);
	int deleteFile(int nfileNo);

  // 관리자페이지 페이징용 Count
	int noticeCount();
	List<Notice> noticeFindAll(Map<String, Integer> map);	// 페이징 적용 전체 조회
}
