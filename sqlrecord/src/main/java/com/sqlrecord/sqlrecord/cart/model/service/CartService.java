package com.sqlrecord.sqlrecord.cart.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;

public interface CartService {

	List<Cart> getCartList(int userid);

	List<Cart> getGuestCartList(int userid);
	
}
