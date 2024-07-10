package com.sqlrecord.sqlrecord.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeForwardController {
	@GetMapping("notices")
	public String getNotice() {
		
		return "notice/notice";
	}
	
	@GetMapping("notices/insert.do")
	public String insertNotice() {
		
		return "notice/insertForm";
	}
}
