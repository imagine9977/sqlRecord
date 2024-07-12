package com.sqlrecord.sqlrecord.orders.model.vo;

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
public class OrdersDetail {
	
           

	private int memberOrdersDetailNo;                        
	private int memberOrdersDetailAmount;        
	private int memberOrdersDetailPrice;        
	private String memberOrdersDetailExd;  
	private int trackingNum;  
	private String memberOrdersDetailStatus;
	private Product product;               
	private MemberOrders memberOrders; 
}
