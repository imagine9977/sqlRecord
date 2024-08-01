package com.sqlrecord.sqlrecord.tracking.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.tracking.model.service.TrackingService;
import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/tracking")
@RequiredArgsConstructor
@Slf4j
public class TrackingForwardController {

	private final TrackingService trackingService;
	private final OrdersService ordersService;
	
	
	@GetMapping("/")
	public String getTrackingPage(Model model) {
		
		
		
		List<MemberOrdersDetail> modList = ordersService.getOrdersDetailAll();
		
		log.info("modList : {}" , modList.size());
		
		
		List<MemberOrdersDetail> newMoList = modList.stream().filter((item) -> item.getTrackingNum() != null)
															 .collect(Collectors.toList());
		
		model.addAttribute("newMoList",newMoList);
		
		
		return "tracking/tracking";
	}
	
	
	@GetMapping("/{trackingNum}")
	public String getTrackingOnePage(@PathVariable String trackingNum ,  Model model) {
		
		List<TrackingInfo> trackingInfoList = trackingService.getTrackingInfoList(trackingNum);
		
		MemberOrdersDetail memberOrdersDetail = ordersService.getOrdersDetailOneForTracking(trackingNum);
		
		log.info("트인넘? : {}" , trackingNum);
		
		log.info("스랙킹 리스트? : {}" , trackingInfoList.size());
		model.addAttribute("trackingNum",trackingNum);
		model.addAttribute("status", memberOrdersDetail.getMemberOrdersDetailStatus());
		model.addAttribute("trackingList" , trackingInfoList);
		
		
		
		
		return "tracking/detail";
	}
}
