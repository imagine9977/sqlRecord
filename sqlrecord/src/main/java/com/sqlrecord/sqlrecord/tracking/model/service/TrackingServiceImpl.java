package com.sqlrecord.sqlrecord.tracking.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.tracking.model.dao.TrackingMapper;
import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackingServiceImpl implements TrackingService{

	private final TrackingMapper trackingMapper;
	
	@Override
	public List<TrackingInfo> getTrackingInfoList(int trackingInfoNum) {
		return trackingMapper.getTrackingInfoList(trackingInfoNum);
	}
	
	
}
