package com.sqlrecord.sqlrecord.tracking.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		Map<String, Integer> trackingMap = new HashMap(); 
		trackingMap.put("aaa", 1231);
		trackingMap.put("배송중", 1231241);
		modList.stream().forEach((item) -> {
			if(item.getTrackingNum() != 0) {
				if(item.getMemberOrdersDetailStatus().equals("배송요청")) trackingMap.put("배송요청",item.getTrackingNum());
				if(item.getMemberOrdersDetailStatus().equals("배송중")) trackingMap.put("배송중",item.getTrackingNum());
				if(item.getMemberOrdersDetailStatus().equals("배송완료")) trackingMap.put("배송완료",item.getTrackingNum());
			}
		});
		
		model.addAttribute("trackingMap",trackingMap);
		
		
		return "tracking/tracking";
	}
	
	
	@GetMapping("/{trackingInfoNum}")
	public String getTrackingOnePage(@PathVariable int trackingInfoNum) {
		
		log.info("트인넘? : {}" , trackingInfoNum);
		List<TrackingInfo> trackingList =  trackingService.getTrackingInfoList(trackingInfoNum);
		
		
		
		return "tracking/detail";
	}
}
