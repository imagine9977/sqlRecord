package com.sqlrecord.sqlrecord.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.product.model.vo.Product;

@Mapper
public interface ProductMapper {

	
	
	public int productCount(SqlSessionTemplate sqlSession);

	public List<Product> findAll(String productCate);

	public int searchCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	public List<Product> findByConditionAndKeyword(SqlSessionTemplate sqlSession, Map<String, String> map,
			RowBounds rowBounds);

	public Product findOne(int productNo);

}
