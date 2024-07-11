package com.sqlrecord.sqlrecord.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaForwardController {
	@GetMapping("qnas")
	public String getQna() {
		
		return "qna/qna";
	}
	
	@GetMapping("qnas/insert.do")
	public String insertQna() {
		
		return "qna/insertForm";
	}
}
