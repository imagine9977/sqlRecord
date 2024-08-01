package com.sqlrecord.sqlrecord.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.orders.model.dto.ProductDTO;
import com.sqlrecord.sqlrecord.product.model.dao.ProductMapper;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class ProductServiceImpl implements ProductService {
	
	
	private final ProductMapper productMapper;
	
	
	
	@Override
	public int productCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> findAll(String productCate) {
		return productMapper.findAll(productCate);
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

	@Override
	public Product findOne(int productNo) {
		return productMapper.findOne(productNo);
	}

	//페이징 조회
	@Override
	public List<ProductDTO> getAllProducts(int startValue, int endValue) {
		return productMapper.getAllProducts(startValue, endValue);
	}
	
	
	// 1개 상품 조회
	
	
	// 상품 추가(Product, ProductPhotos)
	
	
	// 상품 수정
	
	
	// 상품 삭제 (update status 'Y'->'N')
	
	
	
}
