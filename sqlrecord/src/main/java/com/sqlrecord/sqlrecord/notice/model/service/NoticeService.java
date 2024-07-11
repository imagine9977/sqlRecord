package com.sqlrecord.sqlrecord.notice.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.notice.model.vo.NFile;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;



public interface NoticeService {
	List<Notice> findAll();
	Notice findById(int noticeNo);
	
	int save(Notice notice);
	int saveAll(Notice notice);
	int update(Notice notice);
	int delete(int NoticeNo);
	List<Notice> findByCate(String cate);
	List<NFile> findFiles(int id);
	
}
