package com.sqlrecord.sqlrecord.tracking.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

@Mapper
public interface TrackingMapper {

	List<TrackingInfo> getTrackingInfoList(int trackingInfoNum);

	int insertTrackingInfo(TrackingInfo trackingInfo);
	
}
