package com.sqlrecord.sqlrecord.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.sqlrecord.sqlrecord.qna.model.service.QnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class QnaForwardController {
	private final QnaService qnaService;
	
	@GetMapping("qnas")
	public String getQna() {
		
		return "qna/list";
	}
	
	@GetMapping("qnas/insert.do")
	public String insertQna() {
		
		return "qna/insertForm";
	}
	
	@GetMapping("qnas/update.do/{id}")
	public ModelAndView updateForm(@PathVariable int id, ModelAndView mv) {
		mv.addObject("notice", qnaService.findById(id)).setViewName("qna/updateForm");

		return mv;
	}
}
