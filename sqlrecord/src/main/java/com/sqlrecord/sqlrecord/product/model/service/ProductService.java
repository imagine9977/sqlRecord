package com.sqlrecord.sqlrecord.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sqlrecord.sqlrecord.product.model.vo.Product;

public interface ProductService {

	// 전체 상품 수 조회(페이징)
	int productCount();

	
	List<Product> findAll(String productCate);

	// 검색 결과 수
	int searchCount(Map<String, String> map);
	
	// 상품 검색 결과
	List<Product> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds);


	Product findOne(int productNo);


	
	
	// 상품 1개 조회
	
	
	// 상품 추가
	
	
	// 상품 수정
	
	
	// 상품 삭제 (update status 'Y'->'N')
	

}
