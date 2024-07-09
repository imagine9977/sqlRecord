package com.sqlrecord.sqlrecord.notice.model.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.notice.model.dao.NoticeMapper;
import com.sqlrecord.sqlrecord.notice.model.vo.NFile;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private final NoticeMapper noticeMapper;
	@Override
	public List<Notice> findAll() {
		// TODO Auto-generated method stub
		return noticeMapper.findAll();
	}
	
	@Override
	public List<Notice> findByCate(String cate){
		return noticeMapper.findByCate(cate);
	}
	
	@Override
	public Notice findById(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeMapper.findById(noticeNo);	
	}

	@Override
	public int save(Notice notice) {
	    // Save the notice itself first
	    int result = noticeMapper.save(notice);
	    
	    // If the notice was successfully saved, save the files
	    if (result > 0 && notice.getFiles() != null) {
	        for (NFile file : notice.getFiles()) {
	            file.setNoticeNo(notice.getNoticeNo());
	            result = noticeMapper.saveFile(file);
	            if (result <= 0) {
	                // Handle the failure case
	                return result;
	            }
	        }
	    }
	    return result;
	}


	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.update(notice);
	}

	@Override
	public int delete(int NoticeNo) {
		// TODO Auto-generated method stub
		return noticeMapper.delete(NoticeNo);	
	}

	@Override
	public List<NFile> findFiles(int id) {
		// TODO Auto-generated method stub
		return noticeMapper.findFiles(id);
	}

}
