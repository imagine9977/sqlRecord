package com.sqlrecord.sqlrecord.tracking.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sqlrecord.sqlrecord.tracking.model.service.TrackingService;
import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/trackingRest")
public class TrackingController {
	
	
	
	private final TrackingService trackingService;
	
	@GetMapping("/{tracking_no}")
	public String getTrackingOnePage(@PathVariable int trackingInfoNum) {
		
		
		List<TrackingInfo> trackingList =  trackingService.getTrackingInfoList(trackingInfoNum);
		
		
		
		return "tracking/detail";
	}
	
	
	
}
