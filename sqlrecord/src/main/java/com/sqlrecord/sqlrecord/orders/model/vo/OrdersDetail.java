package com.sqlrecord.sqlrecord.orders.model.vo;

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
public class OrdersDetail {
	
	private int orders_detail_no;          
	private int product_no;               
	private int orders_no;               
	private int orders_detail_amount;        
	private int orders_detail_price;        
	private String orders_exchanged;  
	private int tracking_num;        
}
