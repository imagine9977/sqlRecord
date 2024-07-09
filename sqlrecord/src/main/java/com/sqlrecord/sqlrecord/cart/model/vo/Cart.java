package com.sqlrecord.sqlrecord.cart.model.vo;

import com.sqlrecord.sqlrecord.orders.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	private int cart_num;
	private Product product;
	private int member_no;
	private int cart_amount;
}
