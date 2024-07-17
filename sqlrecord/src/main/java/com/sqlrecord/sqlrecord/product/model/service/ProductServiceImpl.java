package com.sqlrecord.sqlrecord.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.product.model.dao.ProductMapper;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class ProductServiceImpl implements ProductService {@Override
	public int productCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> findAll(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}
	

	/*

	private final ProductMapper productMapper;
	private final SqlSessionTemplate sqlSession;

	// 전체 상품 수 조회
	@Override
	public int productCount() {
		return productMapper.productCount(sqlSession);
	}

	// 전체 상품 조회 (페이징)
	@Override
	public List<Product> findAll(Map<String, Integer> map) {
		return productMapper.findAll(sqlSession, map);
	}

	// 상품 검색 결과 수
	@Override
	public int searchCount(Map<String, String> map) {
		return productMapper.searchCount(sqlSession, map);
	}

	// 상품 검색 결과
	@Override
	public List<Product> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds) {
		return productMapper.findByConditionAndKeyword(sqlSession, map, rowBounds);
	}

	
	
	
	// 1개 상품 조회
	
	
	// 상품 추가(Product, ProductPhotos)
	
	
	// 상품 수정
	
	
	// 상품 삭제 (update status 'Y'->'N')
	
	*/
	
	
}
