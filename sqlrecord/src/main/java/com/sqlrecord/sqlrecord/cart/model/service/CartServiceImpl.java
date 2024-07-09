package com.sqlrecord.sqlrecord.cart.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.cart.model.dao.CartMapper;
import com.sqlrecord.sqlrecord.cart.model.vo.Cart;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	
	private final CartMapper cartMapper;
	
	@Override
	public List<Cart> getCartList(int userid) {
		return cartMapper.cartListSelect(userid);
	}

	@Override
	public List<Cart> getGuestCartList(int userid) {
		return cartMapper.guestCartListSelect(userid);
	}
	
	
	
}
