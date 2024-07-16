package com.sqlrecord.sqlrecord.tracking.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
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
	private final OrdersService ordersService;
	
	
	@GetMapping(value = "/divide" , produces = "application/json; charset=UTF-8")
	public List<MemberOrdersDetail> getDivideTracking(String param) {
		
		List<MemberOrdersDetail> modList = ordersService.getOrdersDetailAll();
		
		
		List<MemberOrdersDetail> newList = (List<MemberOrdersDetail>) modList.stream()
																			 .filter((item) -> param.equals(item.getMemberOrdersDetailStatus()))
																			 .collect(Collectors.toList());
		
		log.info("왔냐 : {}" , param);
		
		
		return  newList;
	}
	
	
	
	
	
	
	
	
	
	
	
}
