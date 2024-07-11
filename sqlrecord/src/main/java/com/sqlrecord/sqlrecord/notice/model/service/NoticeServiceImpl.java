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
		Notice notice =  noticeMapper.findById(noticeNo);	
		if(notice != null ) {
			List<NFile> nfiles = noticeMapper.findFiles(noticeNo);
			if(nfiles!=null) notice.setFiles(nfiles);
		}
		
		return notice;
	}

	@Override
	public int save(Notice notice) {
	    int result = noticeMapper.save(notice); // Execute INSERT INTO NOTICE
	    System.out.println("sql 저장");

	    if (result > 0) {
	        // Retrieve the generated noticeNo
	        Integer noticeNo = noticeMapper.getNoticeNo();
	        notice.setNoticeNo(noticeNo); // Set noticeNo in the Notice object
	        System.out.println("번호 저장"+noticeNo);

	        // Save files associated with the notice
	        if (notice.getFiles() != null) {
	            for (NFile file : notice.getFiles()) {
	                file.setNoticeNo(notice.getNoticeNo()); // Set noticeNo in each file object
	                result = noticeMapper.saveFile(file); // Execute INSERT INTO NFILE
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
	public int update(Notice notice) {
		int result = noticeMapper.update(notice);
		if (result > 0) {
	        
			List<NFile> newFiles = notice.getFiles();
			List<NFile> oldFiles = noticeMapper.findFiles(notice.getNoticeNo());
	        // Save files associated with the notice
	        if (newFiles!= null) {
	        	
	        	for (NFile file :newFiles) {
	                file.setNoticeNo(notice.getNoticeNo()); // Set noticeNo in each file object
	                if (file.getNfileNo() >0) {
	                    // Existing file, perform update
	                    result = noticeMapper.updateFile(file);
	                } else {
	                    // New file, perform insert
	                    result = noticeMapper.saveFile(file);
	                }
	                if (result <= 0) {
	                    // Handle failure to update or insert file
	                    return result;
	                }
	            }
	        }
	        if (newFiles.size() < oldFiles.size()) {
	            // Handle case where there were previously 3 files but now less than 3
	            // In this case, ensure that any existing file beyond the current size is deleted
	            
	        }
	    }
		return result;
	}

	@Override
	public int delete(int NoticeNo) {
		// TODO Auto-generated method stub
		int x =noticeMapper.deleteFiles(NoticeNo);
		return noticeMapper.delete(NoticeNo);	
	}

	

	@Override
	public int saveAll(Notice notice) {
		// TODO Auto-generated method stub
		return 0;  
	}

	@Override
	public List<NFile> findFiles(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeMapper.findFiles(noticeNo);
	}

}
