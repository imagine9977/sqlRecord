package com.sqlrecord.sqlrecord.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminFor")
public class AdminForwardController {

	@GetMapping
	public String admin() {
		return "admin/admin";
	}
}
