package com.sqlrecord.sqlrecord.cart.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;

@Mapper
public interface CartMapper {

	List<Cart> cartListSelect(int userid);

	List<Cart> guestCartListSelect(int userid);

}
