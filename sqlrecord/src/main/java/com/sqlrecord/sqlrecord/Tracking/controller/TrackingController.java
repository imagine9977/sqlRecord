package com.sqlrecord.sqlrecord.Tracking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tracking")
public class TrackingController {
	
	
	
	@GetMapping("")
	public String getTrackingPage() {
		
		
		return "tracking/tracking";
	}
	
	@GetMapping("/{tracking_no}")
	public String getTrackingOnePage(@PathVariable int tracking_no) {
		
		
		return "tracking/detail";
	}
	
	
	
}
