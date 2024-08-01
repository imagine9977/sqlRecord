package com.sqlrecord.sqlrecord.tracking.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

public interface TrackingService {

	List<TrackingInfo> getTrackingInfoList(String trackingNum);

	int insertTrackingInfo(TrackingInfo trackingInfo);

	
}
