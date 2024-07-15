package com.sqlrecord.sqlrecord.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sqlrecord.sqlrecord.common.model.vo.PageInfo;
import com.sqlrecord.sqlrecord.common.template.PageTemplate;
import com.sqlrecord.sqlrecord.product.model.service.ProductService;
import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.product.model.vo.ProductPhotos;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
@Slf4j
public class ProductController {
	/*
	private final ProductService productService;
	
	// 전체 상품 조회 (list.jsp)
	@GetMapping("/list")
	private String getAllProductsByCate(@RequestParam(value="cate", defaultValue="turntables") String cate,
										@RequestParam(value="page", defaultValue="1") int page,
										Model model) {
		// 페이징
		int listCount = productService.productCount();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = PageInfo.builder()
							.listCount(listCount)
							.currentPage(currentPage)
							.pageLimit(pageLimit)
							.boardLimit(boardLimit)
							.maxPage(maxPage)
							.startPage(startPage)
							.endPage(endPage)
							.build();
	
		Map<String, Integer> map = new HashMap();
		
		int startValue	=	(currentPage - 1) * boardLimit + 1;
		int endValue	=	startValue + boardLimit - 1;
		
		map.put("startValue", startValue);
		map.put("endValue", endValue);
		
		// 페이징 map을 이용해 product 전체 가져오기
		List<Product> productList = productService.findAll(map);
		
		model.addAttribute("list", productList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "product/list";
	}
	
	// 검색 기능 (조건 : 상품명, 상품번호 + 페이징)
	@GetMapping("searchProduct")
	public String search(String condition,
						 String keyword,
						 @RequestParam(value="page", defaultValue="1") int page,
						 Model model) {
		
		// 사용자로부터 입력 받은 검색 조건과 키워드 콘솔 출력
		log.info("검색 조건 : {}", condition);
		log.info("검색 키워드 : {}", keyword);
		
		// 페이징
		Map<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		// 검색 결과 수 조회(총 n건)
		int searchCount = productService.searchCount(map);
		log.info("검색 조건에 부합하는 행의 수 : {}", searchCount);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pageInfo = PageTemplate.getPageInfo(searchCount,
													 currentPage,
													 pageLimit,
													 boardLimit);
		
		RowBounds rowBounds = new RowBounds((currentPage - 1) * boardLimit, boardLimit);
		
		List<Product> productList = productService.findByConditionAndKeyword(map, rowBounds);
		
		model.addAttribute("list", productList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		
		return "product/list";
	}
	
	/*
	// 상품 추가
	@PostMapping("/saveProduct")
	public String save(Product product, ProductPhotos productPhoto, MultipartFile upfile, HttpSession session, Model model) {
		
	}
	 */
	
	
}
