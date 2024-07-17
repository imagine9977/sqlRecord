package com.sqlrecord.sqlrecord.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@RequiredArgsConstructor
@Slf4j
@Controller
public class NoticeForwardController {
	private final NoticeService noticeService;
	@GetMapping("notices")
	public String getNotice() {

		return "notice/notice";
	}

	@GetMapping("notices/insert.do")
	public String insertNotice() {

		return "notice/insertForm";
	}

	@GetMapping("notices/update.do/{id}")
public ModelAndView updateForm(@PathVariable int id, ModelAndView mv) {
		mv.addObject("notice", noticeService.findById(id)).setViewName("notice/updateForm");

		return mv;
	}

}
