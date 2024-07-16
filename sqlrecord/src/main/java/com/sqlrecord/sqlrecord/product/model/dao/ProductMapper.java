package com.sqlrecord.sqlrecord.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.sqlrecord.sqlrecord.product.model.vo.Product;

@Mapper
public class ProductMapper {
/*
	public int productCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.productCount");
	}

	public List<Product> findAll(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectList("productMapper.findAll", map);
	}

	public int searchCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("productMapper.searchCount", map);
	}

	public List<Product> findByConditionAndKeyword(SqlSessionTemplate sqlSession, Map<String, String> map,
			RowBounds rowBounds) {
		return sqlSession.selectList("productMapper.findByConditionAndKeyword", map, rowBounds);
	}
*/
}
