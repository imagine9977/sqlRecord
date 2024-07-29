package com.sqlrecord.sqlrecord.orders.model.vo;

import java.util.List;

import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.product.model.vo.ProductPhotos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MemberOrdersDetail {
	
	private int memberOrdersDetailNo;                        
	private int memberOrdersDetailAmount;        
	private int memberOrdersDetailPrice;        
	private String memberOrdersDetailExd;  
	private int trackingNum;  
	private String memberOrdersDetailStatus;
	private Product Product;
	private MemberOrders memberOrders;
	
	public List<Product> productList;
}
