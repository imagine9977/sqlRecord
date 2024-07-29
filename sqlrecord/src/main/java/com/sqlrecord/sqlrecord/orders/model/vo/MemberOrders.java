package com.sqlrecord.sqlrecord.orders.model.vo;

import java.util.List;

import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberOrders {
	private int memberOrdersNo;
	private String memberOrdersAddress;
	private String memberOrdersAddress2;
	private String memberOrdersPostcode;
	private String memberOrdersDate;
	private int memberNo;
	
	public List<MemberOrdersDetail> memberOrdersDetailList;
	public List<Product> productList;
	private String memberName;
	private String memberAddr1;
	private int totalPrice;	// 상품가격 계산해야 함
}