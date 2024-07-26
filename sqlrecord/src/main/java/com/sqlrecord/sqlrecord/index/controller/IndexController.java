package com.sqlrecord.sqlrecord.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	
	@GetMapping("/")
	public String indexController(Model model) {
		
		
		log.info("haha");
		return "index";
	}
}
