package com.sqlrecord.sqlrecord.notice.model.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.notice.model.dao.NoticeMapper;
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
		// TODO Auto-generated method stub
		return  noticeMapper.save(notice);	
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

}
