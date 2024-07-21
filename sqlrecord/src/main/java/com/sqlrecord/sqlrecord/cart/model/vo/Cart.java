package com.sqlrecord.sqlrecord.cart.model.vo;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

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
	private int cartNum;
	private int cartAmount;
	private Product product;
	private Member member;
}
