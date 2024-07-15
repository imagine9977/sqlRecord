package com.sqlrecord.sqlrecord.qna.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.message.Message;
import com.sqlrecord.sqlrecord.qna.model.service.QnaService;
import com.sqlrecord.sqlrecord.qna.model.vo.Qna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/qna")
public class QnaController {
	private final QnaService qnaService;
	@GetMapping("/{cate}")
	public ResponseEntity<Message>  forwarding(@RequestParam(value = "page", defaultValue = "1") int page,@PathVariable String cate) {
		int listCount;
		int currentPage;
		int pageLimit;
		int qnaLimit;

		int maxPage;
		int startPage;
		int endPage; // 마지막 페이지

		pageLimit = 10;
		qnaLimit = 10;

		listCount = qnaService.qnaCount();
		log.info("조회된 게시글의 개수: {}", listCount);
		log.info("조회된 카테고리: {}", cate);
		maxPage = (int) Math.ceil((double) listCount / qnaLimit);

		currentPage = page;
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + maxPage - 1;

		if (endPage > maxPage)
			endPage = maxPage;
		PageInfo pageInfo = PageInfo.builder().maxPage(maxPage)
				.endPage(endPage).listCount(listCount).pageLimit(pageLimit).startPage(startPage).boardLimit(qnaLimit).currentPage(currentPage).build();

		Map<String, Integer> map = new HashMap<String, Integer>();
	

		int startValue = (currentPage - 1) * qnaLimit + 1;
		int endValue = startValue + qnaLimit - 1;
		map.put("startValue", startValue);
		map.put("endValue", endValue);
		log.info("조회된 start: {}", startValue);
		log.info("조회된 end: {}", endValue);
		List<Qna> qnaList = new ArrayList<>();
		if(cate.equals("all")) {
			log.info("조회된 전체: {}", cate);
			qnaList = qnaService.findAll(map);
		}else {
			log.info("조회된 카테고리 일부: {}", cate);
			qnaList = qnaService.findByCate(map,cate);
		}
		

		
		log.info("---------------");
		if (qnaList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Message.builder().message("조회결과가 없습니다.").build());
		}
		Message responseMsg = Message.builder().data(qnaList).message("조회 요청 성공").build();

		log.info("조회된 공지사항 목록 : {}", qnaList);

		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);

	}
	
}
