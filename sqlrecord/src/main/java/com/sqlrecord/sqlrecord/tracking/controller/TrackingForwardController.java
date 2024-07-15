package com.sqlrecord.sqlrecord.tracking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tracking")
public class TrackingForwardController {

	
	
	@GetMapping("/")
	public String getTrackingPage() {
		
		
		return "tracking/tracking";
	}
}
